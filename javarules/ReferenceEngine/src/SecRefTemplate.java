

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

public abstract class SecRefTemplate 
{
	//data for the issue
	protected String assetType;
	protected String subType;
	protected Date maturityDate;
	protected String identifier;
	protected String isin;
	protected String series;
	//protected String quickCode;
	protected double couponRate = 0.0;
	protected CouponType couponType;
	protected String denominationCurrency;
	protected String coverer;
	protected String issuer;
	protected boolean japaneseGovt = false;
	protected String issuerClientRef;
	protected String bondStructure;
	protected Map<String,String> mappingForCoverer = new HashMap<String, String>();
	
	//data from the underlying issue
	protected String identifierForUnderlying;
	protected String denominationCurrencyForUnderlying;
	protected String issuerClientRefForUnderlying;
	
	Map<Double, Integer> decToFractions = new HashMap<Double, Integer>();
	Calendar calendar = new GregorianCalendar();
	SimpleDateFormat sdf = new SimpleDateFormat("ddMMyy");
	static DecimalFormat df = new DecimalFormat("#.00");
	
	protected abstract String getBBTicker();
	
	public final String generateSecRefLiterals()
	{
		String ticker = getBBTicker();
		StringBuilder secRefWithoutTicker = new StringBuilder(getDescriptiveElement()).append(getDate()).append(getSuffix());
		String secRefLiteral = ticker + secRefWithoutTicker;
		if(secRefLiteral.length() > 15)
		{
			ticker = ticker.replaceAll("[AaEeIiOoUu]","");
			secRefLiteral = ticker + secRefWithoutTicker;
			if(secRefLiteral.length() > 15)
				secRefLiteral = ticker.substring(0,15-secRefWithoutTicker.length()) + secRefWithoutTicker;
		}
		return secRefLiteral.toString();
	}
	
	protected String getDate()
	{
		if(maturityDate != null)
		{
			calendar.setTime(maturityDate);
			
			//return String.valueOf(calendar.get(Calendar.YEAR)).substring(2,4); cauisng the IOB error
			
			return String.format("%02d", calendar.get(Calendar.YEAR) % 100);

		}
		return "";
	}
	
	protected String getSuffix()
	{
		return "";
	}
	
	public void setDate(Date mDate)
	{
		this.maturityDate = mDate;
	}	
	
	public void setIdentifier(String Id)
	{
		this.identifier = Id;
	}

	public String getIdentifier() {
		return identifier;
	}
	
	protected String getDescriptiveElement()
	{
		String finalDescription = "";
		int fraction = -1;
		int wholePart = (int) couponRate;
		double decimal = (double)(couponRate - (int)couponRate);
		if(decToFractions.size() > 0 && decToFractions.get(decimal) != null)
			fraction = decToFractions.get(decimal);
		
		if(fraction < 0)
		{
			//formatedDecimal = (int) (decimal*100);
			String decimalPart = df.format(decimal);
			String[] decs = decimalPart.split("\\.");
			if(decs.length > 1)
				decimalPart = decs[1];
			
			finalDescription = wholePart+decimalPart;
		}
		else
		{
			finalDescription = wholePart+String.valueOf(fraction);
		}
			
		return finalDescription;
	}

	public double getCouponRate() {
		return couponRate;
	}

	public void setCouponRate(double couponRate) {
		this.couponRate = couponRate;
	}

	public Map<Double, Integer> getDecToFractions() {
		return decToFractions;
	}

	public void setDecToFractions(Map<Double, Integer> decToFractions) {
		this.decToFractions = decToFractions;
	}

	public CouponType getCouponType() {
		return couponType;
	}

	public void setCouponType(CouponType couponType) {
		this.couponType = couponType;
	}

	public String getDenominationCurrency() {
		return denominationCurrency;
	}

	public void setDenominationCurrency(String denominationCurrency) {
		this.denominationCurrency = denominationCurrency;
	}

	public String getUnderlyingDenominationCurrency() {
		return denominationCurrencyForUnderlying;
	}

	public void setUnderlyingDenominationCurrency(String underlyingDenominationCurrency) {
		this.denominationCurrencyForUnderlying = underlyingDenominationCurrency;
	}

	public String getAssetType() {
		return assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getIssuerClientRef() {
		return issuerClientRef;
	}

	public void setIssuerClientRef(String isseuerClientRef) {
		this.issuerClientRef = isseuerClientRef;
	}

	public String getIdentifierForUnderlying() {
		return identifierForUnderlying;
	}

	public void setIdentifierForUnderlying(String identifierForUnderlying) {
		this.identifierForUnderlying = identifierForUnderlying;
	}

	public String getIssuerClientRefForUnderlying() {
		return issuerClientRefForUnderlying;
	}

	public void setIssuerClientRefForUnderlying(String issuerClientRefForUnderlying) {
		this.issuerClientRefForUnderlying = issuerClientRefForUnderlying;
	}

	public String getCoverer() {
		return coverer;
	}

	public void setCoverer(String coverer) {
		this.coverer = coverer;
	}

	public Map<String, String> getMappingForCoverer() {
		return mappingForCoverer;
	}

	public void setMappingForCoverer(Map<String, String> mappingForCoverer) {
		this.mappingForCoverer = mappingForCoverer;
	}

	public String getIssuer() {
		return issuer;
	}

	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}

	public String getIsin() {
		return isin;
	}

	public void setIsin(String isin) {
		this.isin = isin;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}
	
	public String getBondStructure() {
		return bondStructure;
	}
	
	public void setBondStructure(String bondStructure) {
		this.bondStructure = bondStructure ;
		
	}
	
	/*	
	public String getQuickCode() {
		return quickCode;
	}

	public void setQuickCode(String quickCode) {
		this.quickCode = quickCode;
	}
	*/
	@Override
	public String toString() {
		return "SecRefTemplate [assetType=" + assetType + ", calendar="
				+ calendar + ", couponRate=" + couponRate + ", couponType="
				+ couponType + ", coverer=" + coverer + ", decToFractions="
				+ decToFractions + ", denominationCurrency="
				+ denominationCurrency + ", denominationCurrencyForUnderlying="
				+ denominationCurrencyForUnderlying + ", identifier="
				+ identifier + ", identifierForUnderlying="
				+ identifierForUnderlying + ", isin=" + isin + ", issuer="
				+ issuer + ", issuerClientRef=" + issuerClientRef
				+ ", issuerClientRefForUnderlying=" + issuerClientRefForUnderlying + 
				", japaneseGovt=" + japaneseGovt + ", mappingForCoverer="
				+ mappingForCoverer + ", maturityDate=" + maturityDate
				+ ", series=" + series + ", subType=" + subType + "]";
	}

		
}
