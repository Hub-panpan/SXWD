package com.model;

public class Remark {
     private int remark_id;
     private String remark_content;
     
	
	 
     private String food_id;
     private String member_id;
     private String remark_date;
     
     
     private int isPass;
     
     
	 public int getRemark_id() {
		return remark_id;
	}
	public void setRemark_id(int remark_id) {
		this.remark_id = remark_id;
	}
	public String getRemark_content() {
		return remark_content;
	}
	public void setRemark_content(String remark_content) {
		this.remark_content = remark_content;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getRemark_date() {
		return remark_date;
	}
	public void setRemark_date(String remark_date) {
		this.remark_date = remark_date;
	}
	public int getIsPass() {
		return isPass;
	}
	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
     
     
     
     
}
