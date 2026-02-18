


public class EquitySecRef extends SecRefTemplate 
{
	@Override
	protected String getBBTicker() 
	{
		String ticker ="";
		
		if("JPY".equals(denominationCurrency) || "JPY".equals(denominationCurrencyForUnderlying))
		{
			if ("RECEIPTS".equals(subType) || "WARRANTS".equals(subType))
			{
				ticker = this.identifierForUnderlying;
			}
			else 
			{
				ticker = this.identifier;
			}
			
		}
		else
		{
			if ("RECEIPTS".equals(subType) || "WARRANTS".equals(subType))
			{
				ticker = this.issuerClientRefForUnderlying;
			}
			else if ("INDEX".equals(subType))
			{
				ticker = this.identifier;
			}
			else if ("FUND".equals(subType)) // EG-7604
			{
				ticker = this.issuer.replaceAll("\\s+","").toUpperCase().substring(0,8);
				
			}
			else if ("FUND".equals(subType) || "MISC".equals(subType)) // EG-7604
			{
				ticker = this.issuerClientRef;
				
			}
			else
			{
				ticker = this.issuerClientRef;
			}
		}
		
		return ticker;
	}

	@Override
	public String getDescriptiveElement() 
	{
		String description = "";
		if("COMMON".equals(subType) || "EQSHR".equals(subType)
				|| "FUND".equals(subType) || "MISC".equals(subType) || "ETF".equals(subType)) // EG-7604
		{
			description = "SH";
		}
		else if ("RECEIPTS".equals(subType))
		{
			description = "DRSH";
		}
		else if("WARRANTS".equals(subType))
		{
			description = (this.coverer == null) ? "WT" : "CWT";
		}
		else if("PFD".equals(subType))
		{
			description = "PRFSH";
		}
		else if("INDEX".equals(subType))
		{
			description = getSeries();
		}
		return description;
	}

	@Override
	protected String getDate() {
		if("WARRANTS".equals(subType))
		{
			return super.getDate();
		}
		return "";
	}

	@Override
	protected String getSuffix() 
	{
		if("WARRANTS".equals(subType) && "JPY".equals(denominationCurrencyForUnderlying))
		{
			String suffix = mappingForCoverer.get(coverer);
			
			return suffix == null ? "" : suffix;			
		}
		return "";
	}
	
	
}
