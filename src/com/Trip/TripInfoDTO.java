package com.Trip;

public class TripInfoDTO {
	
	private int num; //��ǰ��ȣ
	private String conti;
	private String country;
	private String title; //��ǰ�̸�
	private String content; //��ǰ����
	private String price;
	private int inwon; //�ο�����
	private String startdate;
	private String enddate;
	private String event; //�Ϲݻ�ǰ/Ư����ǰ/��Ÿ��ǰ ���п�
	private String guide; //��ǰ�� ��� ���̵�� 
	private int count;
	private String filename;
	
	
	public String getConti() {
		return conti;
	}
	public void setConti(String conti) {
		this.conti = conti;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
		
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	
	
}
