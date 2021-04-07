package com.monginis.ops.model.pettycash;

import java.util.List;

import com.monginis.ops.model.access.OpsAccessRight;

public class FrEmpModules {
	FrEmpMaster emp;
	List<OpsAccessRight> modulList;
	public FrEmpMaster getEmp() {
		return emp;
	}
	public void setEmp(FrEmpMaster emp) {
		this.emp = emp;
	}
	public List<OpsAccessRight> getModulList() {
		return modulList;
	}
	public void setModulList(List<OpsAccessRight> modulList) {
		this.modulList = modulList;
	}
	@Override
	public String toString() {
		return "FrEmpModules [emp=" + emp + ", modulList=" + modulList + "]";
	}
	
	
}
