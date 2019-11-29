package com.cart;

public class CartDTO {
	
	private String id;
	private String c_name;
	private int c_num;
	private int c_price;
	private int c_inwon;
	private int num;
	private String c_check;
	
	public String getC_check() {
		return c_check;
	}
	public void setC_check(String c_check) {
		this.c_check = c_check;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public int getC_inwon() {
		return c_inwon;
	}
	public void setC_inwon(int c_inwon) {
		this.c_inwon = c_inwon;
	}
}