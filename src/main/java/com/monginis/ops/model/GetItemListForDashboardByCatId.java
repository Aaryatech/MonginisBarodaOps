package com.monginis.ops.model;
 

public class GetItemListForDashboardByCatId {
	 
	private int itemId; 
	private String qty; 
	private float total; 
	private String itemName;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	@Override
	public String toString() {
		return "GetItemListForDashboardByCatId [itemId=" + itemId + ", qty=" + qty + ", total=" + total + ", itemName="
				+ itemName + "]";
	}
	
	

}
