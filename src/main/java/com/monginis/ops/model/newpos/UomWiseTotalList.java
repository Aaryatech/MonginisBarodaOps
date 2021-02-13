package com.monginis.ops.model.newpos;

public class UomWiseTotalList {

	private String uom;
	private float qty;
	
	

	public UomWiseTotalList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public UomWiseTotalList(String uom, float qty) {
		super();
		this.uom = uom;
		this.qty = qty;
	}



	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public float getQty() {
		return qty;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "UomWiseTotalList [uom=" + uom + ", qty=" + qty + "]";
	}

}
