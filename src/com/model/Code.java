package com.model;

public class Code {

	
	private int code_id;
	private String order_code;
	private String member_phone;
	private int order_state;
	public int getCode_id() {
		return code_id;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public void setCode_id(int code_id) {
		this.code_id = code_id;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	
}
