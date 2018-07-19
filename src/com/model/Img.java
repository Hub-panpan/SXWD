package com.model;

public class Img {

	private int img_id;//数据库设置自增长
	private String img_name;
	private String food_idString;
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getFood_idString() {
		return food_idString;
	}
	public void setFood_idString(String food_idString) {
		this.food_idString = food_idString;
	}
	
}
