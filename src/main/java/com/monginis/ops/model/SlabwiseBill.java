package com.monginis.ops.model;

import java.io.Serializable;


public class SlabwiseBill{

	private String itemHsncd;

	private float taxPer;
	
	private float billQty;

	private float taxableAmt;
	
	private float cgstAmt;
	
	private float sgstAmt;
	
	private float cessAmt;
	
	private float totalTax;
	
	private float grandTotal;

	private int billDetailNo;
	
	
	private float igstAmt;//SAC 05-04-2021
	
	
	
	public float getCessAmt() {
		return cessAmt;
	}

	public void setCessAmt(float cessAmt) {
		this.cessAmt = cessAmt;
	}

	public int getBillDetailNo() {
		return billDetailNo;
	}

	public void setBillDetailNo(int billDetailNo) {
		this.billDetailNo = billDetailNo;
	}

	public float getBillQty() {
		return billQty;
	}

	public void setBillQty(float billQty) {
		this.billQty = billQty;
	}

	public String getItemHsncd() {
		return itemHsncd;
	}

	public void setItemHsncd(String itemHsncd) {
		this.itemHsncd = itemHsncd;
	}

	public float getTaxPer() {
		return taxPer;
	}

	public void setTaxPer(float taxPer) {
		this.taxPer = taxPer;
	}

	public float getTaxableAmt() {
		return taxableAmt;
	}

	public void setTaxableAmt(float taxableAmt) {
		this.taxableAmt = taxableAmt;
	}

	public float getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(float cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public float getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(float sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public float getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(float totalTax) {
		this.totalTax = totalTax;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public float getIgstAmt() {
		return igstAmt;
	}

	public void setIgstAmt(float igstAmt) {
		this.igstAmt = igstAmt;
	}

	@Override
	public String toString() {
		return "SlabwiseBill [itemHsncd=" + itemHsncd + ", taxPer=" + taxPer + ", billQty=" + billQty + ", taxableAmt="
				+ taxableAmt + ", cgstAmt=" + cgstAmt + ", sgstAmt=" + sgstAmt + ", cessAmt=" + cessAmt + ", totalTax="
				+ totalTax + ", grandTotal=" + grandTotal + ", billDetailNo=" + billDetailNo + ", igstAmt=" + igstAmt
				+ "]";
	}

	
}
