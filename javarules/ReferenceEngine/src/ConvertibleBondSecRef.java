

public class ConvertibleBondSecRef extends SecRefTemplate 
{
	@Override
	public String getBBTicker() 
	{
		String identifierPart = "";
		if("JPY".equals(denominationCurrencyForUnderlying))
		{
			if("JPY".equals(denominationCurrency))
			{
				if(isin.startsWith("JP"))
				{
					identifierPart = identifierForUnderlying + "#"+series;
				}
				else
				{
					identifierPart = identifierForUnderlying + "CB";
				}	
			}
			else
			{
				identifierPart = identifierForUnderlying + "CB";
			}
		}
		else
		{
			identifierPart = this.identifier;
		}
		return identifierPart;
	}
	
	@Override
	public String getDescriptiveElement()
	{
		if(CouponType.VARIABLE.equals(couponType))
		{
			return "VAR";
		}
		else if (CouponType.STEPCOUPON.equals(couponType))
		{
			return super.getDescriptiveElement()+ "CONV";
		}
		else if(!"JPY".equals(denominationCurrencyForUnderlying))
		{
			return super.getDescriptiveElement()+ "CONVCB";
		}
		return "";
	}
	
	@Override
	public String getDate()
	{
		if("JPY".equals(denominationCurrency) && "JPY".equals(denominationCurrencyForUnderlying))
		{
			if(isin.startsWith("JP"))
			{
				return "";
			}
		}
		return super.getDate();
	}
}
