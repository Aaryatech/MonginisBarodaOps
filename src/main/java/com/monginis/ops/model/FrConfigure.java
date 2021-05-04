package com.monginis.ops.model;


public class FrConfigure {

	private int settingId;

	private int frId;
	private int menuId;
	private int catId;
	private int subCatId;
	private int settingType;
	private String fromTime;
	private String toTime;
	private String day;
	private String date;
	private String itemShow;
	private int delStatus;

	//SAC 03-05-2021
	
	//Sachin 03-03-2021
		//New fields 21-01-2021 -sachin
				int rateSettingFrom;
				float profitPer;
				int rateSettingType;
				int delDays;
				int prodDays;
				int isDiscApp;
				float discPer;
				int grnPer;
				//New fields 21-01-2021 -sachin code end
				
				
				
	public int getSettingId() {
		return settingId;
	}

	public int getRateSettingFrom() {
		return rateSettingFrom;
	}

	public void setRateSettingFrom(int rateSettingFrom) {
		this.rateSettingFrom = rateSettingFrom;
	}

	public float getProfitPer() {
		return profitPer;
	}

	public void setProfitPer(float profitPer) {
		this.profitPer = profitPer;
	}

	public int getRateSettingType() {
		return rateSettingType;
	}

	public void setRateSettingType(int rateSettingType) {
		this.rateSettingType = rateSettingType;
	}

	public int getDelDays() {
		return delDays;
	}

	public void setDelDays(int delDays) {
		this.delDays = delDays;
	}

	public int getProdDays() {
		return prodDays;
	}

	public void setProdDays(int prodDays) {
		this.prodDays = prodDays;
	}

	public int getIsDiscApp() {
		return isDiscApp;
	}

	public void setIsDiscApp(int isDiscApp) {
		this.isDiscApp = isDiscApp;
	}

	public float getDiscPer() {
		return discPer;
	}

	public void setDiscPer(float discPer) {
		this.discPer = discPer;
	}

	public int getGrnPer() {
		return grnPer;
	}

	public void setGrnPer(int grnPer) {
		this.grnPer = grnPer;
	}

	public void setSettingId(int settingId) {
		this.settingId = settingId;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getSubCatId() {
		return subCatId;
	}

	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}

	public int getSettingType() {
		return settingType;
	}

	public void setSettingType(int settingType) {
		this.settingType = settingType;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getItemShow() {
		return itemShow;
	}

	public void setItemShow(String itemShow) {
		this.itemShow = itemShow;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "FrConfigure [settingId=" + settingId + ", frId=" + frId + ", menuId=" + menuId + ", catId=" + catId
				+ ", subCatId=" + subCatId + ", settingType=" + settingType + ", fromTime=" + fromTime + ", toTime="
				+ toTime + ", day=" + day + ", date=" + date + ", itemShow=" + itemShow + ", delStatus=" + delStatus
				+ "]";
	}

}
