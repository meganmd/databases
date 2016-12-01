
public class Bid {

	private static int auctionid;

	private static String customer;

	private static String time;

	private static int maximumBidLimit;

	public static int getAuctionid() {
		return auctionid;
	}

	public static void setAuctionid(int auctionid) {
		Bid.auctionid = auctionid;
	}

	public static String getCustomer() {
		return customer;
	}

	public static void setCustomer(String customer) {
		Bid.customer = customer;
	}

	public static String getTime() {
		return time;
	}

	public static void setTime(String time) {
		Bid.time = time;
	}

	public static int getMaximumBidLimit() {
		return maximumBidLimit;
	}

	public static void setMaximumBidLimit(int maximumBidLimit) {
		Bid.maximumBidLimit = maximumBidLimit;
	}
	
}