package mmdaly.entities;

import java.sql.*;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;

public class Search {
	String itemId;
	String keyword;
	String category;
	double currentBidMin = -1;
	double currentBidMax = -1;
	String timePeriodStart;
	String timePeriodEnd;
	
	public Search() {}
	public Search(String itemId, String keyword, String category, 
			double currentBidMin, double currentBidMax, String timePeriodStart, String timePeriodEnd) {
		this.itemId = itemId;
		this.keyword = keyword;
		this.category = category;
		this.currentBidMin = currentBidMin;
		this.currentBidMax = currentBidMax;
		this.timePeriodStart = timePeriodStart;
		this.timePeriodEnd = timePeriodEnd;
	}
	
	public ResultSet searchDatabase() {
		System.out.println("working...");
		try {
			PreparedStatement stmt = formulateQuery();
			
			ResultSet rs = stmt.executeQuery();
			return rs;
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private PreparedStatement formulateQuery() {
		Connection con = DatabaseConnection.openDBConnection();
		ArrayList<String> conditions = new ArrayList<>();
		ArrayList<String> conditionValues = new ArrayList<>();
		if(itemId != null) {
			conditions.add("item_id = ?");
			conditionValues.add(this.itemId);			
		}
		if(keyword != null) {
			conditions.add("item_name like ? OR item_description like ? ");
			conditionValues.add("%" + this.keyword + "%");
			conditionValues.add("%" + this.keyword + "%");
		}
		if(category != null) {
			conditions.add("item_category = ?");
			conditionValues.add(this.category);
		}
		if(currentBidMax != -1) {
			conditions.add("current_bid <= ?");
			conditionValues.add(Double.toString(this.currentBidMax));
		}
		if(currentBidMin != -1) {
			conditions.add("current_bid >= ?");
			conditionValues.add(Double.toString(this.currentBidMin));
		}
		if(timePeriodStart != null) {
			conditions.add("start_time >= ?");
			conditionValues.add(this.timePeriodStart);
		}
		if(timePeriodEnd != null) {
			conditions.add("end_time <= ?");
			conditionValues.add(this.timePeriodEnd);
		}
		
		StringBuilder sql = new StringBuilder("SELECT item_id, item_name, item_category, start_time, end_time, "
				+ "current_bid, starting_price "
				+ "FROM expanded_auction ");
		
		if (!conditions.isEmpty()) {
			sql.append("where ");
			int i = 0;
			while (i < conditions.size()) {
				sql.append(conditions.get(i));
				i++;
				if(i < conditions.size()) {
					sql.append(" and ");
				}
			}
		}
		//sql.append(";");
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql.toString());
			
			System.out.println("query: ");
			System.out.println(sql.toString());
			System.out.println(conditionValues.toString());
			int i = 1;
			while(i <= conditionValues.size()) {
		        System.out.println("i: " + i);
				stmt.setString(i, conditionValues.get(i-1));
				i++;
			}
			return stmt;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getCurrentBidMin() {
		return currentBidMin;
	}
	public void setCurrentBidMin(double currentBidMin) {
		this.currentBidMin = currentBidMin;
	}
	public double getCurrentBidMax() {
		return currentBidMax;
	}
	public void setCurrentBidMax(double currentBidMax) {
		this.currentBidMax = currentBidMax;
	}
	public String getTimePeriodStart() {
		return timePeriodStart;
	}
	public void setTimePeriodStart(String timePeriodStart) {
		this.timePeriodStart = timePeriodStart;
	}
	public String getTimePeriodEnd() {
		return timePeriodEnd;
	}
	public void setTimePeriodEnd(String timePeriodEnd) {
		this.timePeriodEnd = timePeriodEnd;
	}
}
