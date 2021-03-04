
package com.monginis.ops.model;

import java.io.Serializable;
import java.sql.Date;


public class FrMenu implements Serializable {

    private Integer settingId;
    private String fromTime;
    private String toTime;
    private String itemShow;
    private String menuDesc;
    private String menuImage;
    private String selectedMenuImage;
    private String menuTitle;
    private Integer settingType;
    private Integer frId;
    private Integer menuId;
    private Integer catId;
    private String time;
    private Integer isSameDayApplicable;
	private String day;
	private String date;
	
	
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
			
			
			
	public Integer getSettingId() {
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
	public void setSettingId(Integer settingId) {
		this.settingId = settingId;
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
	public String getItemShow() {
		return itemShow;
	}
	public void setItemShow(String itemShow) {
		this.itemShow = itemShow;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public String getSelectedMenuImage() {
		return selectedMenuImage;
	}
	public void setSelectedMenuImage(String selectedMenuImage) {
		this.selectedMenuImage = selectedMenuImage;
	}
	public String getMenuTitle() {
		return menuTitle;
	}
	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}
	public Integer getSettingType() {
		return settingType;
	}
	public void setSettingType(Integer settingType) {
		this.settingType = settingType;
	}
	public Integer getFrId() {
		return frId;
	}
	public void setFrId(Integer frId) {
		this.frId = frId;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public Integer getCatId() {
		return catId;
	}
	public void setCatId(Integer catId) {
		this.catId = catId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getIsSameDayApplicable() {
		return isSameDayApplicable;
	}
	public void setIsSameDayApplicable(Integer isSameDayApplicable) {
		this.isSameDayApplicable = isSameDayApplicable;
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
	@Override
	public String toString() {
		return "FrMenu [settingId=" + settingId + ", fromTime=" + fromTime + ", toTime=" + toTime + ", itemShow="
				+ itemShow + ", menuDesc=" + menuDesc + ", menuImage=" + menuImage + ", selectedMenuImage="
				+ selectedMenuImage + ", menuTitle=" + menuTitle + ", settingType=" + settingType + ", frId=" + frId
				+ ", menuId=" + menuId + ", catId=" + catId + ", time=" + time + ", isSameDayApplicable="
				+ isSameDayApplicable + ", day=" + day + ", date=" + date + ", rateSettingFrom=" + rateSettingFrom
				+ ", profitPer=" + profitPer + ", rateSettingType=" + rateSettingType + ", delDays=" + delDays
				+ ", prodDays=" + prodDays + ", isDiscApp=" + isDiscApp + ", discPer=" + discPer + ", grnPer=" + grnPer
				+ "]";
	}

  
}
