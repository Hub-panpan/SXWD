package com.model;

public class FoodsPage {
	private int totalcount;//������
	private int count=6;//����Ĭ����ʾ�� ����Ϊ10��
	private int totalpage;//��ҳ��
	private int pagecount;//  �´β�ѯ����ʼֵ
	
	private int currentpage;
	
	
	
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	
	
	
	
}
