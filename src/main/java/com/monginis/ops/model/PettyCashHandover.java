package com.monginis.ops.model;

public class PettyCashHandover {
	private int cashHandoverId;
	private int frId;
	private int fromUserId; 
	private String fromUsername;
	private int toUserId;
	private String toUsername;
	private float amtHandover;
	private float actualAmtHandover;
	private float openingAmt;
	private float sellingAmt;
	private String transactionDate;
	private String closingDate;
	private int delStatus;
	private String updateDatetime;
	private int exInt1;
	private int exInt2;
	private int exInt3;
	private String exVar1;
	private String exVar2;
	private String exVar3;
	public int getCashHandoverId() {
		return cashHandoverId;
	}
	public void setCashHandoverId(int cashHandoverId) {
		this.cashHandoverId = cashHandoverId;
	}
	
	public int getFrId() {
		return frId;
	}
	public void setFrId(int frId) {
		this.frId = frId;
	}
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getFromUsername() {
		return fromUsername;
	}
	public void setFromUsername(String fromUsername) {
		this.fromUsername = fromUsername;
	}
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	public String getToUsername() {
		return toUsername;
	}
	public void setToUsername(String toUsername) {
		this.toUsername = toUsername;
	}
	public float getAmtHandover() {
		return amtHandover;
	}
	public void setAmtHandover(float amtHandover) {
		this.amtHandover = amtHandover;
	}
	public float getActualAmtHandover() {
		return actualAmtHandover;
	}
	public void setActualAmtHandover(float actualAmtHandover) {
		this.actualAmtHandover = actualAmtHandover;
	}
	public float getOpeningAmt() {
		return openingAmt;
	}
	public void setOpeningAmt(float openingAmt) {
		this.openingAmt = openingAmt;
	}
	public float getSellingAmt() {
		return sellingAmt;
	}
	public void setSellingAmt(float sellingAmt) {
		this.sellingAmt = sellingAmt;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(String closingDate) {
		this.closingDate = closingDate;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public String getUpdateDatetime() {
		return updateDatetime;
	}
	public void setUpdateDatetime(String updateDatetime) {
		this.updateDatetime = updateDatetime;
	}
	public int getExInt1() {
		return exInt1;
	}
	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}
	public int getExInt2() {
		return exInt2;
	}
	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}
	public int getExInt3() {
		return exInt3;
	}
	public void setExInt3(int exInt3) {
		this.exInt3 = exInt3;
	}
	public String getExVar1() {
		return exVar1;
	}
	public void setExVar1(String exVar1) {
		this.exVar1 = exVar1;
	}
	public String getExVar2() {
		return exVar2;
	}
	public void setExVar2(String exVar2) {
		this.exVar2 = exVar2;
	}
	public String getExVar3() {
		return exVar3;
	}
	public void setExVar3(String exVar3) {
		this.exVar3 = exVar3;
	}
	@Override
	public String toString() {
		return "PettyCashHandover [cashHandoverId=" + cashHandoverId + ", frId=" + frId + ", fromUserId=" + fromUserId
				+ ", fromUsername=" + fromUsername + ", toUserId=" + toUserId + ", toUsername=" + toUsername
				+ ", amtHandover=" + amtHandover + ", actualAmtHandover=" + actualAmtHandover + ", openingAmt="
				+ openingAmt + ", sellingAmt=" + sellingAmt + ", transactionDate=" + transactionDate + ", closingDate="
				+ closingDate + ", delStatus=" + delStatus + ", updateDatetime=" + updateDatetime + ", exInt1=" + exInt1
				+ ", exInt2=" + exInt2 + ", exInt3=" + exInt3 + ", exVar1=" + exVar1 + ", exVar2=" + exVar2
				+ ", exVar3=" + exVar3 + "]";
	}
	
}
