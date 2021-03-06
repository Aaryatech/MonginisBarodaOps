package com.monginis.ops.model;

import java.util.List;

public class AddCustemerResponse {

	private int addCustomerId;
	private List<CustomerForOps> customerList;
	private boolean error;

	public int getAddCustomerId() {
		return addCustomerId;
	}

	public void setAddCustomerId(int addCustomerId) {
		this.addCustomerId = addCustomerId;
	}

	public List<CustomerForOps> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<CustomerForOps> customerList) {
		this.customerList = customerList;
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	@Override
	public String toString() {
		return "AddCustemerResponse [addCustomerId=" + addCustomerId + ", customerList=" + customerList + ", error="
				+ error + "]";
	}

}
