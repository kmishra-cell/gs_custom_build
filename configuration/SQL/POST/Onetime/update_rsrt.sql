update ft_t_rsrt 
set file_id=replace(file_id,'sftp://dl781939@lftpny.bloomberg.com','sftp://app@mizprdapp/gold/GSFTP/files/bloomberg')
where file_id like '%sftp://dl781939@lftpny.bloomberg.com%' 
and file_tms > date_trunc('day', now())::timestamp - interval '100 days';