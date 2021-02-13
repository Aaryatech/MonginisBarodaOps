package com.monginis.ops.model;
 

public class CustomerListForDash {
	 
	private String id; 
	private String spCustName; 
	private String spCustMobNo; 
	private float spGrandTotal; 
	private String spBookForMobNo; 
	private float spSelectedWeight;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSpCustName() {
		return spCustName;
	}
	public void setSpCustName(String spCustName) {
		this.spCustName = spCustName;
	}
	public String getSpCustMobNo() {
		return spCustMobNo;
	}
	public void setSpCustMobNo(String spCustMobNo) {
		this.spCustMobNo = spCustMobNo;
	}
	public float getSpGrandTotal() {
		return spGrandTotal;
	}
	public void setSpGrandTotal(float spGrandTotal) {
		this.spGrandTotal = spGrandTotal;
	}
	public String getSpBookForMobNo() {
		return spBookForMobNo;
	}
	public void setSpBookForMobNo(String spBookForMobNo) {
		this.spBookForMobNo = spBookForMobNo;
	}
	public float getSpSelectedWeight() {
		return spSelectedWeight;
	}
	public void setSpSelectedWeight(float spSelectedWeight) {
		this.spSelectedWeight = spSelectedWeight;
	}
	@Override
	public String toString() {
		return "CustomerListForDash [id=" + id + ", spCustName=" + spCustName + ", spCustMobNo=" + spCustMobNo
				+ ", spGrandTotal=" + spGrandTotal + ", spBookForMobNo=" + spBookForMobNo + ", spSelectedWeight="
				+ spSelectedWeight + "]";
	}
	
	

}
