package com.monginis.ops.constant;

public class Constant {

	//public static final String URL = "http://localhost:8097/";

	public static final String URL = "http://107.180.72.86:8080/barodaApi/";

	public static final String fileUploadPath = "/opt/cpanel/ea-tomcat85/webapps/uploads/baroda/";
	public static final String fileShowPath = "http://107.180.72.86:8080/uploads/baroda/";

	public static final String ITEM_IMAGE_URL = fileShowPath + "ITEM/";

	public static final String SP_CAKE_FOLDER = fileShowPath + "SPCAKE/";

	public static final String SPCAKE_IMAGE_URL = fileShowPath + "MSPCAKE/";

	public static final String PHOTO_CAKE_URL = fileShowPath + "CUSTCHOICEPHOTOCAKE/";

	public static final String FR_IMAGE_URL = fileShowPath + "FR/";

	public static final String GVN_IMAGE_URL = fileShowPath + "GVN/";

	// public static final String ReportURL ="http://localhost:8986/ops/";
	public static final String ReportURL = "http://107.180.72.86:8080/barodaops/";
	public static final String MESSAGE_IMAGE_URL = fileShowPath + "MSG/";

	public static final String LOGIS_BILL_URL = fileShowPath + "MSPCAKE/";

	public static final String REPORT_SAVE = fileUploadPath + "Report.pdf";
	// public static final String REPORT_SAVE = "/home/ats-12/report.pdf";

	public static final String FACTORYNAME = "DEVOUR FOODS LLP";

	public static final String FACTORYADDRESS = "Village-Fatehpur,Dist-Patna";

	public static final String BILL_REPORT_PATH = fileUploadPath + "reportbill.pdf";
	public static final String CRN_REPORT_PATH = fileUploadPath + "crn.pdf";
	public static final String SELL_REPORT_PATH = fileUploadPath + "sellreport.pdf";

	public static final String FACTORYGSTIN = "-";
	public static final String CITY = "Patna";
	public static final String STATE = "Bihar";

	public static Integer dayOfMonthEnd = 1;

	public static Integer DEL_STATUS = 1;

	public static int FR_IMAGE_TYPE = 1;
	/*
	 * public static int ITEM_IMAGE_TYPE=2; public static int MESSAGE_IMAGE_TYPE=3;
	 */

	public static int SPCAKE_IMAGE_TYPE = 4;

	public static int CUST_CHIOICE_IMAGE_TYPE = 5;

	public static int GVN_IMAGE_TYPE = 6;

}
