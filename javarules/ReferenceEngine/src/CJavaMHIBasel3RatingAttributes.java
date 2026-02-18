import org.apache.log4j.Logger;


//class for passing rating attributes back from methods
public class CJavaMHIBasel3RatingAttributes {
    private final static Logger logger = Logger.getLogger("CJavaMHIBasel3RatingAttributes");

    String ratingCode;
    String vendor;
    String ratingOid;
    String ratingValueOid;
    String ratingCqsNum;
    String rtngDerivationPath;

    public CJavaMHIBasel3RatingAttributes(String a, String b, String c, String d, String e) {
        this.ratingCode = a;
        this.vendor = b;
        this.ratingOid = c;
        this.ratingValueOid = d;
        this.ratingCqsNum = e;
        this.rtngDerivationPath="";
    }
    
    public CJavaMHIBasel3RatingAttributes(String a, String b, String c, String d, String e, String f) {
        this.ratingCode = a;
        this.vendor = b;
        this.ratingOid = c;
        this.ratingValueOid = d;
        this.ratingCqsNum = e;
        this.rtngDerivationPath=f;
    }
    
    public CJavaMHIBasel3RatingAttributes() {
	}

	public String getAttributesString() {
        return "Ratings Attributes: ratingCode = " + this.ratingCode + " vendor = " + this.vendor + " ratingOid = " + this.ratingOid+ " ratingCqsNum = " + this.ratingCqsNum+ " rtngDerivationPath = " + this.rtngDerivationPath;
    }
    public boolean isEmpty() {
        if (this.ratingCode == "" || this.ratingCode == null)
            return true;
        else
            return false;
    }
}