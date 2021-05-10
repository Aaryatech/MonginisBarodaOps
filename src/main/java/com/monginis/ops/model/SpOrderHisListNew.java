package com.monginis.ops.model;

import java.util.List;

public class SpOrderHisListNew {
	private List<SpOrderHisNew> spOrderList = null;
	private ErrorMessage errorMessage;
	public List<SpOrderHisNew> getSpOrderList() {
		return spOrderList;
	}
	public void setSpOrderList(List<SpOrderHisNew> spOrderList) {
		this.spOrderList = spOrderList;
	}
	public ErrorMessage getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(ErrorMessage errorMessage) {
		this.errorMessage = errorMessage;
	}
	@Override
	public String toString() {
		return "SpOrderHisListNew [spOrderList=" + spOrderList + ", errorMessage=" + errorMessage + "]";
	}
	
	
	
	
	
	
	
	

}
