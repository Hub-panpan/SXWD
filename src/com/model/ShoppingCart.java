package com.model;

public class ShoppingCart {

	  private int	 cart_id;
	  private String food_id;     //加入购物车食物id
	  private String food_name;
	  private float  food_price;  
	  private int	order_number;
	  private String member_phone;

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
}
