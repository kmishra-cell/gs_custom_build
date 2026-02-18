



public class MTNSecRef extends SecRefTemplate 
{
	@Override
	public String getBBTicker() 
	{
		return this.identifier;
	}
	
	public String getDescriptiveElement()
	{
		String descriptiveElement = "";
		
		if ( "Treasury CD".equals(bondStructure))
		{ 
		  if (couponType != null)
		  {
			 switch (couponType)
			 {
				 case FIXED:
					descriptiveElement = "CD"+super.getDescriptiveElement();
					break;
				 case VARIABLE:
					descriptiveElement = "CDVAR";
					break;
				 case FLOATING:
					descriptiveElement = "CDFRN";
					break;
				 case ZEROCOUPON:
					descriptiveElement = super.getDescriptiveElement();
					break;
			 }
		  }
		}
		else if (couponType != null)
		{
		
			switch (couponType)
			{
				case FIXED:
					descriptiveElement = "MTN"+super.getDescriptiveElement();
					break;
				case VARIABLE:
					descriptiveElement = "MTNVAR";
					break;
				case FLOATING:
					descriptiveElement = "MTNFRN";
					break;
				case ZEROCOUPON:
					descriptiveElement = super.getDescriptiveElement();
					break;
			}
		} 
		else
			descriptiveElement = super.getDescriptiveElement();
		
		return descriptiveElement;
	}
}
