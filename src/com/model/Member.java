package com.model;

public class Member {
	private String member_phone;
	private String member_name;
	private String member_password;
	private String member_address;
	private float    member_points ;
	private int    member_rights ;
	
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String  member_phone ) {
		this.member_phone = member_phone ;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	
	
	
	public float getMember_points() {
		return member_points;
	}
	public void setMember_points(float member_points) {
		this.member_points = member_points;
	}
	public int getMember_rights() {
		return member_rights;
	}
	public void setMember_rights(int member_rights) {
		this.member_rights = member_rights;
	}
	
	
}
