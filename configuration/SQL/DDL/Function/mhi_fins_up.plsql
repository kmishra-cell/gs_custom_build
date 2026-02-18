-- DROP FUNCTION gc_own.mhi_fins_up(text);

CREATE OR REPLACE FUNCTION gc_own.mhi_fins_up(p_inst_mnem text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_inst_mnem text;
BEGIN
    -- First hierarchical traversal: Equivalent to Oracle's inner START WITH...CONNECT BY
    -- This CTE finds all ancestors based on specified relationship types and filters
    -- for the preferred relationship using RANK().
    WITH RECURSIVE ffrl_ancestors AS (
        -- Anchor member: Start with the input p_inst_mnem
        SELECT
            ffrl.prnt_inst_mnem,
            ffrl.inst_mnem,
            ffrl.rel_typ,
            ffrl.end_tms,
            -- Explicitly cast the array to text[] to ensure consistent type across the recursive CTE
            ARRAY[ffrl.inst_mnem]::text[] AS path_trace, -- Track path to prevent cycles (NOCYCLE)
            ffrl.inst_mnem AS prev_inst_mnem_for_check -- To emulate Oracle's PRIOR ffrl.inst_mnem
        FROM
            ft_t_ffrl ffrl
        WHERE
            ffrl.inst_mnem = p_inst_mnem
            AND ffrl.end_tms IS NULL
            AND ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT')

        UNION ALL

        -- Recursive member: Traverse upwards to find parents
        SELECT
            ffrl_rec.prnt_inst_mnem,
            ffrl_rec.inst_mnem,
            ffrl_rec.rel_typ,
            ffrl_rec.end_tms,
            fa.path_trace || ffrl_rec.inst_mnem,
            fa.inst_mnem -- Pass current inst_mnem as prev_inst_mnem for the next iteration
        FROM
            ft_t_ffrl ffrl_rec
        INNER JOIN ffrl_ancestors fa ON
            ffrl_rec.inst_mnem = fa.prnt_inst_mnem -- Connect current record's inst_mnem to previous record's prnt_inst_mnem (upward traversal)
        WHERE
            ffrl_rec.end_tms IS NULL
            AND ffrl_rec.rel_typ IN ('PARNTCOF', 'MHIPARNT')
            -- Explicitly cast the array literal to text[] for the @> operator
            AND NOT (fa.path_trace @> ARRAY[ffrl_rec.inst_mnem]::text[]) -- Prevent cycles (NOCYCLE)
            AND ffrl_rec.prnt_inst_mnem IS NOT NULL -- Stop if no more parent
            -- Equivalent to Oracle's "ffrl.prnt_inst_mnem != PRIOR ffrl.inst_mnem"
            -- This prevents connecting back to the immediate child in the previous step
            AND ffrl_rec.prnt_inst_mnem != fa.inst_mnem
    ),
    -- Join with ft_t_fiid to get secref and psecref for all found ancestors
    fins_with_fiid AS (
        SELECT DISTINCT
            fa.prnt_inst_mnem,
            fa.inst_mnem,
            fa.rel_typ,
            pa_se_fiid.fins_id AS psecref,
            ch_se_fiid.fins_id AS secref
        FROM
            ffrl_ancestors fa
        LEFT OUTER JOIN ft_t_fiid ch_se_fiid ON
            ch_se_fiid.inst_mnem = fa.inst_mnem
            AND ch_se_fiid.fins_id_ctxt_typ = 'SECOREFE'
            AND ch_se_fiid.end_tms IS NULL
        LEFT OUTER JOIN ft_t_fiid pa_se_fiid ON
            pa_se_fiid.inst_mnem = fa.prnt_inst_mnem
            AND pa_se_fiid.fins_id_ctxt_typ = 'SECOREFE'
            AND pa_se_fiid.end_tms IS NULL
    ),
    -- Apply RANK() to select the preferred relationship for each inst_mnem,
    -- creating the 'HIERARCHY' CTE equivalent from Oracle
    hierarchy_filtered AS (
        SELECT
            prnt_inst_mnem,
            inst_mnem,
            rel_typ,
            psecref,
            secref
        FROM
            (
            SELECT
                ffd.*,
                RANK() OVER (PARTITION BY ffd.inst_mnem ORDER BY CASE ffd.rel_typ WHEN 'MHIPARNT' THEN 1 WHEN 'PARNTCOF' THEN 2 ELSE 3 END ASC) AS rank_num
            FROM
                fins_with_fiid ffd
            ) ranked_data
        WHERE
            ranked_data.rank_num = 1
    ),
    -- Second hierarchical traversal: Traverse the 'hierarchy_filtered' CTE
    -- This emulates the outer START WITH...CONNECT BY and its complex conditions
    final_path_traversal AS (
        -- Anchor member: Start again with the input p_inst_mnem in the filtered hierarchy
        SELECT
            hf.prnt_inst_mnem,
            hf.inst_mnem,
            hf.rel_typ,
            hf.psecref,
            hf.secref,
            ARRAY[hf.inst_mnem]::text[] AS path_trace, -- Explicitly cast here too for consistency
            1 AS level_num -- Track level to find the highest ancestor (CONNECT_BY_ISLEAF)
        FROM
            hierarchy_filtered hf
        WHERE
            hf.inst_mnem = p_inst_mnem

        UNION ALL

        -- Recursive member: Continue traversing upwards based on the complex CASE condition
        SELECT
            hf_rec.prnt_inst_mnem,
            hf_rec.inst_mnem,
            hf_rec.rel_typ,
            hf_rec.psecref,
            hf_rec.secref,
            fpt.path_trace || hf_rec.inst_mnem,
            fpt.level_num + 1
        FROM
            hierarchy_filtered hf_rec
        INNER JOIN final_path_traversal fpt ON
            hf_rec.inst_mnem = fpt.prnt_inst_mnem -- Connect upwards
        WHERE
            -- Explicitly cast the array literal to text[] for the @> operator
            NOT (fpt.path_trace @> ARRAY[hf_rec.inst_mnem]::text[]) -- Prevent cycles (NOCYCLE)
            AND hf_rec.prnt_inst_mnem IS NOT NULL -- Stop if no more parent
            -- Equivalent to Oracle's "prnt_inst_mnem != PRIOR inst_mnem"
            AND hf_rec.prnt_inst_mnem != fpt.inst_mnem
            -- Translate Oracle's complex CONNECT BY CASE condition:
            -- (PRIOR hierarchy.rel_typ = 'MHIPARNT') OR (PRIOR hierarchy.secref IS NULL AND PRIOR hierarchy.rel_typ = 'PARNTCOF')
            AND (
                (fpt.rel_typ = 'MHIPARNT')
                OR
                (fpt.secref IS NULL AND fpt.rel_typ = 'PARNTCOF')
            )
    )
    -- Select the final inst_mnem from the highest ancestor found (equivalent to CONNECT_BY_ISLEAF)
    SELECT
        CASE
            WHEN fpt.rel_typ = 'MHIPARNT' THEN fpt.PRNT_INST_MNEM
            WHEN fpt.SECREF IS NULL AND fpt.PSECREF IS NOT NULL THEN fpt.PRNT_INST_MNEM
            ELSE fpt.inst_mnem
        END
    INTO
        v_inst_mnem
    FROM
        final_path_traversal fpt
    ORDER BY
        fpt.level_num DESC -- Order by level to get the highest ancestor
    LIMIT 1; -- Take only the highest ancestor

    -- Handle NO_DATA_FOUND: If no row was found, v_inst_mnem will be NULL.
    -- In that case, return the original p_inst_mnem.
    RETURN COALESCE(v_inst_mnem, p_inst_mnem);

END;
$function$
;
