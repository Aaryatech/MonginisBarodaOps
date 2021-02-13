package com.monginis.ops.model;
 

public class CatWiseDashboardQuery {
	 
	private String id; 
	private String catName; 
	private float total; 
	private int catId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	@Override
	public String toString() {
		return "CatWiseDashboardQuery [id=" + id + ", catName=" + catName + ", total=" + total + ", catId=" + catId
				+ "]";
	}
	
	

}
