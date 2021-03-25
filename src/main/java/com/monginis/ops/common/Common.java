package com.monginis.ops.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.web.client.RestTemplate;

public class Common {

	// public static ArrayList<Menu>menuList;

	public static java.sql.Date stringToSqlDate(String date) {
		java.sql.Date sqlDate = null;
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate;

			utilDate = sdf1.parse(date);
			sqlDate = new java.sql.Date(utilDate.getTime());

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sqlDate;

	}

	public static boolean sendTextMessage(Integer messageType,String custName,String frName,String orderNo,
			String deliveryDate,float totalAmt,String frPhone,String custMob) {
		String msgContent=new String();
		if(messageType.equals(1)) {
			//Its Order Booking message
			//msgContent="Dear "+custName+", thank you for ordering at Monginis "+frName+". Your Order No. is "+orderNo+" "
				//	+ "for "+deliveryDate+". Your Order Value is "+totalAmt+". Kindly read the backside of the receipt for terms of order. For Queries Contact "+frPhone;
			
			msgContent="Your Order No."+orderNo+" of Rs."+totalAmt+" for delivery on "+deliveryDate+" has been booked at Monginis "+frName+" shop. Phone No "+frPhone;
					
		}else {
			//Its Customer Bill Gen Message
			//msgContent="Dear "+custName+", Thank you for visiting at Monginis "+frName+". Your order Total is "+totalAmt+". For Offers and Updates, follow us on Instagram shorturl.at/gCDEF";
			
			msgContent="Thank you for visiting Monginis "+frName+" shop. Your Purchase value is Rs."+totalAmt+
			" Follow us on FB and Insta for latest offers and Updates. tiny.cc/u7mosz";
		}
		String url="http://smspatna.com/API/WebSMS/Http/v1.0a/index.php?username=MONGNS2222&password=MONGNS2222&sender=MONGNS&to="+custMob+"&message="+msgContent+"&route_id=328";
			
		RestTemplate restTemplate = new RestTemplate();
		String res = restTemplate.getForObject(url,
				String.class);
		System.err.println("res "+res);
		return false;
		
	}

}