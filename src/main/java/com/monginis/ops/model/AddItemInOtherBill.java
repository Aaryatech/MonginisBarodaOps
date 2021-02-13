package com.monginis.ops.model;

public class AddItemInOtherBill {

	private int id;
	private String itemId;
	private String itemName;
	private Integer itemGrp1;
	private float itemRate1;
	private Integer qty;
	private float baseRate;
	private float discPer;
	private float discAmt;
	private float taxableAmt;
	private float itemMrp1;
	private float itemTax1;
	private float itemTax2;
	private float itemTax3;
	private float itemTax1rs;
	private float itemTax2rs;
	private float itemTax3rs;
	private float grandTotal;
	private Integer shelfLife;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getItemGrp1() {
		return itemGrp1;
	}

	public void setItemGrp1(Integer itemGrp1) {
		this.itemGrp1 = itemGrp1;
	}

	public float getItemRate1() {
		return itemRate1;
	}

	public void setItemRate1(float itemRate1) {
		this.itemRate1 = itemRate1;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public float getBaseRate() {
		return baseRate;
	}

	public void setBaseRate(float baseRate) {
		this.baseRate = baseRate;
	}

	public float getDiscPer() {
		return discPer;
	}

	public void setDiscPer(float discPer) {
		this.discPer = discPer;
	}

	public float getDiscAmt() {
		return discAmt;
	}

	public void setDiscAmt(float discAmt) {
		this.discAmt = discAmt;
	}

	public float getTaxableAmt() {
		return taxableAmt;
	}

	public void setTaxableAmt(float taxableAmt) {
		this.taxableAmt = taxableAmt;
	}

	public float getItemMrp1() {
		return itemMrp1;
	}

	public void setItemMrp1(float itemMrp1) {
		this.itemMrp1 = itemMrp1;
	}

	public float getItemTax1() {
		return itemTax1;
	}

	public void setItemTax1(float itemTax1) {
		this.itemTax1 = itemTax1;
	}

	public float getItemTax2() {
		return itemTax2;
	}

	public void setItemTax2(float itemTax2) {
		this.itemTax2 = itemTax2;
	}

	public float getItemTax3() {
		return itemTax3;
	}

	public void setItemTax3(float itemTax3) {
		this.itemTax3 = itemTax3;
	}

	public float getItemTax1rs() {
		return itemTax1rs;
	}

	public void setItemTax1rs(float itemTax1rs) {
		this.itemTax1rs = itemTax1rs;
	}

	public float getItemTax2rs() {
		return itemTax2rs;
	}

	public void setItemTax2rs(float itemTax2rs) {
		this.itemTax2rs = itemTax2rs;
	}

	public float getItemTax3rs() {
		return itemTax3rs;
	}

	public void setItemTax3rs(float itemTax3rs) {
		this.itemTax3rs = itemTax3rs;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public Integer getShelfLife() {
		return shelfLife;
	}

	public void setShelfLife(Integer shelfLife) {
		this.shelfLife = shelfLife;
	}

	@Override
	public String toString() {
		return "AddItemInOtherBill [id=" + id + ", itemId=" + itemId + ", itemName=" + itemName + ", itemGrp1="
				+ itemGrp1 + ", itemRate1=" + itemRate1 + ", qty=" + qty + ", baseRate=" + baseRate + ", discPer="
				+ discPer + ", discAmt=" + discAmt + ", taxableAmt=" + taxableAmt + ", itemMrp1=" + itemMrp1
				+ ", itemTax1=" + itemTax1 + ", itemTax2=" + itemTax2 + ", itemTax3=" + itemTax3 + ", itemTax1rs="
				+ itemTax1rs + ", itemTax2rs=" + itemTax2rs + ", itemTax3rs=" + itemTax3rs + ", grandTotal="
				+ grandTotal + ", shelfLife=" + shelfLife + "]";
	}

}
