package entities;

import java.sql.ResultSet;
import java.io.*;
import java.sql.*;
import java.util.*;
import oracle.jdbc.*;



public class Feedback implements Serializable{
	
	private String auction;
	private String overallRating;
	private String qualityRating;
	private String deliveryRating;
	private String comments;

	public void createFeedback(String auction, String overallRating, String qualityRating, String deliveryRating, String comments){
	
	}
	public ResultSet getFeedback(String username) throws IllegalStateException{
		return null;
	}
}
