package com.monginis.ops.controller.newpos;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.ItemList;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.monginis.ops.billing.SellBillDetail;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.common.Common;
import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.controller.CustomerBillController;
import com.monginis.ops.model.AddCustemerResponse;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.CustomerBillItem;
import com.monginis.ops.model.CustomerForOps;
import com.monginis.ops.model.FrItemStockConfigure;
import com.monginis.ops.model.FrItemStockConfigureList;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.GetCustBillTax;
import com.monginis.ops.model.GetCustmoreBillResponse;
import com.monginis.ops.model.GetFrMenus;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.ItemResponse;
import com.monginis.ops.model.MCategory;
import com.monginis.ops.model.PaymentMode;
import com.monginis.ops.model.PaymentType;
import com.monginis.ops.model.PostFrItemStockHeader;
import com.monginis.ops.model.SubCategory;
import com.monginis.ops.model.TransactionDetail;
import com.monginis.ops.model.frsetting.FrSetting;
import com.monginis.ops.model.newpos.BillItemList;
import com.monginis.ops.model.newpos.CustomerBillOnHold;
import com.monginis.ops.model.newpos.ErrorMsgWithItemList;
import com.monginis.ops.model.newpos.NewPosBillItem;
import com.monginis.ops.model.pettycash.FrEmpMaster;
import com.monginis.ops.model.pettycash.PettyCashManagmt;
import com.monginis.ops.model.setting.NewSetting;

@Controller
@Scope("session")
public class NewOpsCustomerBillController {

	public int frGstType = 0;

	// List<NewPosBillItem> billItemList = new ArrayList<NewPosBillItem>();

	List<BillItemList> itemList = new ArrayList<BillItemList>();

	public List<CustomerForOps> custometList = new ArrayList<CustomerForOps>();
	public List<Customer> customerTempList = new ArrayList<Customer>();
	List<NewPosBillItem> showItemList = new ArrayList<NewPosBillItem>();

	LinkedHashMap<Integer, CustomerBillOnHold> hashMap = new LinkedHashMap<Integer, CustomerBillOnHold>();
	int key = 0;
	int tempBillNo = 0;
	int calStock = 0;

