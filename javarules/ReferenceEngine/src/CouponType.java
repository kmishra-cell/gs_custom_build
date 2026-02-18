

import java.util.HashMap;
import java.util.Map;

public enum CouponType 
{
	FIXED("FIXED"),VARIABLE("VARIABLE"),FLOATING("FLOATING"),STEPCOUPON("STEP COUPON"),ZEROCOUPON("ZERO COUPON");
	
	private String type;
	private static final Map<String,CouponType> lookup = new HashMap<String,CouponType>();
	 static 
	 {
	     for(CouponType d : CouponType.values())
	         lookup.put(d.getType(), d);
	 }	
	
	CouponType(String type)
	{
		this.type = type;
	}
	
	public String getType()
	{
		return type;
	}
	
    public static CouponType get(String type) 
    { 
          return lookup.get(type); 
     }	
}
