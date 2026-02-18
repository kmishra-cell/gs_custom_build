
/**
 * This class deals with the derivation for the following asset classes
 * 
 *  - JGB
 *  - US T-Bills
 *  - Vanila Bonds
 *  - FRN
 *  - CP
 *  - CD
 *  - ECP
 *  
 * @author gopasa
 *
 */

public class BondSecRef extends SecRefTemplate 
{
	
	@Override
	protected String getBBTicker() 
	{
		if(japaneseGovt)
		{
			return "JGB";
		}
		else if ("USA".equals(issuer) && "B".equals(this.identifier))
		{
			return "TB";
		}
		return this.identifier;  
	}
	
	@Override
	public String getDescriptiveElement() 
	{
		if(japaneseGovt)
		{
			if(series != null)
			{
				int size = series.length();
				if(size > 2)
				{
					return series.substring(0,3);
				}
				else if(size > 0)
				{
					return String.format("%03d",Integer.parseInt(series.substring(0,size)));
				}
			}
			return "000";
		}
		else if("USA".equals(issuer))
		{
			return "";
		}
		else if(CouponType.FLOATING.equals(couponType))
		{
			return "FRN";
		}
		else if("COML PPR".equals(subType))
		{
			return "CP";
		}
		else if ( "CERTDEPT".equals(subType))
		{
			return "CD";
		}
		return super.getDescriptiveElement();
	}

	@Override
	protected String getDate()
	{
		if("COML PPR".equals(subType) || "CERTDEPT".equals(subType) || "USA".equals(issuer))
		{
			if(maturityDate != null)
			{
				calendar.setTime(maturityDate);
				return sdf.format(calendar.getTime());
			}			
		}
		return super.getDate();
	}
	
	
}