	@RequestMapping(value = "/newPos/{type}", method = RequestMethod.GET)
	public ModelAndView displayNewPOs1(@PathVariable int type, HttpServletRequest request,
			HttpServletResponse response) {
		itemList = new ArrayList<BillItemList>();
		RestTemplate restTemplate = new RestTemplate();
		ModelAndView model = new ModelAndView("newPos");
		List<MCategory> catResp = new ArrayList<MCategory>();
		List<SubCategory> subCatResp = new ArrayList<SubCategory>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

		int runningMonth = 0;

		try {

			PaymentMode[] paymentMode = restTemplate.getForObject(Constant.URL + "getPaymentModeList",
					PaymentMode[].class);
			List<PaymentMode> payModeList = new ArrayList<PaymentMode>(Arrays.asList(paymentMode));
			model.addObject("payModeList", payModeList);

			CustomerForOps[] custResp = restTemplate.getForObject(Constant.URL + "getAllCustomersForOps",
					CustomerForOps[].class);
			custometList = new ArrayList<CustomerForOps>(Arrays.asList(custResp));
			map = new LinkedMultiValueMap<String, Object>();

			map.add("settingKeyList", "CHECK_STOCK_FOR_CUSTOMER_BILL");
			FrItemStockConfigureList settingList = restTemplate.postForObject(Constant.URL + "getDeptSettingValue", map,
					FrItemStockConfigureList.class);
			List<FrItemStockConfigure> settingListRes = settingList.getFrItemStockConfigure();
			calStock = settingListRes.get(0).getSettingValue();

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			if (calStock == 1) {
				ParameterizedTypeReference<List<PostFrItemStockHeader>> typeRef1 = new ParameterizedTypeReference<List<PostFrItemStockHeader>>() {
				};
				ResponseEntity<List<PostFrItemStockHeader>> responseEntity1 = restTemplate.exchange(
						Constant.URL + "getCurrentMonthOfCatId", HttpMethod.POST, new HttpEntity<>(map), typeRef1);
				List<PostFrItemStockHeader> list = responseEntity1.getBody();

				for (int i = 0; i < list.size(); i++) {

					runningMonth = list.get(i).getMonth();

				}
			}

			String items;
			StringBuilder builder = new StringBuilder();

			MultiValueMap<String, Object> menuMap = new LinkedMultiValueMap<String, Object>();
			menuMap.add("frId", frDetails.getFrId());

			GetFrMenus getFrMenus = restTemplate.postForObject(Constant.URL + "/getFrConfigMenus", menuMap,
					GetFrMenus.class);

			List<FrMenu> frMenuList = getFrMenus.getFrMenus();

			if (frMenuList != null) {
				for (FrMenu frMenu : menuList) {
					builder.append("," + frMenu.getItemShow());
				}
			}

			items = builder.toString();
			items = items.substring(1, items.length());

			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			DateFormat yearFormat = new SimpleDateFormat("yyyy");

			Date todaysDate = new Date();

			Calendar cal = Calendar.getInstance();
			cal.setTime(todaysDate);

			cal.set(Calendar.DAY_OF_MONTH, 1);

			Date firstDay = cal.getTime();

			boolean isMonthCloseApplicable = false;

			map = new LinkedMultiValueMap<String, Object>();

			Date date = new Date();

			Calendar cal1 = Calendar.getInstance();
			cal1.setTime(date);

			int calCurrentMonth = cal1.get(Calendar.MONTH) + 1;

			if (runningMonth < calCurrentMonth) {

				isMonthCloseApplicable = true;

			} else if (runningMonth == 12 && calCurrentMonth == 1) {
				isMonthCloseApplicable = true;
			}

			if (isMonthCloseApplicable) {

				String strDate;
				int year;
				if (runningMonth == 12) {

					year = (Calendar.getInstance().getWeekYear() - 1);

				} else {

					year = Calendar.getInstance().getWeekYear();

				}

				strDate = year + "/" + runningMonth + "/01";

				map.add("fromDt", strDate);
			} else {

				map.add("fromDt", dateFormat.format(firstDay));

			}

			map.add("frId", frDetails.getFrId());
			map.add("frStockType", frDetails.getStockType());

			map.add("toDt", dateFormat.format(todaysDate));
			map.add("month", String.valueOf(runningMonth));
			map.add("year", yearFormat.format(todaysDate));

			map.add("itemList", items);
			map.add("flag", calStock);

			System.out.println(map);
			NewPosBillItem[] biiItleListArr = restTemplate.postForObject(Constant.URL + "getItemListWithCS", map,
					NewPosBillItem[].class);
			showItemList = new ArrayList<NewPosBillItem>(Arrays.asList(biiItleListArr));

			SubCategory[] subCatArr = restTemplate.getForObject(Constant.URL + "getAllSubCatList", SubCategory[].class);
			subCatResp = new ArrayList<SubCategory>(Arrays.asList(subCatArr));

			model.addObject("subCatList", subCatResp);

			MCategory[] catArr = restTemplate.getForObject(Constant.URL + "getCategories", MCategory[].class);
			catResp = new ArrayList<MCategory>(Arrays.asList(catArr));

			model.addObject("categoryList", catResp);

			model.addObject("holdingList", hashMap);

			if (type == 1) {
				model.addObject("holdBill", hashMap.get(key));
				System.out.println(hashMap.get(key));
				itemList = hashMap.get(key).getItemBillList();
				model.addObject("key", key);
				model.addObject("tempCust", 0);
			} else {
				// map.add("frId", frDetails.getFrId());

				CustomerBillOnHold customerBillOnHold = new CustomerBillOnHold();
				itemList = new ArrayList<>();
				// customerBillOnHold.setItemList(itemList);
				customerBillOnHold.setItemBillList(itemList);
				model.addObject("key", 0);
				model.addObject("holdBill", customerBillOnHold);
				model.addObject("tempCust", 0);
				/*
				 * for (int i = 0; i < customerTempList.size(); i++) {
				 * 
				 * System.out.println("customerTempList.get " + customerTempList.get(i)); String
				 * phoneno = customerTempList.get(i).getPhoneNo();
				 * 
				 * Optional<Customer> result = custometList.stream() .filter(obj ->
				 * phoneno.equalsIgnoreCase(obj.getPhoneNo())).findFirst();
				 * System.out.println("result " + result); if (result==null) {
				 * custometList.add(customerTempList.get(i));
				 * 
				 * }
				 * 
				 * }
				 */

			}

			if (calStock == 1) {

				for (Entry<Integer, CustomerBillOnHold> entry : hashMap.entrySet()) {
					// System.out.println(entry.getKey() + "/" + entry.getValue());
					List<BillItemList> holBillItemList = entry.getValue().getItemBillList();

					for (int i = 0; i < holBillItemList.size(); i++) {
						for (int j = 0; j < showItemList.size(); j++) {

							if (Integer.parseInt(showItemList.get(j).getItemId()) == holBillItemList.get(i)
									.getItemId()) {
								showItemList.get(j).setTotalRegStock(
										showItemList.get(j).getTotalRegStock() - holBillItemList.get(i).getItemQty());
								break;
							}

						}

					}
				}
				// List<BillItemList> holBillItemList =hashMap.get

			}
			model.addObject("customerList", custometList);
			model.addObject("calStock", calStock);
			model.addObject("ItemList", showItemList);
		} catch (Exception e) {
			System.out.println("Excep in /newPos : " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/getModeTypeList", method = RequestMethod.POST)
	@ResponseBody
	public List<PaymentType> getModeTypeList(HttpServletRequest request, HttpServletResponse responsel) {

		List<PaymentType> list = new ArrayList<PaymentType>();

		try {

			int type = Integer.parseInt(request.getParameter("type"));

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("modeId", type);
			PaymentType[] biiItleListArr = restTemplate.postForObject(Constant.URL + "getPaymentTypeList", map,
					PaymentType[].class);
			list = new ArrayList<PaymentType>(Arrays.asList(biiItleListArr));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "/revertHoldBillOnCurrent", method = RequestMethod.POST)
	@ResponseBody
	public Info revertHoldBillOnCurrent(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int index = Integer.parseInt(request.getParameter("key"));
			key = index;

			info.setError(false);
			info.setMessage("Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/cancelFromHoldBill", method = RequestMethod.POST)
	@ResponseBody
	public Info cancelFromHoldBill(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int index = Integer.parseInt(request.getParameter("key"));
			hashMap.remove(index);

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/billOnHold", method = RequestMethod.POST)
	@ResponseBody
	public Info billOnHold(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int key = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			String holdCustName = request.getParameter("holdCustName");

			/*
			 * Optional<Customer> result = custometList.stream() .filter(obj ->
			 * holdCustName.equalsIgnoreCase(obj.getPhoneNo())).findFirst();
			 */

			if (hashMap.containsKey(key)) {
				hashMap.get(key).setCustId(custId);
				hashMap.get(key).setTempCustomerName(holdCustName);
				hashMap.get(key).setItemBillList(itemList);
			} else {
				CustomerBillOnHold addNew = new CustomerBillOnHold();
				tempBillNo = tempBillNo + 1;
				addNew.setCustId(custId);
				addNew.setItemBillList(itemList);
				addNew.setTempCustomerName(holdCustName);
				hashMap.put(tempBillNo, addNew);
			}
			System.out.println(hashMap);
			info.setError(false);
			info.setMessage("Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/addItemInBillLIst", method = RequestMethod.POST)
	@ResponseBody
	public ErrorMsgWithItemList addItemInBillLIst(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		ErrorMsgWithItemList errorMsg = new ErrorMsgWithItemList();

		try {

			String itemName = request.getParameter("itemName");
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			float itemMrp = Float.parseFloat(request.getParameter("itemMrp"));
			float itemTax = Float.parseFloat(request.getParameter("itemTax"));
			String itemUom = request.getParameter("itemUom");
			int itemQty = Integer.parseInt(request.getParameter("qty"));
			float price = Float.parseFloat(request.getParameter("price"));
			float paybeleTax = Float.parseFloat(request.getParameter("paybeleTax"));
			float paybeleAmt = Float.parseFloat(request.getParameter("paybeleAmt"));
			float tax1 = Float.parseFloat(request.getParameter("tax1"));
			float tax2 = Float.parseFloat(request.getParameter("tax2"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			int avQty = Integer.parseInt(request.getParameter("aviableQty"));
			// System.err.println("catidtax1,2="+catId+tax1+tax2);

			int flag = 0;

			for (int i = 0; i < itemList.size(); i++) {
				if (itemList.get(i).getItemId() == itemId) {
					if (calStock == 1) {
						for (int j = 0; j < showItemList.size(); j++) {
							if (Integer.parseInt(showItemList.get(j).getItemId()) == itemId) {

								float curntQty = itemList.get(i).getItemQty() + showItemList.get(j).getTotalRegStock();

								if (curntQty >= itemQty) {

									showItemList.get(j).setTotalRegStock(
											itemList.get(i).getItemQty() + showItemList.get(j).getTotalRegStock());

									itemList.get(i).setItemQty(itemQty);
									// float taxAmt=(price/100)*100;
									itemList.get(i).setItemName(itemName);
									itemList.get(i).setItemMrp(itemMrp);
									itemList.get(i).setCalPrice(price);
									itemList.get(i).setPayableTax(paybeleTax);
									itemList.get(i).setPayableAmt(paybeleAmt);
									itemList.get(i).setTax1(tax1);
									itemList.get(i).setTax2(tax2);
									itemList.get(i).setCatId(catId);
									itemList.get(i).setAviableQty(avQty);
									showItemList.get(j)
											.setTotalRegStock(showItemList.get(j).getTotalRegStock() - itemQty);
									errorMsg.setItemList(itemList);
									errorMsg.setError(false);
									errorMsg.setMsg("Item added in cart.");
									break;
								} else {
									errorMsg.setItemList(itemList);
									errorMsg.setError(true);
									errorMsg.setMsg("Item is out of stock.");
									System.out.println("Out of Stock...");
								}
							}
						}
					} else {

						System.out.println("in else...");
						itemList.get(i).setItemQty(itemQty);
						// float taxAmt=(price/100)*100;
						itemList.get(i).setItemName(itemName);
						itemList.get(i).setItemMrp(itemMrp);
						itemList.get(i).setCalPrice(price);
						itemList.get(i).setPayableTax(paybeleTax);
						itemList.get(i).setPayableAmt(paybeleAmt);
						itemList.get(i).setTax1(tax1);
						itemList.get(i).setTax2(tax2);
						itemList.get(i).setCatId(catId);
						itemList.get(i).setAviableQty(avQty);

						errorMsg.setItemList(itemList);
						errorMsg.setError(false);
						errorMsg.setMsg("Item added in cart.");

					}
					flag = 1;
					break;
				}
			}
			System.out.println("flag " + flag);
			if (flag == 0) {
				if (calStock == 1) {
					for (int i = 0; i < showItemList.size(); i++) {
						if (Integer.parseInt(showItemList.get(i).getItemId()) == itemId) {
							if (showItemList.get(i).getTotalRegStock() >= itemQty) {
								showItemList.get(i).setTotalRegStock(showItemList.get(i).getTotalRegStock() - itemQty);
								BillItemList it = new BillItemList();
								it.setItemId(itemId);
								it.setItemName(itemName);
								it.setItemQty(itemQty);
								it.setItemMrp(itemMrp);
								it.setCalPrice(price);
								it.setItemUom(itemUom);
								it.setItemTax(itemTax);
								it.setPayableTax(paybeleTax);
								it.setPayableAmt(paybeleAmt);
								it.setTax1(tax1);
								it.setTax2(tax2);
								it.setCatId(catId);
								it.setAviableQty(avQty);
								itemList.add(it);
								errorMsg.setItemList(itemList);
								errorMsg.setError(false);
								errorMsg.setMsg("Item added in cart.");
								System.out.println("stock " + showItemList.get(i).getTotalRegStock());
								break;
							} else {
								errorMsg.setItemList(itemList);
								errorMsg.setError(true);
								errorMsg.setMsg("Item is out of stock.");
								System.out.println("Out of Stock...");
							}
						}

					}
				} else {

					BillItemList it = new BillItemList();
					it.setItemId(itemId);
					it.setItemName(itemName);
					it.setItemQty(itemQty);
					it.setItemMrp(itemMrp);
					it.setCalPrice(price);
					it.setItemUom(itemUom);
					it.setItemTax(itemTax);
					it.setPayableTax(paybeleTax);
					it.setPayableAmt(paybeleAmt);
					it.setTax1(tax1);
					it.setTax2(tax2);
					it.setCatId(catId);
					it.setAviableQty(avQty);
					itemList.add(it);
					errorMsg.setItemList(itemList);
					errorMsg.setError(false);
					errorMsg.setMsg("Item added in cart.");
				}

			}
			errorMsg.setItemList(itemList);

		} catch (Exception e) {
			// TODO: handle exception
			errorMsg.setItemList(itemList);
			errorMsg.setError(true);
			errorMsg.setMsg("Error while adding item in cart.");
			e.printStackTrace();
		}

		return errorMsg;
	}

	@RequestMapping(value = "/getCustomerList", method = RequestMethod.GET)
	@ResponseBody
	public List<CustomerForOps> getCustomerList(HttpServletRequest request, HttpServletResponse response) {
		// System.err.println("in Get Customer List");
		return custometList;

	}

	@RequestMapping(value = "/getItemList", method = RequestMethod.GET)
	@ResponseBody
	public List<BillItemList> getItemList(HttpServletRequest request, HttpServletResponse response) {
		// System.err.println("in Get Item List");
		return itemList;

	}

	@RequestMapping(value = "/getAllItemList", method = RequestMethod.GET)
	@ResponseBody
	public List<NewPosBillItem> getAllItemList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("showItemList " + showItemList);
		return showItemList;

	}

	@RequestMapping(value = "/getSubCatByCatIdAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<SubCategory> getSubCatByCatIdAjax(HttpServletRequest request, HttpServletResponse response) {

		List<SubCategory> subCatList = new ArrayList<SubCategory>();
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			RestTemplate restTemplate = new RestTemplate();

			map.add("catId", Integer.parseInt(request.getParameter("catId")));
			SubCategory[] subCatArr = restTemplate.postForObject(Constant.URL + "getSubCateListByCatId", map,
					SubCategory[].class);

			subCatList = new ArrayList<SubCategory>(Arrays.asList(subCatArr));

		} catch (Exception e) {

			System.err.println("Exce in getSubCatByCatIdAjax Ajax " + e.getMessage());
			e.printStackTrace();

		}
		return subCatList;
	}

	/*
	 * @RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public Info addCustomer(HttpServletRequest request,
	 * HttpServletResponse response) { // System.err.println("in Add Customer"); int
	 * flag = 0;
	 * 
	 * Info info = new Info();
	 * 
	 * String uuid = UUID.randomUUID().toString();
	 * 
	 * try { String name = request.getParameter("name"); String mob =
	 * request.getParameter("mob"); String gst = request.getParameter("gst");
	 * Customer cust = new Customer();
	 * 
	 * cust.setId(uuid); cust.setUserName(name); cust.setPhoneNo(mob);
	 * cust.setGstNo(gst); custometList.add(cust);
	 * 
	 * flag = 1; info.setError(false); info.setMessage(mob);
	 * 
	 * customerTempList.add(cust);
	 * 
	 * } catch (Exception e) { // TODO: handle exception //
	 * System.err.println("Exception Occuered In Catach Block Of /addCustomer");
	 * flag = 0; info.setError(true); info.setMessage(String.valueOf(0));
	 * e.printStackTrace(); }
	 * 
	 * return info;
	 * 
	 * }
	 */

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	@ResponseBody
	public AddCustemerResponse saveCustomerFromBill(HttpServletRequest request, HttpServletResponse responsel) {

		AddCustemerResponse info = new AddCustemerResponse();

		try {
			RestTemplate restTemplate = new RestTemplate();
			String customerName = request.getParameter("customerName");
			String mobileNo = request.getParameter("mobileNo");
			String dateOfBirth = request.getParameter("dateOfBirth");
			String buisness = request.getParameter("buisness");
			String companyName = request.getParameter("companyName");
			String gstNo = request.getParameter("gstNo");
			String custAdd = request.getParameter("custAdd");
			int custId = Integer.parseInt(request.getParameter("custId"));
			int custType = Integer.parseInt(request.getParameter("custType"));
			String ageRange = request.getParameter("ageRange");
			int gender = Integer.parseInt(request.getParameter("gender"));
			float kms = Float.parseFloat(request.getParameter("kms"));
			String pincode = request.getParameter("pincode");
			String remark = request.getParameter("remark");

			String str = pincode + "-" + remark;

			CustomerForOps save = new CustomerForOps();
			save.setCustName(customerName);
			save.setPhoneNumber(mobileNo);
			save.setIsBuissHead(Integer.parseInt(buisness));
			save.setCustDob(dateOfBirth);
			save.setCompanyName(companyName);
			save.setAddress(custAdd);
			save.setGstNo(gstNo);
			save.setDelStatus(0);
			save.setCustId(custId);

			save.setAgeGroup(ageRange);
			save.setExInt1(custType);
			save.setExVar1("" + kms);
			save.setGender(gender);
			save.setExVar2(str);
			CustomerForOps res = restTemplate.postForObject(Constant.URL + "/saveCustomerForOps", save,
					CustomerForOps.class);

			CustomerForOps[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomersForOps",
					CustomerForOps[].class);
			custometList = new ArrayList<>(Arrays.asList(customer));

			if (res == null) {

				info.setError(true);
			} else {
				info.setCustomerList(custometList);
				info.setAddCustomerId(res.getCustId());
				info.setError(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}
		return info;
	}

	@RequestMapping(value = "/deleteItem", method = RequestMethod.POST)
	@ResponseBody
	public List<BillItemList> deleteItem(HttpServletRequest request, HttpServletResponse response) {
		// System.err.println("In Dlete Item From ItemList");
		try {

			int id = Integer.parseInt(request.getParameter("id"));

			for (int i = 0; i < itemList.size(); i++) {
				if (itemList.get(i).getItemId() == id) {
					if (calStock == 1) {
						for (int j = 0; j < showItemList.size(); j++) {

							if (Integer.parseInt(showItemList.get(j).getItemId()) == itemList.get(i).getItemId()) {
								showItemList.get(j).setTotalRegStock(
										showItemList.get(j).getTotalRegStock() + itemList.get(i).getItemQty());
								break;

							}
						}
					}
					itemList.remove(i);
					break;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In Catch Block Of /deleteItem");
			e.printStackTrace();
		}

		return itemList;
	}

	@RequestMapping(value = "/genrateSellBill", method = RequestMethod.POST)
	public @ResponseBody Info genrateSellBill(HttpServletRequest request, HttpServletResponse response) {
		// System.err.println("In genrateSellBill ");

		Info info = new Info();

		String cName = "", cPhone = "", cGst = "";
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		java.sql.Date cDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		SellBillHeader sellBillHeaderRes = new SellBillHeader();

		try {
			int index = Integer.parseInt(request.getParameter("key"));
			String custDetails = request.getParameter("custName");
			// float paidAmt= Float.parseFloat(request.getParameter("paidAmt"));
			int payMode = Integer.parseInt(request.getParameter("payMode"));
			// System.err.println(custDetails+"cust");
			float discountPer = Float.parseFloat(request.getParameter("discPer"));
			float payableAmount = Float.parseFloat(request.getParameter("payableAmt"));
			/*
			 * Optional<Customer> result = custometList.stream() .filter(obj ->
			 * custDetails.equalsIgnoreCase(obj.getPhoneNo())).findFirst();
			 * 
			 * if (result != null) { cName = result.get().getUserName(); cPhone =
			 * result.get().getPhoneNo(); cGst = result.get().getGstNo(); }
			 */

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.now();

			System.out.println("Cust==========" + cName + cPhone + cGst);

			SellBillHeader sellBillHeader = new SellBillHeader();

			sellBillHeader.setFrId(frDetails.getFrId());
			sellBillHeader.setFrCode(frDetails.getFrCode());
			sellBillHeader.setDelStatus(0);
			sellBillHeader.setUserName(cName);
			sellBillHeader.setBillDate(dtf.format(localDate));
			sellBillHeader.setInvoiceNo(getInvoiceNo(request, response));
			sellBillHeader.setPaidAmt(Math.round(payableAmount));
			sellBillHeader.setPaymentMode(payMode);
			sellBillHeader.setBillType('R');
			sellBillHeader.setSellBillNo(0);

			sellBillHeader.setUserGstNo(cGst);

			sellBillHeader.setUserPhone(cPhone);

			List<SellBillDetail> sellBillDetailList = new ArrayList<SellBillDetail>();
			List<CustomerBillItem> customerBillItemList = new ArrayList<CustomerBillItem>();

			float sumTaxableAmt = 0, sumTotalTax = 0, sumGrandTotal = 0, sumMrp = 0;
			float sumDiscAmt = 0.f;
			for (int i = 0; i < itemList.size(); i++) {
				SellBillDetail sellBillDetail = new SellBillDetail();

				Float rate = (float) itemList.get(i).getItemMrp();

				Float tax1 = (float) itemList.get(i).getTax1();
				Float tax2 = (float) itemList.get(i).getTax2();
				Float tax3 = (float) itemList.get(i).getItemTax();

				int qty = itemList.get(i).getItemQty();

				Float mrpBaseRate = (rate * 100) / (100 + (tax1 + tax2));
				mrpBaseRate = roundUp(mrpBaseRate);

				System.out.println("Mrp: " + rate);
				System.out.println("Tax1 : " + tax1);
				System.out.println("tax2 : " + tax2);

				Float taxableAmt = (float) (mrpBaseRate * qty);
				taxableAmt = roundUp(taxableAmt);

				// -----------------------------------------

				float discAmt = ((taxableAmt * discountPer) / 100);
				sumDiscAmt = sumDiscAmt + discAmt;
				taxableAmt = taxableAmt - discAmt;

				float sgstRs = (taxableAmt * tax1) / 100;
				float cgstRs = (taxableAmt * tax2) / 100;
				float igstRs = (taxableAmt * tax3) / 100;

				sgstRs = roundUp(sgstRs);
				cgstRs = roundUp(cgstRs);
				igstRs = roundUp(igstRs);

				Float totalTax = sgstRs + cgstRs;
				totalTax = roundUp(totalTax);

				Float grandTotal = totalTax + taxableAmt;
				grandTotal = roundUp(grandTotal);

				sellBillDetail.setCatId(itemList.get(i).getCatId());
				sellBillDetail.setSgstPer(tax1);
				sellBillDetail.setSgstRs(sgstRs);
				sellBillDetail.setCgstPer(tax2);
				sellBillDetail.setCgstRs(cgstRs);
				sellBillDetail.setDelStatus(0);
				sellBillDetail.setGrandTotal(grandTotal);
				sellBillDetail.setIgstPer(tax3);
				sellBillDetail.setIgstRs(igstRs);
				sellBillDetail.setItemId(itemList.get(i).getItemId());
				sellBillDetail.setMrp(rate);
				sellBillDetail.setMrpBaseRate(mrpBaseRate);
				sellBillDetail.setQty(itemList.get(i).getItemQty());
				sellBillDetail.setRemark("");
				sellBillDetail.setSellBillDetailNo(0);
				sellBillDetail.setSellBillNo(0);
				sellBillDetail.setBillStockType(1);

				// sumMrp = sumMrp + (rate * qty);
				sumTaxableAmt = sumTaxableAmt + taxableAmt;
				sumTotalTax = sumTotalTax + totalTax;
				sumGrandTotal = sumGrandTotal + totalTax + taxableAmt;

				sellBillDetail.setTaxableAmt(taxableAmt);
				sellBillDetail.setTotalTax(totalTax);

				sellBillDetailList.add(sellBillDetail);

				/*
				 * for (int j = 0; j < submitSellBillItemList.size(); j++) { if
				 * (submitSellBillItemList.get(j).getItemId() == itemList.get(i).getItemId()) {
				 * submitSellBillItemList.get(j).setItemQty(itemList.get(i).getItemQty());
				 * break; }
				 * 
				 * }
				 */

			}

			sellBillHeader.setTaxableAmt(sumTaxableAmt);
			sellBillHeader.setDiscountPer(discountPer);

			float payableAmt = sumGrandTotal;

			payableAmt = roundUp(payableAmt);

			sellBillHeader.setDiscountAmt(Math.round(payableAmount));
			sellBillHeader.setPayableAmt(Math.round(payableAmount));
			System.out.println("Payable amt  : " + payableAmt);
			sellBillHeader.setTotalTax(sumTotalTax);
			sellBillHeader.setGrandTotal(Math.round(sumGrandTotal));

			float calRemainingTotal = 0;

			if (calRemainingTotal < 0) {
				sellBillHeader.setRemainingAmt(0);

			} else {

				sellBillHeader.setRemainingAmt(calRemainingTotal);
			}
			if (calRemainingTotal <= 0) {

				sellBillHeader.setStatus(1);
			} else if (calRemainingTotal == payableAmt) {
				sellBillHeader.setStatus(2);

			} else if (payableAmt > calRemainingTotal) {
				sellBillHeader.setStatus(3);
			}

			sellBillHeader.setSellBillDetailsList(sellBillDetailList);

			System.out.println("Sell Bill Detail: " + sellBillHeader.toString());

			RestTemplate restTemplate = new RestTemplate();

			sellBillHeaderRes = restTemplate.postForObject(Constant.URL + "insertSellBillData", sellBillHeader,
					SellBillHeader.class);

			System.out.println("info :" + sellBillHeaderRes.toString());

			// System.out.println("Sell Bill Header: " + sellBillHeader.toString());

			if (sellBillHeaderRes != null) {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);

				int sellBillNo = frSetting.getSellBillNo();

				sellBillNo = sellBillNo + 1;

				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				map.add("sellBillNo", sellBillNo);

				Info info1 = restTemplate.postForObject(Constant.URL + "updateFrSettingBillNo", map, Info.class);

				try {
					String isSMS = request.getParameter("isSMS");
					if (isSMS.equals("1"))
						Common.sendTextMessage(2, cName, frDetails.getFrName(), "", "",
								sellBillHeaderRes.getGrandTotal(), "", cPhone);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			itemList = new ArrayList<BillItemList>();
			hashMap.remove(index);

			info.setError(false);
			info.setMessage(String.valueOf(sellBillHeaderRes.getSellBillNo()));
		} catch (Exception e) {
			info.setError(true);
			info.setMessage("Error while generating bill...");
			e.printStackTrace();
		}

		System.out.println("Order Response:" + sellBillHeaderRes.toString());

		return info;
	}

	public String getInvoiceNo(HttpServletRequest request, HttpServletResponse response) {

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		RestTemplate restTemplate = new RestTemplate();

		HttpSession session = request.getSession();

		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		int frId = frDetails.getFrId();

		// String frCode = frDetails.getFrCode();

		map.add("frId", frId);
		FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map, FrSetting.class);

		int billNo = frSetting.getSellBillNo();

		int settingValue = billNo;

		System.out.println("Setting Value Received " + settingValue);
		int year = Year.now().getValue();
		String curStrYear = String.valueOf(year);
		curStrYear = curStrYear.substring(2);

		int preMarchYear = Year.now().getValue() - 1;
		String preMarchStrYear = String.valueOf(preMarchYear);
		preMarchStrYear = preMarchStrYear.substring(2);

		System.out.println("Pre MArch year ===" + preMarchStrYear);

		int nextYear = Year.now().getValue() + 1;
		String nextStrYear = String.valueOf(nextYear);
		nextStrYear = nextStrYear.substring(2);

		System.out.println("Next  year ===" + nextStrYear);

		int postAprilYear = nextYear + 1;
		String postAprilStrYear = String.valueOf(postAprilYear);
		postAprilStrYear = postAprilStrYear.substring(2);

		System.out.println("Post April   year ===" + postAprilStrYear);

		java.util.Date date = new Date();
		Calendar cale = Calendar.getInstance();
		cale.setTime(date);
		int month = cale.get(Calendar.MONTH);

		month = month + 1;

		if (month <= 3) {

			curStrYear = preMarchStrYear + curStrYear;
			System.out.println("Month <= 3::Cur Str Year " + curStrYear);
		} else if (month >= 4) {

			curStrYear = curStrYear + nextStrYear;
			System.out.println("Month >=4::Cur Str Year " + curStrYear);
		}

		////

		int length = String.valueOf(settingValue).length();

		String invoiceNo = null;

		if (length == 1) {
			invoiceNo = curStrYear + "-" + "0000" + settingValue;
		} else if (length == 2) {
			invoiceNo = curStrYear + "-" + "000" + settingValue;
		} else if (length == 3) {
			invoiceNo = curStrYear + "-" + "00" + settingValue;
		} else if (length == 4) {
			invoiceNo = curStrYear + "-" + "0" + settingValue;
		} else {
			invoiceNo = curStrYear + "-" + settingValue;
		}
		invoiceNo = frDetails.getFrCode() + invoiceNo;
		System.out.println("*** settingValue= " + settingValue);
		return invoiceNo;

	}

	public static float roundUp(float d) {
		return BigDecimal.valueOf(d).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
	}

	@RequestMapping(value = "/pdfSellBillNewPos", method = RequestMethod.GET)
	public ModelAndView demoBill(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("in pdfSellBillNewPos Mapping");
		String sellBillNo = request.getParameter("billNo");
		System.out.println("bill No " + sellBillNo);
		String billType = request.getParameter("type");
		int billNo = Integer.parseInt(sellBillNo);
		// int billNo=Integer.parseInt(fr_Id);
		HttpSession ses = request.getSession();
		Franchisee frDetails = (Franchisee) ses.getAttribute("frDetails");
		frGstType = frDetails.getFrGstType();
		ModelAndView model = new ModelAndView("report/franchCompInvoice");

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("billNo", billNo);
			if (frGstType == 10000000) {
				model = new ModelAndView("report/franchTaxInvoice");
				List<GetCustBillTax> getCustBilTaxList = rest.postForObject(Constant.URL + "getCustomerBillTax", map,
						List.class);

				model.addObject("custBilltax", getCustBilTaxList);
			}

			ParameterizedTypeReference<List<GetCustmoreBillResponse>> typeRef = new ParameterizedTypeReference<List<GetCustmoreBillResponse>>() {
			};
			ResponseEntity<List<GetCustmoreBillResponse>> responseEntity = rest
					.exchange(Constant.URL + "getCustomerBill", HttpMethod.POST, new HttpEntity<>(map), typeRef);

			List<GetCustmoreBillResponse> getCustmoreBillResponseList = responseEntity.getBody();

			GetCustmoreBillResponse billResponse = getCustmoreBillResponseList.get(0);
			// System.err.println("custBill Resp"+getCustmoreBillResponseList.get(0));

			float billAmt = billResponse.getMrp() * billResponse.getQty();
			float discPer = billResponse.getDiscountPer();
			// System.err.println("Bill Amount======="+billAmt);
			float intDiscAmt = roundUp((billAmt * discPer) / 100);

			getCustmoreBillResponseList.get(0).setIntDiscAmt(intDiscAmt);

			// For Get Proper Values In Print
			getCustmoreBillResponseList.get(0).setDiscountAmt(billResponse.getMrp() * billResponse.getQty());
			//
			System.out.println("bill no:" + billNo + "Custmore Bill : " + getCustmoreBillResponseList.toString());

			model.addObject("billList", getCustmoreBillResponseList);
			model.addObject("frGstType", frGstType);
			model.addObject("billType", billType);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/cancelBill", method = RequestMethod.GET)
	public @ResponseBody List<BillItemList> cancelBill(HttpServletRequest request, HttpServletResponse response) {

		itemList = new ArrayList<BillItemList>();

		return itemList;

	}

	@RequestMapping(value = "/submitBillByPaymentOption", method = RequestMethod.POST)
	@ResponseBody
	public Info submitBillByPaymentOption(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();
		HttpSession session = request.getSession();
		FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		try {

			System.out.println("sdfsfsdf");
			RestTemplate restTemplate = new RestTemplate();

			float advAmt = Float.parseFloat(request.getParameter("advAmt"));
			System.err.println("advAmt" + advAmt);
			String advOrderDate = request.getParameter("advOrderDate");
			int isAdvanceOrder = 0;

			int index = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			int creditBill = Integer.parseInt(request.getParameter("creditBill"));
			int paymentMode = Integer.parseInt(request.getParameter("paymentMode"));
			int billType = Integer.parseInt(request.getParameter("billType"));
			int payType = Integer.parseInt(request.getParameter("payType"));
			String payTypeSplit = request.getParameter("payTypeSplit");
			float cashAmt = Float.parseFloat(request.getParameter("cashAmt"));
			float cardAmt = Float.parseFloat(request.getParameter("cardAmt"));
			float epayAmt = Float.parseFloat(request.getParameter("epayAmt"));
			float discPer = Float.parseFloat(request.getParameter("discPer"));
			float discAmt = Float.parseFloat(request.getParameter("discAmt"));
			float billAmtWtDisc = Float.parseFloat(request.getParameter("billAmtWtDisc"));// without Disc BillAmt
			String customerName = request.getParameter("selectedText");
			String payAmt = request.getParameter("payAmt");
			String remark = request.getParameter("remark");

			String items = "0";
			for (int i = 0; i < itemList.size(); i++) {
				items = items + "," + itemList.get(i).getItemId();
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			CustomerForOps customerById = restTemplate.postForObject(Constant.URL + "/getCustomerByCustIdForOps", map,
					CustomerForOps.class);

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
					ItemResponse.class);
			List<Item> itemsListByIds = itemResponse.getItemList();

			List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

			float total = 0, grandTot = 0;
			float taxableAmt = 0;
			float taxAmt = 0;

			for (int i = 0; i < itemList.size(); i++) {

				for (int j = 0; j < itemsListByIds.size(); j++) {

					if (itemsListByIds.get(j).getId() == itemList.get(i).getItemId()) {
						grandTot = grandTot + (itemList.get(i).getCalPrice());
					}
				}

			}

			for (int i = 0; i < itemList.size(); i++) {

				for (int j = 0; j < itemsListByIds.size(); j++) {

					if (itemsListByIds.get(j).getId() == itemList.get(i).getItemId()) {

						SellBillDetail sellBillDetail = new SellBillDetail();

						sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
						sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());

						sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());

						sellBillDetail.setDelStatus(0);
						sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());

						sellBillDetail.setItemId(itemList.get(i).getItemId());
						sellBillDetail.setMrp(itemList.get(i).getItemMrp());

						float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemList.get(i).getItemTax());
						sellBillDetail.setMrpBaseRate(mrpBaseRate);

						// -----------------------------------------

						/*
						 * float detailDiscAmt = (itemList.get(i).getTotal() / (billAmtWtDisc / 100)
						 * (discAmt / 100));
						 */

						float detailDiscPer = 0;
						float detailDiscAmt = 0;

						if (discAmt > 0) {
							detailDiscPer = ((itemList.get(i).getCalPrice() * 100) / grandTot);
							detailDiscAmt = ((detailDiscPer * discAmt) / 100);
						}

						float detailGrandTotal = CustomerBillController
								.roundUp(itemList.get(i).getCalPrice() - detailDiscAmt);

						float baseRate = ((detailGrandTotal * 100)
								/ (100 + itemsListByIds.get(j).getItemTax1() + itemsListByIds.get(j).getItemTax2()));
						float totalTaxedAmt = CustomerBillController.roundUp(baseRate
								* ((itemsListByIds.get(j).getItemTax1() + itemsListByIds.get(j).getItemTax2()) / 100));

						/*
						 * System.err.println("ITEM TOTAL = "+itemList.get(i).getTotal());
						 * System.err.println("DISC AMT = "+discAmt);
						 * System.err.println("ITEM DISC PER = "+detailDiscPer);
						 * System.err.println("ITEM GRAND TOTAL = "+detailGrandTotal);
						 * System.err.println("ITEM CGST = "+itemsListByIds.get(j).getItemTax2());
						 * System.err.println("ITEM SGST = "+itemsListByIds.get(j).getItemTax1());
						 * System.err.println("ITEM BASE RATE = "+baseRate);
						 * System.err.println("ITEM TOTAL TAXED AMT = "+totalTaxedAmt);
						 */

						float detailSgstRs = totalTaxedAmt / 2;
						float detailCgstRs = totalTaxedAmt / 2;
						float detailIgstRs = totalTaxedAmt;

						/*
						 * System.err.println("ITEM SGST AMT = "+detailSgstRs);
						 * System.err.println("ITEM CGST AMT = "+detailCgstRs);
						 * System.err.println("ITEM IGST AMT = "+detailIgstRs);
						 */

						/*
						 * float detailSgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax1())
						 * / 100; float detailCgstRs = (detailGrandTotal *
						 * itemsListByIds.get(j).getItemTax2()) / 100; float detailIgstRs =
						 * (detailGrandTotal * itemsListByIds.get(j).getItemTax3()) / 100;
						 */

						/*
						 * System.err.println("rate - " + i + " = " + itemList.get(i).getOrignalMrp());
						 * System.err.println("qty - " + i + " = " + itemList.get(i).getQty());
						 * 
						 * System.err.println("getTotal - " + i + " = " + itemList.get(i).getTotal());
						 * System.err.println("billAmtWtDisc - " + billAmtWtDisc);
						 * System.err.println("discAmt - " + discAmt);
						 * 
						 * System.err.println("detailDiscAmt - " + detailDiscAmt);
						 * System.err.println("detailGrandTotal - " + detailGrandTotal);
						 */

						detailSgstRs = CustomerBillController.roundUp(detailSgstRs);
						detailCgstRs = CustomerBillController.roundUp(detailCgstRs);
						detailIgstRs = CustomerBillController.roundUp(detailIgstRs);

						float detailTotalTax = detailSgstRs + detailCgstRs;
						detailTotalTax = CustomerBillController.roundUp(detailTotalTax);

						float detailTaxableAmt = detailGrandTotal - detailTotalTax;
						detailTaxableAmt = CustomerBillController.roundUp(detailTaxableAmt);

						System.err.println("TAXABLE AMT = " + detailTaxableAmt);
						System.err.println("-------------------------------------------------------- - ");

						sellBillDetail.setSgstRs(detailSgstRs);
						sellBillDetail.setCgstRs(detailCgstRs);
						sellBillDetail.setIgstRs(detailIgstRs);

						sellBillDetail.setQty(itemList.get(i).getItemQty());
						// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
						sellBillDetail.setSellBillDetailNo(0);
						sellBillDetail.setSellBillNo(0);
						sellBillDetail.setBillStockType(1);
						sellBillDetail.setTaxableAmt(detailTaxableAmt);// itemList.get(i).getTaxableAmt());
						sellBillDetail.setTotalTax(detailTotalTax);// itemList.get(i).getTaxAmt());
						sellBillDetail.setGrandTotal(detailGrandTotal);// 'itemList.get(i).getTotal());
						sellBillDetail.setItemName(itemList.get(i).getItemName());
						sellBillDetail.setDiscAmt(detailDiscAmt);
						sellBillDetail.setDiscPer(detailDiscPer);
						sellBillDetail.setExtFloat1(itemList.get(i).getCalPrice());

						System.err.println("ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

						sellBillDetail.setExtVar1(itemsListByIds.get(j).getItemImage());

						sellbilldetaillist.add(sellBillDetail);
						total = total + detailGrandTotal;// sellBillDetail.getGrandTotal();
						taxableAmt = taxableAmt + detailTaxableAmt;
						taxAmt = taxAmt + detailTotalTax;

						// grandTot=grandTot+itemList.get(i).getTotal();

						break;
					}
				}

			}

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();

			SellBillHeader sellBillHeader = new SellBillHeader();

			sellBillHeader.setFrId(frDetails.getFrId());
			sellBillHeader.setFrCode(frDetails.getFrCode());
			sellBillHeader.setDelStatus(0);
			sellBillHeader.setUserName(customerById.getCustName());

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());
			PettyCashManagmt petty = restTemplate.postForObject(Constant.URL + "/getPettyCashDetails", map,
					PettyCashManagmt.class);

			String billDate = sf.format(date);
			if (petty != null) {

				SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat ymdSDF1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Calendar cal = Calendar.getInstance();
				cal.setTimeInMillis(Long.parseLong(petty.getDate()));
				cal.add(Calendar.DAY_OF_MONTH, 1);

				billDate = ymdSDF.format(cal.getTime());
			}

			// sellBillHeader.setBillDate(sf.format(date));
			sellBillHeader.setBillDate(billDate);

			sellBillHeader.setCustId(custId);
			sellBillHeader.setInvoiceNo(getInvoiceNo(request, responsel));
			sellBillHeader.setSellBillNo(0);
			sellBillHeader.setUserGstNo(customerById.getGstNo());
			sellBillHeader.setUserPhone(customerById.getPhoneNumber());
			sellBillHeader.setBillType('R');
			sellBillHeader.setTaxableAmt(taxableAmt);
			sellBillHeader.setPayableAmt(Math.round(total));
			sellBillHeader.setTotalTax(taxAmt);
			sellBillHeader.setGrandTotal(Math.round(grandTot));

			// billType=1 => CASH
			// billType=2 => CARD
			// billType=3 => EPAY
			sellBillHeader.setPaymentMode(billType);

			if (discPer != 0) {
				sellBillHeader.setDiscountPer(discPer);//
			} else {
				sellBillHeader.setDiscountPer(discAmt / (billAmtWtDisc / 100));//
			}

			sellBillHeader.setDiscountAmt(discAmt);//
			if (creditBill == 1) {
				sellBillHeader.setStatus(3);
				sellBillHeader.setRemainingAmt(Math.round(total) - advAmt);
				sellBillHeader.setPaidAmt(advAmt);

				// sellBillHeader.setPaymentMode(1);
			} else {
				sellBillHeader.setStatus(2);
				sellBillHeader.setRemainingAmt(0);
				// sellBillHeader.setPaymentMode(paymentMode);
				sellBillHeader.setPaidAmt(Math.round(total));

			}

			sellBillHeader.setExtInt1(frEmpDetails.getFrEmpId());

			float roundOff = 0;
			roundOff = taxableAmt + taxAmt - Math.round(total);
			sellBillHeader.setExtFloat1(roundOff);

			System.err.println("ROUND OFF = " + roundOff);

			sellBillHeader.setSellBillDetailsList(sellbilldetaillist);

			info.setError(false);
			info.setMessage("Bill Submited");

			hashMap.remove(index);
			itemList = new ArrayList<>();

			SellBillHeader sellBillHeaderRes = restTemplate.postForObject(Constant.URL + "insertSellBillData",
					sellBillHeader, SellBillHeader.class);

			if (sellBillHeaderRes != null) {

				List<TransactionDetail> dList = new ArrayList<>();

				TransactionDetail transactionDetail = new TransactionDetail();
				transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
				// transactionDetail.setTransactionDate(sf1.format(date));

				Date dt = sf.parse(billDate);

				transactionDetail.setTransactionDate(sf1.format(dt));

				transactionDetail.setExInt1(frEmpDetails.getFrEmpId());

				transactionDetail.setePayType(payType);
				if (creditBill == 1) {
					transactionDetail.setCashAmt(0);
					transactionDetail.setPayMode(1);
					transactionDetail.setExVar1("0");

				} else {
					transactionDetail.setPayMode(paymentMode);

					if (paymentMode == 1) {

						/*if (billType == 1) {*/
							transactionDetail.setCashAmt(Math.round(Float.parseFloat(payAmt)));
							transactionDetail.setExVar1("0," + payType);
						/*
						 * } else if (billType == 2) {
						 * transactionDetail.setCardAmt(Math.round(Float.parseFloat(payAmt)));
						 * transactionDetail.setExVar1("0," + payType); } else if (billType == 3) {
						 * transactionDetail.setePayAmt(Math.round(Float.parseFloat(payAmt)));
						 * transactionDetail.setExVar1("0," + payType); }
						 */
					} else {

						String type = payTypeSplit;
						if (cashAmt > 0) {
							transactionDetail.setCashAmt(Math.round(cashAmt));
						}
						if (cardAmt > 0) {
							transactionDetail.setCardAmt(Math.round(cardAmt));
							// type = type + "," + 2;
						}
						if (epayAmt > 0) {
							transactionDetail.setePayAmt(Math.round(epayAmt));
							// type = type + "," + 3;
						}
						transactionDetail.setExVar1(type);
					}

				}

				transactionDetail.setRemark(remark);

				dList.add(transactionDetail);
				if (advAmt > 0) {
					transactionDetail = new TransactionDetail();
					transactionDetail.setCashAmt(Math.round(advAmt));
					transactionDetail.setPayMode(1);
					transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
					transactionDetail.setTransactionDate(DateConvertor.convertToDMY(advOrderDate));
					transactionDetail.setExVar1("0,1");
					transactionDetail.setExInt1(frEmpDetails.getFrEmpId());

					transactionDetail.setExInt2(1);

					transactionDetail.setRemark(remark);

					dList.add(transactionDetail);
				}
				TransactionDetail[] transactionDetailRes = restTemplate
						.postForObject(Constant.URL + "saveTransactionDetail", dList, TransactionDetail[].class);

				map = new LinkedMultiValueMap<String, Object>();
				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);

				int sellBillNo = frSetting.getSellBillNo();

				sellBillNo = sellBillNo + 1;

				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				map.add("sellBillNo", sellBillNo);

				Info infores = restTemplate.postForObject(Constant.URL + "updateFrSettingBillNo", map, Info.class);
				if (isAdvanceOrder == 1) {
					map = new LinkedMultiValueMap<String, Object>();

					map.add("advHeadId", session.getAttribute("advHeadId"));

					Info infores1 = restTemplate.postForObject(Constant.URL + "updateAdvOrderHeadAndDetail", map,
							Info.class);

					if (infores1.isError() == false) {

						session.removeAttribute("advCustId");
						session.removeAttribute("advHeadId");
					}

				}
			}
			info.setMessage(String.valueOf(sellBillHeaderRes.getSellBillNo()));

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/submitBill", method = RequestMethod.POST)
	@ResponseBody
	public Info submitBill(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();
		RestTemplate restTemplate = new RestTemplate();

		try {

			/*
			 * int index = Integer.parseInt(request.getParameter("key")); key = index;
			 * 
			 * info.setError(false); info.setMessage("Successfully");
			 */
			int index = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			/* int advKey = Integer.parseInt(request.getParameter("advKey")); */
			String customerName = request.getParameter("selectedText");
			float advAmt = Float.parseFloat(request.getParameter("advAmt"));
			String advOrderDate = request.getParameter("advOrderDate");
			int isAdvanceOrder = 0;

			System.err.println("advAmt" + advAmt);
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");

			String items = "0";
			for (int i = 0; i < itemList.size(); i++) {
				items = items + "," + itemList.get(i).getItemId();
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			CustomerForOps customerById = restTemplate.postForObject(Constant.URL + "/getCustomerByCustIdForOps", map,
					CustomerForOps.class);

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
					ItemResponse.class);
			List<Item> itemsListByIds = itemResponse.getItemList();

			List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

			float total = 0;
			float taxableAmt = 0;
			float taxAmt = 0;

			for (int i = 0; i < itemList.size(); i++) {

				for (int j = 0; j < itemsListByIds.size(); j++) {

					if (itemsListByIds.get(j).getId() == itemList.get(i).getItemId()) {

						SellBillDetail sellBillDetail = new SellBillDetail();

						sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
						sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());
						sellBillDetail.setSgstRs(itemList.get(i).getTax1() / 2);
						sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());
						sellBillDetail.setCgstRs(itemList.get(i).getTax2() / 2);
						sellBillDetail.setDelStatus(0);
						sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());
						sellBillDetail.setIgstRs(itemList.get(i).getPayableTax());
						sellBillDetail.setItemId(itemList.get(i).getItemId());
						sellBillDetail.setMrp(itemList.get(i).getItemMrp());

						Float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemList.get(i).getItemTax());
						sellBillDetail.setMrpBaseRate(mrpBaseRate);

						sellBillDetail.setQty(itemList.get(i).getItemQty());
						// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
						sellBillDetail.setSellBillDetailNo(0);
						sellBillDetail.setSellBillNo(0);
						sellBillDetail.setBillStockType(1);
						sellBillDetail.setTaxableAmt(itemList.get(i).getCalPrice() - itemList.get(i).getPayableTax());
						sellBillDetail.setTotalTax(itemList.get(i).getPayableTax());
						sellBillDetail.setGrandTotal(itemList.get(i).getCalPrice());
						sellBillDetail.setItemName(itemList.get(i).getItemName());
						sellBillDetail.setExtFloat1(itemList.get(i).getCalPrice());

						System.err.println("ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

						sellBillDetail.setExtVar1(itemsListByIds.get(j).getExtVar2());
						sellbilldetaillist.add(sellBillDetail);
						total = total + sellBillDetail.getGrandTotal();
						taxableAmt = taxableAmt + sellBillDetail.getTaxableAmt();
						taxAmt = taxAmt + sellBillDetail.getTotalTax();

						break;
					}
				}

			}

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			SellBillHeader sellBillHeader = new SellBillHeader();

			sellBillHeader.setFrId(frDetails.getFrId());
			sellBillHeader.setFrCode(frDetails.getFrCode());
			sellBillHeader.setDelStatus(0);
			sellBillHeader.setUserName(customerById.getCustName());

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());
			PettyCashManagmt petty = restTemplate.postForObject(Constant.URL + "/getPettyCashDetails", map,
					PettyCashManagmt.class);

			String billDate = sf.format(date);
			if (petty != null) {

				SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				cal.setTimeInMillis(Long.parseLong(petty.getDate()));
				cal.add(Calendar.DAY_OF_MONTH, 1);

				billDate = ymdSDF.format(cal.getTime());
				System.err.println("BILL DATE ---------------- " + billDate);
			}

			sellBillHeader.setBillDate(billDate);
			sellBillHeader.setCustId(custId);
			sellBillHeader.setInvoiceNo(getInvoiceNo(request, responsel));
			sellBillHeader.setPaidAmt(Math.round(total));

			sellBillHeader.setPaymentMode(1);
			sellBillHeader.setSellBillNo(0);
			sellBillHeader.setUserGstNo(customerById.getGstNo());
			sellBillHeader.setUserPhone(customerById.getPhoneNumber());
			sellBillHeader.setBillType('R');
			sellBillHeader.setTaxableAmt(taxableAmt);
			sellBillHeader.setDiscountPer(0);
			sellBillHeader.setDiscountAmt(0);

			sellBillHeader.setPayableAmt(Math.round(total));
			sellBillHeader.setTotalTax(taxAmt);
			sellBillHeader.setGrandTotal(Math.round(total));

			sellBillHeader.setRemainingAmt(0);
			sellBillHeader.setStatus(2);
			sellBillHeader.setSellBillDetailsList(sellbilldetaillist);
			sellBillHeader.setExtInt1(frEmpDetails.getFrEmpId());

			float roundOff = 0;
			roundOff = taxableAmt + taxAmt - Math.round(total);
			sellBillHeader.setExtFloat1(roundOff);

			info.setError(false);
			info.setMessage("Bill Submited");

			hashMap.remove(index);
			itemList = new ArrayList<>();
			SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yyyy");
			SellBillHeader sellBillHeaderRes = restTemplate.postForObject(Constant.URL + "insertSellBillData",
					sellBillHeader, SellBillHeader.class);

			if (sellBillHeaderRes != null) {

				List<TransactionDetail> dList = new ArrayList<>();

				TransactionDetail transactionDetail = new TransactionDetail();

				if (advAmt > 0) {
					transactionDetail.setCashAmt(Math.round(total - advAmt));
					transactionDetail.setExInt2(1);

				} else {
					transactionDetail.setCashAmt(Math.round(total));
					transactionDetail.setExInt2(0);
				}

				System.err.println("BILLDATE ============ " + billDate);

				transactionDetail.setPayMode(1);
				transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
				// transactionDetail.setTransactionDate(sf1.format(date));

				Date dt = sf.parse(billDate);

				transactionDetail.setTransactionDate(sf1.format(dt));
				transactionDetail.setExVar1("0,1");
				transactionDetail.setExInt1(frEmpDetails.getFrEmpId());
				dList.add(transactionDetail);
				if (advAmt > 0) {
					transactionDetail = new TransactionDetail();
					transactionDetail.setCashAmt(advAmt);
					transactionDetail.setPayMode(1);
					transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
					transactionDetail.setTransactionDate(DateConvertor.convertToDMY(advOrderDate));
					transactionDetail.setExVar1("0,1");
					transactionDetail.setExInt1(frEmpDetails.getFrEmpId());

					transactionDetail.setExInt2(1);

					dList.add(transactionDetail);

				}
				TransactionDetail[] transactionDetailRes = restTemplate
						.postForObject(Constant.URL + "saveTransactionDetail", dList, TransactionDetail[].class);

				if (transactionDetailRes.length > 0) {
					transactionDetail = null;
				}
				map = new LinkedMultiValueMap<String, Object>();
				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);

				int sellBillNo = frSetting.getSellBillNo();

				sellBillNo = sellBillNo + 1;

				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				map.add("sellBillNo", sellBillNo);

				Info infores = restTemplate.postForObject(Constant.URL + "updateFrSettingBillNo", map, Info.class);

				if (isAdvanceOrder == 1) {

					map = new LinkedMultiValueMap<String, Object>();

					map.add("advHeadId", session.getAttribute("advHeadId"));

					Info infores1 = restTemplate.postForObject(Constant.URL + "updateAdvOrderHeadAndDetail", map,
							Info.class);

					if (infores1.isError() == false) {

						session.removeAttribute("advCustId");
						session.removeAttribute("advHeadId");
					}

				}

			}
			info.setMessage(String.valueOf(sellBillHeaderRes.getSellBillNo()));
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

}
