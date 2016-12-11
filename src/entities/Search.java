package entities;

public class Search {
	String itemId;
	String keyword;
	String category;
	double currentBidMin;
	double currentBidMax;
	String timePeriodStart;
	String timePeriodEnd;
	
	public Search() {}
	public Search(String itemId, String keyword, String category, 
			double currentBidMin, double currentBidMax, String timePeriodStart, String timePeriodEnd) {
		this.itemId = itemId;
		this.keyword = keyword;
		this.category = category;
		this.currentBidMax = currentBidMax;
		this.timePeriodStart = timePeriodStart;
		this.timePeriodEnd = timePeriodEnd;
	}
}
