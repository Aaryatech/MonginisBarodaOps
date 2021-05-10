package com.monginis.ops.model;

import java.util.List;

public class ItemOrderListNew {
	
	private List<ItemOrderHisNew> itemOrderList = null;
	private ErrorMessage errorMessage;
	public List<ItemOrderHisNew> getItemOrderList() {
		return itemOrderList;
	}
	public void setItemOrderList(List<ItemOrderHisNew> itemOrderList) {
		this.itemOrderList = itemOrderList;
	}
	public ErrorMessage getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(ErrorMessage errorMessage) {
		this.errorMessage = errorMessage;
	}
	@Override
	public String toString() {
		return "ItemOrderListNew [itemOrderList=" + itemOrderList + ", errorMessage=" + errorMessage + "]";
	}

	
	
	
}
