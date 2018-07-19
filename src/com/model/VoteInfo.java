package com.model;

public class VoteInfo {

	
	private String member_phone;
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getVote_id() {
		return vote_id;
	}
	public void setVote_id(int vote_id) {
		this.vote_id = vote_id;
	}
	public String getVote_name() {
		return vote_name;
	}
	public void setVote_name(String vote_name) {
		this.vote_name = vote_name;
	}
	public String getOption_value() {
		return option_value;
	}
	public void setOption_value(String option_value) {
		this.option_value = option_value;
	}
	public String getVote_time() {
		return vote_time;
	}
	public void setVote_time(String vote_time) {
		this.vote_time = vote_time;
	}
	private int vote_id;
	private String vote_name;
	private String option_value;
	private String vote_time;
	
	
	
	
}
