package com.model;

import java.io.Serializable;

public class ShoppingOrder implements Serializable {
	  private int	 order_id;
	  private String food_id;     //���빺�ﳵʳ��id
	  private String food_name;
	  private float  food_price;  
	  private int	order_number;
	  private float sum_price;
	  private String member_phone;
	  private String order_date;
	  private int	 order_state;
	  private String order_code;
	  
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public float getFood_price() {
		return food_price;
	}
	public void setFood_price(float food_price) {
		this.food_price = food_price;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public float getSum_price() {
		return sum_price;
	}
	public void setSum_price(float sum_price) {
		this.sum_price = sum_price;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
}
