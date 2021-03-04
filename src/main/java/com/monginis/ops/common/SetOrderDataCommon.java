package com.monginis.ops.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.Flavour;
import com.monginis.ops.model.FlavourConf;
import com.monginis.ops.model.FlavourList;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.GetFrItem;
import com.monginis.ops.model.Orders;
import com.monginis.ops.model.RegularSpCake;
import com.monginis.ops.model.SpecialCake;

public class SetOrderDataCommon {

	public MultiValueMap<String, Object> map;
	RestTemplate restTemplate = new RestTemplate();

	public Orders setOrderData(Orders order, FrMenu menu, int menuId, int frId, int orderQty,
			HttpServletRequest request) {
		System.err.println("in setOrderData");
		List<GetFrItem> frItemList = new ArrayList<>();
		// FrMenu menu=new FrMenu();
		try {
			map = new LinkedMultiValueMap<String, Object>();

			map.add("items", order.getItemId());
			map.add("frId", frId);
			map.add("date", "");
			map.add("menuId", menuId);
			map.add("isSameDayApplicable", 0);

			ParameterizedTypeReference<List<GetFrItem>> typeRef = new ParameterizedTypeReference<List<GetFrItem>>() {
			};
			ResponseEntity<List<GetFrItem>> responseEntity = restTemplate.exchange(Constant.URL + "/getFrItems",
					HttpMethod.POST, new HttpEntity<>(map), typeRef);

			frItemList = responseEntity.getBody();

			order.setOrderType(Integer.parseInt(frItemList.get(0).getItemGrp1()));// ie catId
			order.setOrderSubType(Integer.parseInt(frItemList.get(0).getItemGrp2()));// ie subCatId
			order.setOrderQty(orderQty);

			String fromTime = menu.getFromTime();
			String toTime = menu.getToTime();

			String orderDate = "";
			String productionDate = "";
			String deliveryDate = "";

			ZoneId z = ZoneId.of("Asia/Calcutta");
			LocalTime now = LocalTime.now(z); // Explicitly specify the desired/expected time zone.

			LocalTime fromTimeLocalTime = LocalTime.parse(fromTime);
			LocalTime toTimeLocalTIme = LocalTime.parse(toTime);

			Boolean isLate = now.isAfter(toTimeLocalTIme);
			Boolean isEarly = now.isBefore(fromTimeLocalTime);

			Boolean isSameDay = fromTimeLocalTime.isBefore(toTimeLocalTIme);
			Boolean isValid = false;

			String todaysDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			if (fromTimeLocalTime.isBefore(toTimeLocalTIme)) {
				orderDate = todaysDate;
				// productionDate = todaysDate;
				productionDate = incrementDate(todaysDate, menu.getProdDays());
				deliveryDate = incrementDate(todaysDate, menu.getDelDays());
			} else {
				if (now.isAfter(fromTimeLocalTime)) {
					orderDate = todaysDate;
					productionDate = incrementDate(todaysDate, menu.getProdDays() + 1);
					deliveryDate = incrementDate(todaysDate, menu.getDelDays() + 1);
				} else {
					orderDate = todaysDate;
					productionDate = incrementDate(todaysDate, menu.getProdDays());
					deliveryDate = incrementDate(todaysDate, menu.getDelDays());
				}
			}
			int rateCat = menu.getRateSettingType();
			float mrp = 0;
			float profitPer = 0;

			if (rateCat == 1) {
				mrp = (float) frItemList.get(0).getItemMrp1();
			} else if (rateCat == 2) {
				mrp = (float) frItemList.get(0).getItemMrp2();
			} else {
				mrp = (float) frItemList.get(0).getItemMrp3();
			}
			profitPer = menu.getProfitPer();
			float rate = (mrp - (mrp * profitPer) / 100);
			order.setDeliveryDate(Common.stringToSqlDate(deliveryDate));
			order.setOrderDate(Common.stringToSqlDate(orderDate));
			order.setOrderDatetime(todaysDate);
			order.setProductionDate(Common.stringToSqlDate(productionDate));

			order.setOrderMrp(mrp);
			order.setOrderRate(rate);
			order.setGrnType(menu.getGrnPer());
			order.setIsPositive((int) menu.getDiscPer());// set discPer
			System.err.println("order Here " + order.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;

	}

	public RegularSpCake setRegSpOrderData(RegularSpCake order, FrMenu menu, int menuId, int frId, int orderQty,
			HttpServletRequest request) {
		System.err.println("in setOrderData");
		List<GetFrItem> frItemList = new ArrayList<>();
		// FrMenu menu=new FrMenu();
		try {
			map = new LinkedMultiValueMap<String, Object>();

			map.add("items", order.getItemId());
			map.add("frId", frId);
			map.add("date", "");
			map.add("menuId", menuId);
			map.add("isSameDayApplicable", 0);

			ParameterizedTypeReference<List<GetFrItem>> typeRef = new ParameterizedTypeReference<List<GetFrItem>>() {
			};
			ResponseEntity<List<GetFrItem>> responseEntity = restTemplate.exchange(Constant.URL + "/getFrItems",
					HttpMethod.POST, new HttpEntity<>(map), typeRef);

			frItemList = responseEntity.getBody();

			// order.setOrderType(Integer.parseInt(frItemList.get(0).getItemGrp1()));// ie
			// catId
			// order.setOrderSubType(Integer.parseInt(frItemList.get(0).getItemGrp2()));//
			// ie subCatId
			// order.setOrderQty(orderQty);

			String fromTime = menu.getFromTime();
			String toTime = menu.getToTime();

			String orderDate = "";
			String productionDate = "";
			String deliveryDate = "";

			ZoneId z = ZoneId.of("Asia/Calcutta");
			LocalTime now = LocalTime.now(z); // Explicitly specify the desired/expected time zone.

			LocalTime fromTimeLocalTime = LocalTime.parse(fromTime);
			LocalTime toTimeLocalTIme = LocalTime.parse(toTime);

			Boolean isLate = now.isAfter(toTimeLocalTIme);
			Boolean isEarly = now.isBefore(fromTimeLocalTime);

			Boolean isSameDay = fromTimeLocalTime.isBefore(toTimeLocalTIme);
			Boolean isValid = false;

			String todaysDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			if (fromTimeLocalTime.isBefore(toTimeLocalTIme)) {
				orderDate = todaysDate;
				// productionDate = todaysDate;
				productionDate = incrementDate(todaysDate, menu.getProdDays());
				deliveryDate = incrementDate(todaysDate, menu.getDelDays());
			} else {
				if (now.isAfter(fromTimeLocalTime)) {
					orderDate = todaysDate;
					productionDate = incrementDate(todaysDate, menu.getProdDays() + 1);
					deliveryDate = incrementDate(todaysDate, menu.getDelDays() + 1);
				} else {
					orderDate = todaysDate;
					productionDate = incrementDate(todaysDate, menu.getProdDays());
					deliveryDate = incrementDate(todaysDate, menu.getDelDays());
				}
			}
			int rateCat = menu.getRateSettingType();
			float mrp = 0;
			float profitPer = 0;

			if (rateCat == 1) {
				mrp = (float) frItemList.get(0).getItemMrp1();
			} else if (rateCat == 2) {
				mrp = (float) frItemList.get(0).getItemMrp2();
			} else {
				mrp = (float) frItemList.get(0).getItemMrp3();
			}
			profitPer = menu.getProfitPer();
			float rate = (mrp - (mrp * profitPer) / 100);
			order.setRspDeliveryDt(DateConvertor.convertToDMY(deliveryDate));
			order.setOrderDate(DateConvertor.convertToDMY(orderDate));
			//order.setOrderTime(DateConvertor.convertToDMY(todaysDate)); not found in Baroda Bean
			order.setRspProduDate(DateConvertor.convertToDMY(productionDate));

			order.setMrp(mrp);
			order.setRate(rate);
			// order.setGrnType(menu.getGrnPer());
			// order.setIsPositive((int) menu.getDiscPer());// set discPer
			System.err.println("order Here RSP " + order.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;

	}

	public String incrementDate(String date, int day) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(date));

		} catch (ParseException e) {
			// System.out.println("Exception while incrementing date " + e.getMessage());
			e.printStackTrace();
		}
		c.add(Calendar.DATE, day); // number of days to add

		date = sdf.format(c.getTime());

		return date;

	}

	// 01-02-2021 Sp Order data setting
	public SpecialCake setSpCakeOrderData(SpecialCake spCake, Flavour flavor, FrMenu menu) {
		System.err.println("Menu  " + menu);
		float spBackEndRate = 0.0f;
		float mrp_sprRate = 0.0f;
		float addOnRate = 0.0f;
		float profitPer = menu.getProfitPer();

		if (menu.getRateSettingFrom() == 0) {
			// By Master
			if (menu.getRateSettingType() == 1) {
				mrp_sprRate = spCake.getMrpRate1();
			} else if (menu.getRateSettingType() == 2) {
				mrp_sprRate = spCake.getMrpRate2();
			} else {
				mrp_sprRate = spCake.getMrpRate3();
			}
		} else {
			// By Flavor Confi
			// Get Flavor Configuration By SpId
			FlavourConf spFlavConf = new FlavourConf();

			if (flavor != null) {
				try {
					System.err.println("flavor In " + flavor);
					map = new LinkedMultiValueMap<String, Object>();
					map.add("spfId", flavor.getSpfId());
					map.add("spId", spCake.getSpId());
					spFlavConf = restTemplate.postForObject(Constant.URL + "/getFlConfByIds", map, FlavourConf.class);
				} catch (HttpClientErrorException e) {
					System.err.println("at here " + e.getResponseBodyAsString());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (menu.getRateSettingType() == 1) {
				mrp_sprRate = spFlavConf.getMrp1();
			} else if (menu.getRateSettingType() == 2) {
				mrp_sprRate = spFlavConf.getMrp2();
			} else {
				mrp_sprRate = spFlavConf.getMrp3();
			}
		}
		if (menu.getRateSettingFrom() == 0 && spCake.getIsAddonRateAppli() == 1) {
			addOnRate = (float) flavor.getSpfAdonRate();
		}
		System.err.println("addOnRate " + addOnRate);
		//mrp_sprRate = mrp_sprRate + addOnRate;
		spBackEndRate = (mrp_sprRate - (mrp_sprRate * profitPer) / 100);

		spCake.setSprRateMrp(mrp_sprRate);
		spCake.setSpBackendRate(spBackEndRate);
		spCake.setSprAddOnRate(addOnRate);
		spCake.setProfitPer(profitPer);
		System.err.println("specail Cake "+spCake);
		System.err.println("mrp_sprRate  " + mrp_sprRate + "spBackEndRate " + spBackEndRate + "addOnRate " + addOnRate);
		return spCake;
	}

}
