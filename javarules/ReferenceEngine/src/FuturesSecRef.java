

import java.text.SimpleDateFormat;
/**
 * This class deals with the derivation for the following asset classes
 * 
 *  - FUTURES
 *  
 * @author tydise
 *
 */

public class FuturesSecRef extends SecRefTemplate 
{
	
	@Override
	protected String getBBTicker() 
	{
		return this.identifier;  
	}
	
	@Override
	public String getDescriptiveElement() 
	{
		return "";
	}

	@Override
	protected String getDate()
	{
		SimpleDateFormat sdfMaturityYear = new SimpleDateFormat("yy");
		if(maturityDate != null)
		{
			calendar.setTime(maturityDate);
			return sdfMaturityYear.format(calendar.getTime());
			
		}			
		return super.getDate();
	}
	
	
}
