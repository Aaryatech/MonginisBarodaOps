package com.monginis.ops.model;

public class PosCreditBillPrint {

	private int sellBillNo;
	private String invoiceNo;
	private int custId;
	private String custName;
	private float payable;
	private float paid;
	private float pending;
	private float settle;
	
	

	public PosCreditBillPrint() {
		super();
	}

	

	public PosCreditBillPrint(int sellBillNo, String invoiceNo, int custId, String custName, float payable, float paid,
			float pending, float settle) {
		this.sellBillNo = sellBillNo;
		this.invoiceNo = invoiceNo;
		this.custId = custId;
		this.custName = custName;
		this.payable = payable;
		this.paid = paid;
		this.pending = pending;
		this.settle = settle;
	}



	public int getSellBillNo() {
		return sellBillNo;
	}

	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public float getPayable() {
		return payable;
	}

	public void setPayable(float payable) {
		this.payable = payable;
	}

	public float getPaid() {
		return paid;
	}

	public void setPaid(float paid) {
		this.paid = paid;
	}

	public float getPending() {
		return pending;
	}

	public void setPending(float pending) {
		this.pending = pending;
	}
	
	

	public float getSettle() {
		return settle;
	}

	public void setSettle(float settle) {
		this.settle = settle;
	}
	
	

	@Override
	public String toString() {
		return "PosCreditBillPrint [sellBillNo=" + sellBillNo + ", invoiceNo=" + invoiceNo + ", custId=" + custId
				+ ", custName=" + custName + ", payable=" + payable + ", paid=" + paid + ", pending=" + pending
				+ ", settle=" + settle + "]";
	}

}
