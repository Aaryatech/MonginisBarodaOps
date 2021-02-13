package com.monginis.ops.model;
 

public class DateWiseDashboardGraphQuery {
	 
	private String id; 
	private String billDate; 
	private float total;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "DateWiseDashboardGraphQuery [id=" + id + ", billDate=" + billDate + ", total=" + total + "]";
	}

	
}
