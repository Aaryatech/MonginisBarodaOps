package com.monginis.ops.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.monginis.ops.billing.SellBillDetail;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.AddCustemerResponse;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.CustomerAmounts;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.FranchiseSup;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.ItemResponse;
import com.monginis.ops.model.OpsFrItemStock;
import com.monginis.ops.model.PosCreditBillPrint;
import com.monginis.ops.model.PostFrItemStockHeader;
import com.monginis.ops.model.SubCategory;
import com.monginis.ops.model.TransactionDetail;
import com.monginis.ops.model.advorder.AdvanceOrderHeader;
import com.monginis.ops.model.frsetting.FrSetting;
import com.monginis.ops.model.newpos.CustomerBillOnHold;
import com.monginis.ops.model.newpos.ItemListForCustomerBill;
import com.monginis.ops.model.newpos.SellBillHeaderAndDetail;
import com.monginis.ops.model.newpos.UomWiseTotalList;
import com.monginis.ops.model.pettycash.FrEmpMaster;
import com.monginis.ops.model.pettycash.PettyCashManagmt;
import com.monginis.ops.model.setting.NewSetting;
import com.steadystate.css.ParseException;

@Controller
@Scope("session")
public class OpsController {
	
	RestTemplate restTemplate = new RestTemplate();
	List<ItemListForCustomerBill> itemBillList = new ArrayList<>();
	LinkedHashMap<Integer, CustomerBillOnHold> hashMap = new LinkedHashMap<Integer, CustomerBillOnHold>();
	int key = 0;
	int tempBillNo = 0;
	
	List<Item> posItemsList=new ArrayList<>();
	
	@RequestMapping(value = "/customerBill", method = RequestMethod.GET)
	public String displayCustomerBill(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "customerBill/customerbilling";

		try {
			HttpSession session = request.getSession();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/printKotBill/{billNo}", method = RequestMethod.GET)
	public String printKotBill(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printKotBill";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 0);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("empId", sellBillHeaderAndDetail.getExtInt1());

				FrEmpMaster frEmpMaster = restTemplate.postForObject(Constant.URL + "/getFrEmpByEmpId", map,
						FrEmpMaster.class);
				model.addAttribute("frEmpMaster", frEmpMaster);
			} catch (Exception e) {
				FrEmpMaster frEmpMaster = new FrEmpMaster();
				frEmpMaster.setFrEmpName("-");
				model.addAttribute("frEmpMaster", frEmpMaster);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	

	@RequestMapping(value = "/printBillOfSupply/{billNo}", method = RequestMethod.GET)
	public String printBillOfSupply(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printBillOfSupply";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 0);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("empId", sellBillHeaderAndDetail.getExtInt1());

				FrEmpMaster frEmpMaster = restTemplate.postForObject(Constant.URL + "/getFrEmpByEmpId", map,
						FrEmpMaster.class);
				model.addAttribute("frEmpMaster", frEmpMaster);
			} catch (Exception e) {
				FrEmpMaster frEmpMaster = new FrEmpMaster();
				frEmpMaster.setFrEmpName("-");
				model.addAttribute("frEmpMaster", frEmpMaster);
			}
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {
				e.printStackTrace();
			}

			StringBuilder payMode = new StringBuilder();

			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("sellBillNo", billNo);
				TransactionDetail trDetail = restTemplate.postForObject(Constant.URL + "/getTransactionByBillId", map,
						TransactionDetail.class);
				System.err.println("TR DETAIL - " + trDetail);

				if (trDetail != null) {
					List<Integer> mode = Stream.of(trDetail.getExVar1().split(",")).map(Integer::parseInt)
							.collect(Collectors.toList());

					System.err.println("ARRAY - " + mode);

					if (mode.contains(1)) {
						payMode.append("Cash");
						payMode.append(",");
					}
					if (mode.contains(2)) {
						payMode.append("Card");
						payMode.append(",");
					}
					if (mode.contains(3)) {
						payMode.append("E-Pay");
						payMode.append(",");
					}
					if (mode.contains(4)) {
						payMode.append("Debit Card");
						payMode.append(",");
					}
					if (mode.contains(5)) {
						payMode.append("Credit Card");
						payMode.append(",");
					}
					if (mode.contains(6)) {
						payMode.append("Bank Transcation");
						payMode.append(",");
					}
					if (mode.contains(7)) {
						payMode.append("Paytm");
						payMode.append(",");
					}
					if (mode.contains(8)) {
						payMode.append("Google Pay");
						payMode.append(",");
					}
					if (mode.contains(9)) {
						payMode.append("Amazon Pay");
						payMode.append(",");
					}

					System.err.println("MODE - " + payMode);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			if (payMode.length() > 0) {
				model.addAttribute("paymentMode", payMode.substring(0, payMode.length() - 1));
			} else {
				model.addAttribute("paymentMode", payMode);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	@RequestMapping(value = "/printBillOfInvoice/{billNo}", method = RequestMethod.GET)
	public String printBillOfInvoice(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printBillOfInvoice";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 1);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("empId", sellBillHeaderAndDetail.getExtInt1());

				FrEmpMaster frEmpMaster = restTemplate.postForObject(Constant.URL + "/getFrEmpByEmpId", map,
						FrEmpMaster.class);
				model.addAttribute("frEmpMaster", frEmpMaster);
			} catch (Exception e) {
				FrEmpMaster frEmpMaster = new FrEmpMaster();
				frEmpMaster.setFrEmpName("-");
				model.addAttribute("frEmpMaster", frEmpMaster);
			}
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {

			}

			StringBuilder payMode = new StringBuilder();

			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("sellBillNo", billNo);
				TransactionDetail trDetail = restTemplate.postForObject(Constant.URL + "/getTransactionByBillId", map,
						TransactionDetail.class);
				System.err.println("TR DETAIL - " + trDetail);

				if (trDetail != null) {
					List<Integer> mode = Stream.of(trDetail.getExVar1().split(",")).map(Integer::parseInt)
							.collect(Collectors.toList());

					System.err.println("ARRAY - " + mode);

					if (mode.contains(1)) {
						payMode.append("Cash");
						payMode.append(",");
					}
					if (mode.contains(2)) {
						payMode.append("Card");
						payMode.append(",");
					}
					if (mode.contains(3)) {
						payMode.append("E-Pay");
						payMode.append(",");
					}
					if (mode.contains(4)) {
						payMode.append("Debit Card");
						payMode.append(",");
					}
					if (mode.contains(5)) {
						payMode.append("Credit Card");
						payMode.append(",");
					}
					if (mode.contains(6)) {
						payMode.append("Bank Transcation");
						payMode.append(",");
					}
					if (mode.contains(7)) {
						payMode.append("Paytm");
						payMode.append(",");
					}
					if (mode.contains(8)) {
						payMode.append("Google Pay");
						payMode.append(",");
					}
					if (mode.contains(9)) {
						payMode.append("Amazon Pay");
						payMode.append(",");
					}

					System.err.println("MODE - " + payMode);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			if (payMode.length() > 0) {
				model.addAttribute("paymentMode", payMode.substring(0, payMode.length() - 1));
			} else {
				model.addAttribute("paymentMode", payMode);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	String selectedId = "0";

	@RequestMapping(value = "/printPosBillDetail", method = RequestMethod.POST)
	public @ResponseBody String printPosBillDetail(@RequestBody String[] data, HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		String resp = "";
		selectedId = "0";
		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			for (int i = 0; i < data.length; i++) {
				selectedId = selectedId + "," + data[i];
			}
			resp = frDetails.getFrGstType() + "";
			System.err.println(selectedId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resp;
	}

	@RequestMapping(value = "/printDetailBillOfSupply/{billNo}", method = RequestMethod.GET)
	public String printDetailBillOfSupply(@PathVariable int billNo, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		String mav = "customerBill/printBillOfSupply";
		System.err.println(selectedId);
		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());
			try {
				FrEmpMaster frEmpMaster = (FrEmpMaster) session.getAttribute("frEmpDetails");
				model.addAttribute("frEmpMaster", frEmpMaster);
			} catch (Exception e) {
				FrEmpMaster frEmpMaster = new FrEmpMaster();
				frEmpMaster.setFrEmpName("-");
				model.addAttribute("frEmpMaster", frEmpMaster);
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("billDetailNoList", selectedId);
			map.add("flag", 0);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPosDetail", map, SellBillHeaderAndDetail.class);
			sellBillHeaderAndDetail.setDiscountPer(0);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);
			selectedId = "0";
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/printDetailBillOfInvoice/{billNo}", method = RequestMethod.GET)
	public String printDetailBillOfInvoice(@PathVariable int billNo, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		String mav = "customerBill/printBillOfInvoice";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());
			try {
				FrEmpMaster frEmpMaster = (FrEmpMaster) session.getAttribute("frEmpDetails");
				model.addAttribute("frEmpMaster", frEmpMaster);
			} catch (Exception e) {
				FrEmpMaster frEmpMaster = new FrEmpMaster();
				frEmpMaster.setFrEmpName("-");
				model.addAttribute("frEmpMaster", frEmpMaster);
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("billDetailNoList", selectedId);
			map.add("flag", 1);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPosDetail", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	
	
	@RequestMapping(value = "/newcustomerbill/{type}", method = RequestMethod.GET)
	public String newcustomerbill(@PathVariable int type, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/newcustomerbill";
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		try {
			DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			String curDateTime = dateFormat.format(cal.getTime());
			System.err.println("curDateTime" + curDateTime);
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			model.addAttribute("date1", sf.format(date));
			model.addAttribute("date2", sf1.format(date));
			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));
			model.addAttribute("customerList", customerList);

			ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

			String items;
			StringBuilder builder = new StringBuilder();
			for (FrMenu frMenu : menuList) {

				if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
						|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
						|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

					builder.append("," + frMenu.getItemShow());

				}

			}
			items = builder.toString();
			items = items.substring(1, items.length());
			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			//mvm.add("frId", frDetails.getFrId());
			//ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getItemsNameByIdWithOtherItem", mvm,
			//		ItemResponse.class);
			ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getAllItemsForPos", mvm,
					ItemResponse.class);
					
			
			List<Item> newItemsList = itemsList.getItemList();
			posItemsList=new ArrayList<>();
			posItemsList=itemsList.getItemList();

			model.addAttribute("newItemsList", newItemsList);

			CategoryList categoryList = restTemplate.getForObject(Constant.URL + "findAllOnlyCategory",
					CategoryList.class);
			model.addAttribute("catList", categoryList.getmCategoryList());
			model.addAttribute("frRateCat", frDetails.getFrRateCat());
			model.addAttribute("holdingList", hashMap);

			if (type == 1) {
				model.addAttribute("holdBill", hashMap.get(key));
				itemBillList = hashMap.get(key).getItemList();
				model.addAttribute("key", key);
				model.addAttribute("tempCust", 0);
				/* model.addAttribute("advKey", 0); */
				model.addAttribute("isAdvanceOrder", 0);
				model.addAttribute("advOrderDate", "");
				model.addAttribute("advanceAmt", 0);
				model.addAttribute("actionName", "ADD BILL(H)");
				model.addAttribute("discAmt", 0);
			} else {

				try {
					String custId = String.valueOf(session.getAttribute("advCustId"));
					String headId = String.valueOf(session.getAttribute("advHeadId"));

					System.err.println("type 0**" + headId);
					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("headId", headId);
					AdvanceOrderHeader headList = restTemplate.postForObject(
							Constant.URL + "/advanceOrderHistoryHedaerByHeadId", mvm, AdvanceOrderHeader.class);
					
					

					ItemListForCustomerBill[] itemBillList1 = (ItemListForCustomerBill[]) session
							.getAttribute("advItemList");
					itemBillList = new ArrayList<>();
					for (int i = 0; i < itemBillList1.length; i++) {
						itemBillList.add(itemBillList1[i]);
					}

					CustomerBillOnHold customerBillOnHold = new CustomerBillOnHold();
					customerBillOnHold.setItemList(itemBillList);
					if (custId != null || custId != "") {
						model.addAttribute("tempCust", Integer.parseInt(custId));

					} else {
						model.addAttribute("tempCust", 0);
					}

					if (headId != null || headId != "") {
						
						if(headList==null) {
							model.addAttribute("advanceAmt", 0);
							model.addAttribute("advOrderDate", "");
							model.addAttribute("discAmt", 0);
						}else {
							model.addAttribute("advanceAmt", headList.getAdvanceAmt());
							model.addAttribute("advOrderDate", headList.getOrderDate());
							model.addAttribute("discAmt", headList.getDiscAmt());
						}
						
						System.err.println("sdasf**" + headId);
						model.addAttribute("isAdvanceOrder", 1);
						model.addAttribute("actionName", "Advance Order BILL");
					} else {
						System.err.println("null**" + headId);
						model.addAttribute("advanceAmt", 0);
						model.addAttribute("discAmt", 0);
					}

					model.addAttribute("advAmt", customerBillOnHold);
					model.addAttribute("holdBill", customerBillOnHold);

					model.addAttribute("key", 0);
					/* model.addAttribute("advKey", 1); */
					session.removeAttribute("advItemList");
					// session.removeAttribute("advHeadId");

				} catch (Exception e) {
					itemBillList = new ArrayList<>();
					model.addAttribute("key", 0);
					model.addAttribute("tempCust", 0);
					model.addAttribute("advanceAmt", 0);
					model.addAttribute("isAdvanceOrder", 0);
					model.addAttribute("advOrderDate", "");
					model.addAttribute("actionName", "ADD BILL");
					model.addAttribute("discAmt", 0);
					/* model.addAttribute("advKey", 0); */
					// e.printStackTrace();
				}

			}

			mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("settingKey", "DEFLTCUST");
			NewSetting settingValue = restTemplate.postForObject(Constant.URL + "/findNewSettingByKey", mvm,
					NewSetting.class);
			System.err.println("Default Customer Val------------------" + settingValue.toString());
			model.addAttribute("defaultCustomer", settingValue.getSettingValue1());

			model.addAttribute("frtype", frDetails.getFrGstType());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	@RequestMapping(value = "/saveCustomerFromBill", method = RequestMethod.POST)
	@ResponseBody
	public AddCustemerResponse saveCustomerFromBill(HttpServletRequest request, HttpServletResponse responsel) {

		AddCustemerResponse info = new AddCustemerResponse();

		try {

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

			Customer save = new Customer();
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
			Customer res = restTemplate.postForObject(Constant.URL + "/saveCustomer", save, Customer.class);

			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));

			if (res == null) {

				info.setError(true);
			} else {
				info.setCustomerList(customerList);
				info.setAddCustomerId(res.getCustId());
				info.setError(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}
		return info;
	}

	Customer edit = new Customer();

	@RequestMapping(value = "/editCustomerFromBill", method = RequestMethod.POST)
	@ResponseBody
	public Customer editCustomerFromBill(HttpServletRequest request, HttpServletResponse responsel) {

		edit = new Customer();

		try {

			int custId = Integer.parseInt(request.getParameter("custId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			edit = restTemplate.postForObject(Constant.URL + "/getCustomerByCustId", map, Customer.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return edit;
	}
	
	@RequestMapping(value = "/submitEditCustomer", method = RequestMethod.POST)
	@ResponseBody
	public AddCustemerResponse submitEditCustomer(HttpServletRequest request, HttpServletResponse responsel) {

		AddCustemerResponse info = new AddCustemerResponse();

		try {

			String customerName = request.getParameter("customerName");
			String mobileNo = request.getParameter("mobileNo");
			String dateOfBirth = request.getParameter("dateOfBirth");
			int buisness = Integer.parseInt(request.getParameter("buisness"));
			String companyName = request.getParameter("companyName");
			String gstNo = request.getParameter("gstNo");
			String custAdd = request.getParameter("custAdd");

			edit.setCustName(customerName);
			edit.setPhoneNumber(mobileNo);
			edit.setIsBuissHead(buisness);
			edit.setCustDob(dateOfBirth);
			if (buisness == 0) {
				edit.setCompanyName("");
				edit.setAddress("");
				edit.setGstNo("");
			} else {
				edit.setCompanyName(companyName);
				edit.setAddress(custAdd);
				edit.setGstNo(gstNo);
			}

			Customer res = restTemplate.postForObject(Constant.URL + "/saveCustomer", edit, Customer.class);

			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));

			if (res == null) {

				info.setError(true);
			} else {
				info.setCustomerList(customerList);
				info.setAddCustomerId(res.getCustId());
				info.setError(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}
		return info;
	}
	
	
	// *****************Settle credit bills*************

	@RequestMapping(value = "/getCustAmts", method = RequestMethod.GET)
	@ResponseBody
	public CustomerAmounts getCustAmts(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		CustomerAmounts itemsList = new CustomerAmounts();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());
			itemsList = restTemplate.postForObject(Constant.URL + "/getCustomerAmounts", mvm, CustomerAmounts.class);
			if (itemsList.getCreaditAmt() == null || itemsList.getCreaditAmt() == "") {
				itemsList.setCreaditAmt("0");
			}

			System.err.println("amts*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemsList;
	}
	
	
	@RequestMapping(value = "/getCustCreditBills", method = RequestMethod.POST)
	@ResponseBody
	public List<SellBillHeader> getCustCreditBills(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		List<SellBillHeader> itemsList = new ArrayList<SellBillHeader>();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());
			SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getSellBillByCustId", mvm,
					SellBillHeader[].class);

			itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

			System.err.println("getCustCreditBills*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemsList;
	}
	
	
	
	// -------------------METHOD TO GET BILL BY CUST-----------------
		public List<SellBillHeader> getCustCreditBillsById(int custId, int frId) {

			List<SellBillHeader> itemsList = new ArrayList<SellBillHeader>();

			try {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("custId", custId);
				mvm.add("frId", frId);
				SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getSellBillByCustId", mvm,
						SellBillHeader[].class);

				itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

				System.err.println("getCustCreditBills*" + itemsList.toString());

			} catch (Exception e) {
				e.printStackTrace();
			}

			return itemsList;
		}
		
		
		@RequestMapping(value = "/getCustAdvanceOrder", method = RequestMethod.GET)
		@ResponseBody
		public List<AdvanceOrderHeader> getCustAdvanceOrder(HttpServletRequest request, HttpServletResponse responsel) {
			System.err.println("showCustBillForAdvOrder");
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			List<AdvanceOrderHeader> itemsList = new ArrayList<AdvanceOrderHeader>();

			try {

				int custId = Integer.parseInt(request.getParameter("cust"));

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("custId", custId);
				mvm.add("frId", frDetails.getFrId());
				AdvanceOrderHeader[] itemsList1 = restTemplate.postForObject(
						Constant.URL + "/advanceOrderHistoryHeaderByCustId", mvm, AdvanceOrderHeader[].class);

				itemsList = new ArrayList<AdvanceOrderHeader>(Arrays.asList(itemsList1));

				System.err.println("getCustCreditBills*" + itemsList.toString());

			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemsList;
		}

		
		List<PosCreditBillPrint> crBillPrintList = new ArrayList<>();

		@RequestMapping(value = "/submitResposeCredit", method = RequestMethod.POST)
		public @ResponseBody int submitResposeCredit(HttpServletRequest request, HttpServletResponse response)
				throws ParseException {
			int flag = 0;
			System.err.println("hii id list ");
			HttpSession session = request.getSession();
			FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");

			try {
				float cashAmt1 = 0;
				float cardAmt1 = 0;
				float epayAmt1 = 0;
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();
				List<TransactionDetail> expTransList = new ArrayList<TransactionDetail>();

				RestTemplate restTemplate = new RestTemplate();

				String[] checkedList = request.getParameterValues("chkItem");

				String frId = (request.getParameter("frId"));
				String custId = (request.getParameter("creditCustId"));
				String custName = (request.getParameter("credCust1"));

				String modePay1 = request.getParameter("modePay1"); // single/split
				int modType2 = 0;
				int modType1 = 0;
				int cardType = 0;
				int ePayType = 0;
				System.err.println("hii id list " + modePay1);
				modType1 = Integer.parseInt(request.getParameter("modType1"));// cash/card
				try {
					cardType = Integer.parseInt(request.getParameter("cardType1"));
				} catch (Exception e) {
				}

				try {
					ePayType = Integer.parseInt(request.getParameter("ePayType1"));
				} catch (Exception e) {
				}

				String type = "0";

				crBillPrintList = new ArrayList<>();
				List<Integer> checkedBills = new ArrayList<>();

				System.err.println("head id list " + checkedList.toString());
				for (int i = 0; i < checkedList.length; i++) {

					System.err.println("head id " + checkedList[i]);
					int headId = Integer.parseInt(checkedList[i]);
					checkedBills.add(headId);

					String invoiceNo = (request.getParameter("invoiceNo" + headId));
					float billAmt = Float.parseFloat(request.getParameter("grandTotal" + headId));
					float paidAmt = Float.parseFloat(request.getParameter("paidAmt" + headId));
					float pendingAmt = Float.parseFloat(request.getParameter("remainingAmt" + headId));
					String billDate = request.getParameter("billDate" + headId);
					float settleAmt = Float.parseFloat(request.getParameter("settleAmt" + headId));
					float discAmt = Float.parseFloat(request.getParameter("discAmt" + headId));
					TransactionDetail expTrans = new TransactionDetail();

					/*
					 * System.err.println("BILL NO - "+headId);
					 * System.err.println("PAID - "+paidAmt);
					 * System.err.println("PENDING - "+pendingAmt);
					 * System.err.println("SETTLE - "+settleAmt);
					 */

					if (modType1 == 1) {
						cashAmt1 = settleAmt;
						type = "0,1";

					} else if (modType1 == 2) {
						cardAmt1 = settleAmt;
						// type = "0,2";
						type = "0," + cardType;
					} else {
						epayAmt1 = settleAmt;
						// type = "0,3";
						type = "0," + ePayType;
					}

					expTrans.setSellBillNo(headId);
					expTrans.setCardAmt(Math.round(cardAmt1));
					expTrans.setCashAmt(Math.round(cashAmt1));
					expTrans.setDiscType(0);
					expTrans.setePayAmt(Math.round(epayAmt1));
					expTrans.setePayType(ePayType);
					expTrans.setPayMode(modType2);
					expTrans.setTransactionDate(sf1.format(date));

					expTrans.setExInt2(0);
					expTrans.setExInt1(frEmpDetails.getFrEmpId());

					expTrans.setExVar1(type);
					// expTrans.setExVar1(String.valueOf(modType1));//
					// +prodMixingReqP1.get(i).getMulFactor()
					expTrans.setExVar2(String.valueOf(pendingAmt - settleAmt));
					expTrans.setExFloat1(billAmt - discAmt);
					expTrans.setExFloat2(0);

					// field
					expTransList.add(expTrans);

					PosCreditBillPrint model = new PosCreditBillPrint(headId, invoiceNo, Integer.parseInt(custId), custName,
							billAmt, paidAmt, pendingAmt, settleAmt);
					crBillPrintList.add(model);

				}

				System.err.println("PRINT - " + crBillPrintList);
				flag = 2;
				Info errorMessage = restTemplate.postForObject(Constant.URL + "/saveBillTransDetail", expTransList,
						Info.class);
				if (errorMessage.getMessage().equals("1")) {
					flag = 2;
				} else {
					flag = 0;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;

		}
		
		
		// **********************pos popups
		// data*************************************************
		List<SellBillHeader> itemsList = null;

		@RequestMapping(value = "/deleteSellBill", method = RequestMethod.POST)
		@ResponseBody
		public List<SellBillHeader> deleteSellBill(HttpServletRequest request, HttpServletResponse responsel) {
			System.err.println("showCustBillForAdvOrder");

			SellBillHeader sellBillHeader = new SellBillHeader();
			try {

				int sellBillNo = Integer.parseInt(request.getParameter("sellBillNo"));

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("sellBillNo", sellBillNo);
				mvm.add("status", 1);

				Info info = restTemplate.postForObject(Constant.URL + "deleteBillById", mvm, Info.class);

				if (!info.isError()) {
					for (int i = 0; i < itemsList.size(); i++) {
						if (sellBillNo == itemsList.get(i).getSellBillNo()) {
							sellBillHeader = itemsList.get(i);
							itemsList.remove(i);
						}
					}
				}

				System.err.println("DELETED*" + info);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return itemsList;
		}
		
		
		@RequestMapping(value = "/deleteSellBillWithRemark", method = RequestMethod.POST)
		@ResponseBody
		public List<SellBillHeader> deleteSellBillWithRemark(HttpServletRequest request, HttpServletResponse responsel) {
			System.err.println("showCustBillForAdvOrder");

			SellBillHeader sellBillHeader = new SellBillHeader();
			try {

				int sellBillNo = Integer.parseInt(request.getParameter("sellBillNo"));
				String remark = request.getParameter("remark");
				
				System.err.println("sellBillNo = "+sellBillNo+"             remark = "+remark);

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("sellBillNo", sellBillNo);
				mvm.add("status", 1);
				mvm.add("remark", remark);

				Info info = restTemplate.postForObject(Constant.URL + "deleteBillByIdAddRemark", mvm, Info.class);

				if (!info.isError()) {
					for (int i = 0; i < itemsList.size(); i++) {
						if (sellBillNo == itemsList.get(i).getSellBillNo()) {
							sellBillHeader = itemsList.get(i);
							itemsList.remove(i);
						}
					}
				}

				System.err.println("DELETED*" + info);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return itemsList;
		}
		
		@RequestMapping(value = "/getCustBills", method = RequestMethod.POST)
		@ResponseBody
		public List<SellBillHeader> getCustBills(HttpServletRequest request, HttpServletResponse responsel) {
			System.err.println("showCustBillForAdvOrder");

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			itemsList = new ArrayList<SellBillHeader>();

			try {

				int custId = Integer.parseInt(request.getParameter("cust"));
				int tempType = Integer.parseInt(request.getParameter("tempType"));
				int tabType = Integer.parseInt(request.getParameter("tabType"));// cust/todays
				String dateSel = request.getParameter("date");
				System.err.println("tabType*" + tabType);

				MultiValueMap<String, Object> mvm;

				System.err.println(" tempType = " + tempType);
				System.err.println(" cust = " + custId);
				System.err.println(" frId = " + frDetails.getFrId());

				if (tempType == 4) {
					// Deleted Bills

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("custId", custId);
					mvm.add("frId", frDetails.getFrId());

					SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getAllDeletedBillByCustId",
							mvm, SellBillHeader[].class);

					itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

				} else if (tempType == 5) {
					// Deleted Bills All Cust

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("frId", frDetails.getFrId());
					String date = sdf.format(Calendar.getInstance().getTimeInMillis());
					System.err.println("DATE -------------------------------- " + date);
					mvm.add("date", dateSel);

					SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getDeletedBillAllCust", mvm,
							SellBillHeader[].class);

					itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

				} else {

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("custId", custId);
					mvm.add("frId", frDetails.getFrId());
					mvm.add("flag", tempType);
					mvm.add("tabType", tabType);
					mvm.add("date", dateSel);

					// SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL +
					// "/getAllSellCustBillTodaysBill",
					// mvm, SellBillHeader[].class);

					SellBillHeader[] itemsList1 = restTemplate.postForObject(
							Constant.URL + "/getAllSellCustBillTodaysBillWithDate", mvm, SellBillHeader[].class);

					itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

				}

				System.err.println("getCustCreditBills*" + itemsList.toString());

			} catch (Exception e) {
				e.printStackTrace();
			}

			return itemsList;
		}
	
		
		@RequestMapping(value = "/getCustBillsTransaction", method = RequestMethod.POST)
		@ResponseBody
		public List<TransactionDetail> getCustBillsTransaction(HttpServletRequest request, HttpServletResponse responsel) {

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			List<TransactionDetail> itemsList = new ArrayList<TransactionDetail>();

			try {

				int custId = Integer.parseInt(request.getParameter("cust"));
				int tempType = Integer.parseInt(request.getParameter("tempType"));
				int tabType = Integer.parseInt(request.getParameter("tabType"));// cust/todays
				String date = request.getParameter("date");// cust/todays
				// String dateSel = request.getParameter("date");

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("custId", custId);
				mvm.add("frId", frDetails.getFrId());
				mvm.add("flag", tempType);
				mvm.add("tabType", tabType);
				mvm.add("date", date);
				TransactionDetail[] itemsList1 = restTemplate.postForObject(
						Constant.URL + "/getAllSellCustBillTransactionWithDisc", mvm, TransactionDetail[].class);

				itemsList = new ArrayList<TransactionDetail>(Arrays.asList(itemsList1));

				System.err.println("getCustCreditBills*" + itemsList.toString());

			} catch (Exception e) {
				e.printStackTrace();
			}

			return itemsList;
		}

		@RequestMapping(value = "/alertSaveBillAfterPettyCashDayEnd", method = RequestMethod.POST)
		@ResponseBody
		public int alertSaveBillAfterPettyCashDayEnd(HttpServletRequest request, HttpServletResponse response) {

			int res = 0;

			try {

				RestTemplate restTemplate = new RestTemplate();
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frDetails.getFrId());
				PettyCashManagmt petty = restTemplate.postForObject(Constant.URL + "/getPettyCashDetails", map,
						PettyCashManagmt.class);

				String billDate = sf.format(date);
				if (petty != null) {

					SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					cal.setTimeInMillis(Long.parseLong(petty.getDate()));
					// cal.add(Calendar.DAY_OF_MONTH, 1);

					billDate = ymdSDF.format(cal.getTime());
					System.err.println("BILL DATE ---------------- " + billDate);

					Calendar newDate = Calendar.getInstance();
					String todaysDate = ymdSDF.format(newDate.getTime());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					System.err.println(sdf.parse(billDate).before(sdf.parse(todaysDate)) + "" + todaysDate + "" + billDate
							+ "OUTPUT --------------****************------ " + cal.getTime().compareTo(newDate.getTime()));
					if (!sdf.parse(billDate).before(sdf.parse(todaysDate))) {
						res = 1;
					}

				}

			} catch (Exception e) {
				System.err.println("Exception in alertSaveBillAfterPettyCashDayEnd : " + e.getMessage());
				e.printStackTrace();
			}

			return res;

		}
		
		
		@RequestMapping(value = "/printCreditBill", method = RequestMethod.GET)
		public String printCreditBill(HttpServletRequest request, HttpServletResponse response, Model model) {

			String mav = "customerBill/printCreditBill";

			try {
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
				model.addAttribute("frName", frDetails.getFrName());

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				model.addAttribute("printData", crBillPrintList);

				String custName = "";
				for (PosCreditBillPrint pos : crBillPrintList) {
					custName = pos.getCustName();
				}
				model.addAttribute("customer", custName);

				try {

					FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");

					map = new LinkedMultiValueMap<String, Object>();
					map.add("empId", frEmpDetails.getFrEmpId());

					FrEmpMaster frEmpMaster = restTemplate.postForObject(Constant.URL + "/getFrEmpByEmpId", map,
							FrEmpMaster.class);
					model.addAttribute("frEmpMaster", frEmpMaster);
				} catch (Exception e) {
					FrEmpMaster frEmpMaster = new FrEmpMaster();
					frEmpMaster.setFrEmpName("-");
					model.addAttribute("frEmpMaster", frEmpMaster);
				}

				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
				Calendar cal = Calendar.getInstance();
				model.addAttribute("date", sdf.format(cal.getTime()));

			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		}
		
		
		@RequestMapping(value = "/getItemCurrentStockForPos", method = RequestMethod.POST)
		@ResponseBody
		public List<OpsFrItemStock> getItemCurrentStockForOps(HttpServletRequest request, HttpServletResponse responsel) {

			List<OpsFrItemStock> res = new ArrayList<>();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			DateFormat yearFormat = new SimpleDateFormat("yyyy");
			boolean isMonthCloseApplicable = false;
			
			try {
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				RestTemplate restTemplate = new RestTemplate();

				ParameterizedTypeReference<List<PostFrItemStockHeader>> typeRef1 = new ParameterizedTypeReference<List<PostFrItemStockHeader>>() {
				};
				ResponseEntity<List<PostFrItemStockHeader>> responseEntity1 = restTemplate.exchange(
						Constant.URL + "getCurrentMonthOfCatId", HttpMethod.POST, new HttpEntity<>(map), typeRef1);
				List<PostFrItemStockHeader> list = responseEntity1.getBody();

				int month = 0;

				for (PostFrItemStockHeader header : list) {
					month = header.getMonth();
					break;
				}
				
				Date todaysDate = new Date();
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(todaysDate);

				cal.set(Calendar.DAY_OF_MONTH, 1);

				Date firstDay = cal.getTime();
				
				
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				System.out.println(dateFormat1.format(date));

				Calendar cal1 = Calendar.getInstance();
				cal1.setTime(date);

				int dayOfMonth = cal1.get(Calendar.DATE);

				int calCurrentMonth = cal1.get(Calendar.MONTH) + 1;
				
				if (month < calCurrentMonth) {

					isMonthCloseApplicable = true;
					System.out.println("Day Of Month End ......");

				} else if (month == 12 && calCurrentMonth == 1) {
					isMonthCloseApplicable = true;
				}
				
				if (isMonthCloseApplicable) {
					System.err.println("Inside iMonthclose app");
					String strDate;
					int year;
					if (month == 12) {
						System.err.println("running month =12");
						year = (Calendar.getInstance().getWeekYear() - 1);
						System.err.println("year value " + year);
					} else {
						System.err.println("running month not eq 12");
						year = Calendar.getInstance().getWeekYear();
						System.err.println("year value " + year);
					}

					if (month < 10) {
						strDate = year + "-0" + month + "-01";
					} else {
						strDate = year + "-" + month + "-01";
					}

					map.add("fromDate", strDate);
				} else {
					map.add("fromDate", dateFormat.format(firstDay));
				}
				
				

				map.add("frId", frDetails.getFrId());
				map.add("toDate", dateFormat.format(todaysDate));
				map.add("month", month);
				map.add("year", yearFormat.format(todaysDate));
				map.add("frStockType", frDetails.getStockType());

				OpsFrItemStock[] itemList = restTemplate.postForObject(Constant.URL + "getOpsFrCurrentStock", map,
						OpsFrItemStock[].class);
				res = new ArrayList<>(Arrays.asList(itemList));
				
				System.err.println("CURR STOCK - "+res);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
		
		
		@RequestMapping(value = "/getCategoryListForCustomerBill", method = RequestMethod.POST)
		@ResponseBody
		public CategoryList getCategoryListForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

			CategoryList categoryList = new CategoryList();

			try {

				categoryList = restTemplate.getForObject(Constant.URL + "findAllOnlyCategory", CategoryList.class);

			} catch (Exception e) {
				e.printStackTrace();

			}
			return categoryList;
		}
		
		@RequestMapping(value = "/getSubCategoryListForCustomerBill", method = RequestMethod.POST)
		@ResponseBody
		public List<SubCategory> getSubCategoryListForCustomerBill(HttpServletRequest request,
				HttpServletResponse responsel) {

			List<SubCategory> categoryList = new ArrayList<>();

			try {

				int catId = Integer.parseInt(request.getParameter("catId"));

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("catId", catId);
				SubCategory[] subCatList = restTemplate.postForObject(Constant.URL + "getSubCatList", map,
						SubCategory[].class);
				categoryList = new ArrayList<>(Arrays.asList(subCatList));

			} catch (Exception e) {
				e.printStackTrace();

			}
			return categoryList;
		}
		
		
		@RequestMapping(value = "/addItemInBillList", method = RequestMethod.POST)
		@ResponseBody
		public List<ItemListForCustomerBill> addItemInBillList(HttpServletRequest request, HttpServletResponse responsel) {

			try {

				float orignalrate = Float.parseFloat(request.getParameter("rateHidden"));
				float total = Float.parseFloat(request.getParameter("rate"));
				float qty = Float.parseFloat(request.getParameter("qty"));
				int itemId = Integer.parseInt(request.getParameter("itemIdHidden"));
				float taxperHidden = Float.parseFloat(request.getParameter("taxperHidden"));
				String itemNameHidden = request.getParameter("itemNameHidden");
				String uom = request.getParameter("uom");
				int isDecimal = Integer.parseInt(request.getParameter("isDecimal"));
				
				System.err.println("UOM = "+uom);
				System.err.println("ITEM LIST = "+itemBillList);
				/*
				 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
				 * Object>(); map.add("id", itemId); Item item =
				 * restTemplate.postForObject(Constant.URL + "getItem", map, Item.class);
				 */
				int flag = 0;
				for (int i = 0; i < itemBillList.size(); i++) {
					if (itemBillList.get(i).getItemId() == itemId) {
						itemBillList.get(i).setQty(qty);
						float taxableAmt = (total * 100) / (100 + taxperHidden);
						itemBillList.get(i).setTaxableAmt(taxableAmt);
						itemBillList.get(i).setTaxAmt(total - taxableAmt);
						itemBillList.get(i).setTaxPer(taxperHidden);
						itemBillList.get(i).setTotal(total);
						flag = 1;

					}
				}
				if (flag == 0) {
					ItemListForCustomerBill add = new ItemListForCustomerBill();
					add.setItemId(itemId);
					add.setItemName(itemNameHidden);
					add.setOrignalMrp(orignalrate);
					add.setUom(uom);
					add.setIsDecimal(isDecimal);
					add.setTotal(total);
					add.setQty(qty);
					add.setTaxPer(taxperHidden);
					Float taxableAmt = (total * 100) / (100 + add.getTaxPer());
					add.setTaxableAmt(taxableAmt);
					add.setTaxAmt(total - taxableAmt);
					itemBillList.add(add);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemBillList;
		}
		
		
		@RequestMapping(value = "/uomWiseBillQtyList", method = RequestMethod.POST)
		@ResponseBody
		public List<UomWiseTotalList> uomWiseBillQtyList(HttpServletRequest request, HttpServletResponse responsel) {

			List<UomWiseTotalList> uomList = new ArrayList<>();
			try {

				if (itemBillList != null) {
					List<UomWiseTotalList> tempUomList = new ArrayList<>();
					List<String> tempUom = new ArrayList<>();
					HashSet<String> set = new HashSet<>();

					for (ItemListForCustomerBill item : itemBillList) {
						set.add(item.getUom());
					}

					tempUom.addAll(set);

					for (String uom : tempUom) {
						float qty = 0;
						for (ItemListForCustomerBill item : itemBillList) {
							if (uom.equalsIgnoreCase(item.getUom())) {
								qty = qty + item.getQty();
							}
						}
						UomWiseTotalList model = new UomWiseTotalList(uom, qty);
						uomList.add(model);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return uomList;
		}
		
		@RequestMapping(value = "/editItemQty", method = RequestMethod.POST)
		@ResponseBody
		public ItemListForCustomerBill editItemQty(HttpServletRequest request, HttpServletResponse responsel) {
			ItemListForCustomerBill itemListForCustomerBill = new ItemListForCustomerBill();
			try {
				int itemId = Integer.parseInt(request.getParameter("itemId"));
				for (int i = 0; i < itemBillList.size(); i++) {
					if (itemBillList.get(i).getItemId() == itemId) {
						itemListForCustomerBill = itemBillList.get(i);
						break;
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemListForCustomerBill;
		}

		@RequestMapping(value = "/getCurrentItemList", method = RequestMethod.POST)
		@ResponseBody
		public List<ItemListForCustomerBill> getCurrentItemList(HttpServletRequest request, HttpServletResponse responsel) {

			try {

			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemBillList;
		}

		@RequestMapping(value = "/deleteItemInBillList", method = RequestMethod.POST)
		@ResponseBody
		public List<ItemListForCustomerBill> deleteItemInBillList(HttpServletRequest request,
				HttpServletResponse responsel) {

			try {

				int index = Integer.parseInt(request.getParameter("index"));
				itemBillList.remove(index);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemBillList;
		}

		@RequestMapping(value = "/getAllItemlistForCustomerBill", method = RequestMethod.POST)
		@ResponseBody
		public List<Item> getAllItemlistForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

			List<Item> newItemsList = new ArrayList<>();

			try {

				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

				ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

				String items;
				StringBuilder builder = new StringBuilder();
				for (FrMenu frMenu : menuList) {

					if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
							|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
							|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

						builder.append("," + frMenu.getItemShow());

					}

				}
				items = builder.toString();
				items = items.substring(1, items.length());
				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				mvm.add("frId", frDetails.getFrId());
				ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getItemsNameByIdWithOtherItem", mvm,
						ItemResponse.class);
				newItemsList = itemsList.getItemList();

			} catch (Exception e) {
				e.printStackTrace();

			}
			return newItemsList;
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
				int isAdvanceOrder = Integer.parseInt(request.getParameter("isAdvanceOrder"));

				System.err.println("advAmt" + advAmt);
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
				FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");

				String items = "0";
				for (int i = 0; i < itemBillList.size(); i++) {
					items = items + "," + itemBillList.get(i).getItemId();
				}
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer customerById = restTemplate.postForObject(Constant.URL + "/getCustomerByCustId", map,
						Customer.class);

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
						ItemResponse.class);
				List<Item> itemsListByIds = itemResponse.getItemList();

				List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

				float total = 0;
				float taxableAmt = 0;
				float taxAmt = 0;

				for (int i = 0; i < itemBillList.size(); i++) {

					for (int j = 0; j < itemsListByIds.size(); j++) {

						if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {

							SellBillDetail sellBillDetail = new SellBillDetail();

							sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
							sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());
							sellBillDetail.setSgstRs(itemBillList.get(i).getTaxAmt() / 2);
							sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());
							sellBillDetail.setCgstRs(itemBillList.get(i).getTaxAmt() / 2);
							sellBillDetail.setDelStatus(0);
							sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());
							sellBillDetail.setIgstRs(itemBillList.get(i).getTaxAmt());
							sellBillDetail.setItemId(itemBillList.get(i).getItemId());
							sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

							Float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemBillList.get(i).getTaxPer());
							sellBillDetail.setMrpBaseRate(mrpBaseRate);

							sellBillDetail.setQty(itemBillList.get(i).getQty());
							// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
							sellBillDetail.setSellBillDetailNo(0);
							sellBillDetail.setSellBillNo(0);
							sellBillDetail.setBillStockType(1);
							sellBillDetail.setTaxableAmt(itemBillList.get(i).getTaxableAmt());
							sellBillDetail.setTotalTax(itemBillList.get(i).getTaxAmt());
							sellBillDetail.setGrandTotal(itemBillList.get(i).getTotal());
							sellBillDetail.setItemName(itemBillList.get(i).getItemName());
							sellBillDetail.setExtFloat1(itemBillList.get(i).getTotal());

							System.err.println("ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

							sellBillDetail.setExtVar1(itemsListByIds.get(j).getItemImage());
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
				itemBillList = new ArrayList<>();
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
		
		
		
		@RequestMapping(value = "/submitBillByPaymentOption", method = RequestMethod.POST)
		@ResponseBody
		public Info submitBillByPaymentOption(HttpServletRequest request, HttpServletResponse responsel) {

			Info info = new Info();
			HttpSession session = request.getSession();
			FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			try {
				float advAmt = Float.parseFloat(request.getParameter("advAmt"));
				System.err.println("advAmt" + advAmt);
				String advOrderDate = request.getParameter("advOrderDate");
				int isAdvanceOrder = Integer.parseInt(request.getParameter("isAdvanceOrder"));

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
				for (int i = 0; i < itemBillList.size(); i++) {
					items = items + "," + itemBillList.get(i).getItemId();
				}
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer customerById = restTemplate.postForObject(Constant.URL + "/getCustomerByCustId", map,
						Customer.class);

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
						ItemResponse.class);
				List<Item> itemsListByIds = itemResponse.getItemList();

				List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

				float total = 0, grandTot = 0;
				float taxableAmt = 0;
				float taxAmt = 0;

				for (int i = 0; i < itemBillList.size(); i++) {

					for (int j = 0; j < itemsListByIds.size(); j++) {

						if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {
							grandTot = grandTot + itemBillList.get(i).getTotal();
						}
					}

				}

				for (int i = 0; i < itemBillList.size(); i++) {

					for (int j = 0; j < itemsListByIds.size(); j++) {

						if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {

							SellBillDetail sellBillDetail = new SellBillDetail();

							sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
							sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());

							sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());

							sellBillDetail.setDelStatus(0);
							sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());

							sellBillDetail.setItemId(itemBillList.get(i).getItemId());
							sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

							float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemBillList.get(i).getTaxPer());
							sellBillDetail.setMrpBaseRate(mrpBaseRate);

							// -----------------------------------------

							/*
							 * float detailDiscAmt = (itemBillList.get(i).getTotal() / (billAmtWtDisc / 100)
							 * (discAmt / 100));
							 */

							float detailDiscPer = 0;
							float detailDiscAmt = 0;

							if(discAmt>0) {
								detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
								detailDiscAmt = ((detailDiscPer * discAmt) / 100);
							}
							

							float detailGrandTotal = CustomerBillController
									.roundUp(itemBillList.get(i).getTotal() - detailDiscAmt);

							float baseRate = ((detailGrandTotal * 100)
									/ (100 + itemsListByIds.get(j).getItemTax1() + itemsListByIds.get(j).getItemTax2()));
							float totalTaxedAmt = CustomerBillController.roundUp(baseRate
									* ((itemsListByIds.get(j).getItemTax1() + itemsListByIds.get(j).getItemTax2()) / 100));

							/*
							 * System.err.println("ITEM TOTAL = "+itemBillList.get(i).getTotal());
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
							 * System.err.println("rate - " + i + " = " +
							 * itemBillList.get(i).getOrignalMrp()); System.err.println("qty - " + i + " = "
							 * + itemBillList.get(i).getQty());
							 * 
							 * System.err.println("getTotal - " + i + " = " +
							 * itemBillList.get(i).getTotal()); System.err.println("billAmtWtDisc - " +
							 * billAmtWtDisc); System.err.println("discAmt - " + discAmt);
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

							sellBillDetail.setQty(itemBillList.get(i).getQty());
							// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
							sellBillDetail.setSellBillDetailNo(0);
							sellBillDetail.setSellBillNo(0);
							sellBillDetail.setBillStockType(1);
							sellBillDetail.setTaxableAmt(detailTaxableAmt);// itemBillList.get(i).getTaxableAmt());
							sellBillDetail.setTotalTax(detailTotalTax);// itemBillList.get(i).getTaxAmt());
							sellBillDetail.setGrandTotal(detailGrandTotal);// 'itemBillList.get(i).getTotal());
							sellBillDetail.setItemName(itemBillList.get(i).getItemName());
							sellBillDetail.setDiscAmt(detailDiscAmt);
							sellBillDetail.setDiscPer(detailDiscPer);
							sellBillDetail.setExtFloat1(itemBillList.get(i).getTotal());

							System.err.println("ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

							sellBillDetail.setExtVar1(itemsListByIds.get(j).getItemImage());

							sellbilldetaillist.add(sellBillDetail);
							total = total + detailGrandTotal;// sellBillDetail.getGrandTotal();
							taxableAmt = taxableAmt + detailTaxableAmt;
							taxAmt = taxAmt + detailTotalTax;

							// grandTot=grandTot+itemBillList.get(i).getTotal();

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
				
				//billType=1 => CASH
				//billType=2 => CARD
				//billType=3 => EPAY
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

					//sellBillHeader.setPaymentMode(1);
				} else {
					sellBillHeader.setStatus(2);
					sellBillHeader.setRemainingAmt(0);
					//sellBillHeader.setPaymentMode(paymentMode);
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
				itemBillList = new ArrayList<>();

				RestTemplate restTemplate = new RestTemplate();
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

							if (billType == 1) {
								transactionDetail.setCashAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							} else if (billType == 2) {
								transactionDetail.setCardAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							} else if (billType == 3) {
								transactionDetail.setePayAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							}
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
		
		
		
		// EDIT SELL
		// BILL----------------------------------------------------------------------------

		@RequestMapping(value = "/submitEditBillByPaymentOption", method = RequestMethod.POST)
		@ResponseBody
		public Info submitEditBillByPaymentOption(HttpServletRequest request, HttpServletResponse responsel) {

			Info info = new Info();
			HttpSession session = request.getSession();
			FrEmpMaster frEmpDetails = (FrEmpMaster) session.getAttribute("frEmpDetails");
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			int mode = 0;
			try {
				mode = Integer.parseInt(request.getParameter("mode"));
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {

				int sellBillNo = Integer.parseInt(request.getParameter("sellBillNo"));
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
				float advAmt = Float.parseFloat(request.getParameter("advAmt"));
				String remark=request.getParameter("remark");

				String items = "0";
				for (int i = 0; i < itemBillList.size(); i++) {
					items = items + "," + itemBillList.get(i).getItemId();
				}

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer customerById = restTemplate.postForObject(Constant.URL + "/getCustomerByCustId", map,
						Customer.class);

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
						ItemResponse.class);
				List<Item> itemsListByIds = itemResponse.getItemList();

				mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("sellBillNo", sellBillNo);

				SellBillHeader sellBillHeaderRes = restTemplate
						.postForObject(Constant.URL + "/getSellBillItemsBySellBillNoForEdit", mvm, SellBillHeader.class);
				System.err.println("OLD BILL HEADER ------------------- " + sellBillHeaderRes);

				SellBillDetail[] detailListRes = restTemplate
						.postForObject(Constant.URL + "/getSellBillDetailListByHeaderId", mvm, SellBillDetail[].class);

				List<SellBillDetail> sellBillDetailRes = Arrays.asList(detailListRes);
				System.err.println("OLD BILL DETAIL ------------------- " + sellBillDetailRes);

				TreeSet<Integer> ts1 = new TreeSet<Integer>();
				if (sellBillDetailRes != null) {
					for (int i = 0; i < sellBillDetailRes.size(); i++) {
						ts1.add(sellBillDetailRes.get(i).getItemId());
					}
				}

				List<Integer> oldDetailItemIds = new ArrayList<>();
				oldDetailItemIds.addAll(ts1);

				System.err.println("oldDetailItemIds ----------TREE SET---------- " + oldDetailItemIds);

				System.err.println("itemsListByIds -------------------- " + itemsListByIds);
				System.err.println("itemBillList -------------------- " + itemBillList);

				List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

				float total = 0, grandTot = 0;
				float taxableAmt = 0;
				float taxAmt = 0;

				for (int i = 0; i < itemBillList.size(); i++) {

					for (int j = 0; j < itemsListByIds.size(); j++) {

						if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {
							grandTot = grandTot + itemBillList.get(i).getTotal();
						}
					}

				}

				for (int i = 0; i < itemBillList.size(); i++) {

					for (int j = 0; j < itemsListByIds.size(); j++) {

						if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {

							if (oldDetailItemIds.contains(itemBillList.get(i).getItemId())) {
								System.err.println("********************** MATCH **************************");

								for (int k = 0; k < sellBillDetailRes.size(); k++) {

									if (sellBillDetailRes.get(k).getItemId() == itemBillList.get(i).getItemId()) {

										SellBillDetail detail = sellBillDetailRes.get(k);

										SellBillDetail sellBillDetail = new SellBillDetail();

										sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
										sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());

										sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());

										sellBillDetail.setDelStatus(0);
										sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());

										sellBillDetail.setItemId(itemBillList.get(i).getItemId());
										sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

										float mrpBaseRate = (sellBillDetail.getMrp() * 100)
												/ (100 + itemBillList.get(i).getTaxPer());
										sellBillDetail.setMrpBaseRate(mrpBaseRate);

										/*
										 * float detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
										 * float detailDiscAmt = ((detailDiscPer * discAmt) / 100);
										 * 
										 * float detailGrandTotal = CustomerBillController
										 * .roundUp(itemBillList.get(i).getTotal() - detailDiscAmt);
										 */

										//float detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
										//float detailDiscAmt = ((detailDiscPer * discAmt) / 100);
										
										float detailDiscPer = 0;
										float detailDiscAmt = 0;

										if(discAmt>0) {
											detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
											detailDiscAmt = ((detailDiscPer * discAmt) / 100);
										}

										float detailGrandTotal = CustomerBillController
												.roundUp(itemBillList.get(i).getTotal() - detailDiscAmt);

										float baseRate = ((detailGrandTotal * 100)
												/ (100 + itemsListByIds.get(j).getItemTax1()
														+ itemsListByIds.get(j).getItemTax2()));
										float totalTaxedAmt = CustomerBillController
												.roundUp(baseRate * ((itemsListByIds.get(j).getItemTax1()
														+ itemsListByIds.get(j).getItemTax2()) / 100));

										float detailSgstRs = totalTaxedAmt / 2;
										float detailCgstRs = totalTaxedAmt / 2;
										float detailIgstRs = totalTaxedAmt;

										/*
										 * float detailSgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax1())
										 * / 100; float detailCgstRs = (detailGrandTotal *
										 * itemsListByIds.get(j).getItemTax2()) / 100; float detailIgstRs =
										 * (detailGrandTotal * itemsListByIds.get(j).getItemTax3()) / 100;
										 */

										detailSgstRs = CustomerBillController.roundUp(detailSgstRs);
										detailCgstRs = CustomerBillController.roundUp(detailCgstRs);
										detailIgstRs = CustomerBillController.roundUp(detailIgstRs);

										float detailTotalTax = detailSgstRs + detailCgstRs;
										detailTotalTax = CustomerBillController.roundUp(detailTotalTax);

										float detailTaxableAmt = detailGrandTotal - detailTotalTax;
										detailTaxableAmt = CustomerBillController.roundUp(detailTaxableAmt);

										sellBillDetail.setSgstRs(detailSgstRs);
										sellBillDetail.setCgstRs(detailCgstRs);
										sellBillDetail.setIgstRs(detailIgstRs);

										sellBillDetail.setQty(itemBillList.get(i).getQty());
										// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
										sellBillDetail.setSellBillDetailNo(detail.getSellBillDetailNo());
										sellBillDetail.setSellBillNo(detail.getSellBillNo());
										sellBillDetail.setBillStockType(1);
										sellBillDetail.setTaxableAmt(detailTaxableAmt);// itemBillList.get(i).getTaxableAmt());
										sellBillDetail.setTotalTax(detailTotalTax);// itemBillList.get(i).getTaxAmt());
										sellBillDetail.setGrandTotal(detailGrandTotal);// 'itemBillList.get(i).getTotal());
										sellBillDetail.setItemName(itemBillList.get(i).getItemName());
										sellBillDetail.setDiscAmt(detailDiscAmt);
										sellBillDetail.setExtFloat1(itemBillList.get(i).getTotal());

										System.err.println(
												"ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

										sellBillDetail.setExtVar1(itemsListByIds.get(j).getItemImage());

										sellbilldetaillist.add(sellBillDetail);
										total = total + detailGrandTotal;// sellBillDetail.getGrandTotal();
										taxableAmt = taxableAmt + detailTaxableAmt;
										taxAmt = taxAmt + detailTotalTax;

										break;
									}

								}

							} else {
								System.err.println("********************** NOT MATCH ***********************");

								SellBillDetail sellBillDetail = new SellBillDetail();

								sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
								sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());

								sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());

								sellBillDetail.setDelStatus(0);
								sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());

								sellBillDetail.setItemId(itemBillList.get(i).getItemId());
								sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

								float mrpBaseRate = (sellBillDetail.getMrp() * 100)
										/ (100 + itemBillList.get(i).getTaxPer());
								sellBillDetail.setMrpBaseRate(mrpBaseRate);

								/*
								 * float detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
								 * float detailDiscAmt = ((detailDiscPer * discAmt) / 100);
								 * 
								 * float detailGrandTotal = CustomerBillController
								 * .roundUp(itemBillList.get(i).getTotal() - detailDiscAmt);
								 */

								float detailDiscPer = ((itemBillList.get(i).getTotal() * 100) / grandTot);
								float detailDiscAmt = ((detailDiscPer * discAmt) / 100);

								float detailGrandTotal = CustomerBillController
										.roundUp(itemBillList.get(i).getTotal() - detailDiscAmt);

								float baseRate = ((detailGrandTotal * 100) / (100 + itemsListByIds.get(j).getItemTax1()
										+ itemsListByIds.get(j).getItemTax2()));
								float totalTaxedAmt = CustomerBillController.roundUp(baseRate
										* ((itemsListByIds.get(j).getItemTax1() + itemsListByIds.get(j).getItemTax2())
												/ 100));

								float detailSgstRs = totalTaxedAmt / 2;
								float detailCgstRs = totalTaxedAmt / 2;
								float detailIgstRs = totalTaxedAmt;

								/*
								 * float detailSgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax1())
								 * / 100; float detailCgstRs = (detailGrandTotal *
								 * itemsListByIds.get(j).getItemTax2()) / 100; float detailIgstRs =
								 * (detailGrandTotal * itemsListByIds.get(j).getItemTax3()) / 100;
								 */

								detailSgstRs = CustomerBillController.roundUp(detailSgstRs);
								detailCgstRs = CustomerBillController.roundUp(detailCgstRs);
								detailIgstRs = CustomerBillController.roundUp(detailIgstRs);

								float detailTotalTax = detailSgstRs + detailCgstRs;
								detailTotalTax = CustomerBillController.roundUp(detailTotalTax);

								float detailTaxableAmt = detailGrandTotal - detailTotalTax;
								detailTaxableAmt = CustomerBillController.roundUp(detailTaxableAmt);

								sellBillDetail.setSgstRs(detailSgstRs);
								sellBillDetail.setCgstRs(detailCgstRs);
								sellBillDetail.setIgstRs(detailIgstRs);

								sellBillDetail.setQty(itemBillList.get(i).getQty());
								// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
								sellBillDetail.setSellBillDetailNo(0);
								sellBillDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
								sellBillDetail.setBillStockType(1);
								sellBillDetail.setTaxableAmt(detailTaxableAmt);// itemBillList.get(i).getTaxableAmt());
								sellBillDetail.setTotalTax(detailTotalTax);// itemBillList.get(i).getTaxAmt());
								sellBillDetail.setGrandTotal(detailGrandTotal);// 'itemBillList.get(i).getTotal());
								sellBillDetail.setItemName(itemBillList.get(i).getItemName());
								sellBillDetail.setDiscAmt(detailDiscAmt);
								sellBillDetail.setExtFloat1(itemBillList.get(i).getTotal());

								System.err.println("ITEM ADD -------------------- " + itemsListByIds.get(j).getExtVar2());

								sellBillDetail.setExtVar1(itemsListByIds.get(j).getExtVar2());

								sellbilldetaillist.add(sellBillDetail);
								total = total + detailGrandTotal;// sellBillDetail.getGrandTotal();
								taxableAmt = taxableAmt + detailTaxableAmt;
								taxAmt = taxAmt + detailTotalTax;

							}

							break;
						}
					}

				}

				System.err.println("OLD DETAIL --------------------- " + sellBillDetailRes);

				// ArrayList<Integer> oldSellDetailItemIds = new ArrayList<>();
				ArrayList<Integer> newSellDetailItemIds = new ArrayList<>();

				if (sellbilldetaillist != null) {
					for (int i = 0; i < sellbilldetaillist.size(); i++) {
						newSellDetailItemIds.add(sellbilldetaillist.get(i).getItemId());
					}
				}

				if (sellBillDetailRes != null) {
					for (int i = 0; i < sellBillDetailRes.size(); i++) {

						if (!newSellDetailItemIds.contains(sellBillDetailRes.get(i).getItemId())) {

							mvm = new LinkedMultiValueMap<String, Object>();
							mvm.add("sellBillNo", sellBillNo);
							mvm.add("itemId", sellBillDetailRes.get(i).getItemId());

							int res = restTemplate.postForObject(Constant.URL + "/deleteSellBillDetailByItemId", mvm,
									Integer.class);
							System.err.println("DELETE BILL DETAIL ------------------- " + res);

						}

					}
				}

				System.err.println(" ---------------------------------------------------- ");

				System.err.println("NEW DETAIL --------------------- " + sellbilldetaillist);

				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();

				SellBillHeader sellBillHeader = new SellBillHeader();

				sellBillHeader.setFrId(frDetails.getFrId());
				sellBillHeader.setFrCode(frDetails.getFrCode());
				sellBillHeader.setDelStatus(0);
				sellBillHeader.setUserName(customerById.getCustName());
				sellBillHeader.setBillDate(DateConvertor.convertToYMD(sellBillHeaderRes.getBillDate()));
				sellBillHeader.setCustId(custId);
				sellBillHeader.setInvoiceNo(sellBillHeaderRes.getInvoiceNo());
				sellBillHeader.setSellBillNo(sellBillHeaderRes.getSellBillNo());
				sellBillHeader.setUserGstNo(customerById.getGstNo());
				sellBillHeader.setUserPhone(customerById.getPhoneNumber());
				sellBillHeader.setBillType('R');
				sellBillHeader.setTaxableAmt(taxableAmt);
				sellBillHeader.setPayableAmt(Math.round(total));
				sellBillHeader.setTotalTax(taxAmt);
				sellBillHeader.setGrandTotal(Math.round(grandTot));
				
				//billType=1 => CASH
				//billType=2 => CARD
				//billType=3 => EPAY
				sellBillHeader.setPaymentMode(billType);
				
				if (discPer != 0) {
					sellBillHeader.setDiscountPer(discPer);
				} else {
					sellBillHeader.setDiscountPer(discAmt / (billAmtWtDisc / 100));
				}

				sellBillHeader.setDiscountAmt(discAmt);

				float roundOff = 0;
				roundOff = taxableAmt + taxAmt - Math.round(total);
				sellBillHeader.setExtFloat1(roundOff);

				/*
				 * if (creditBill == 1) { sellBillHeader.setStatus(3);
				 * sellBillHeader.setRemainingAmt(total - sellBillHeaderRes.getPaidAmt());
				 * sellBillHeader.setPaidAmt(sellBillHeaderRes.getPaidAmt());
				 * 
				 * sellBillHeader.setPaymentMode(1); } else { sellBillHeader.setStatus(2);
				 * sellBillHeader.setRemainingAmt(0);
				 * sellBillHeader.setPaymentMode(paymentMode);
				 * sellBillHeader.setPaidAmt(Math.round(total));
				 * 
				 * }
				 */

				if (creditBill == 1) {
					sellBillHeader.setStatus(3);
					if (mode == 0) {
						if (advAmt > 0) {
							sellBillHeader.setRemainingAmt(total - advAmt);
						} else {
							sellBillHeader.setRemainingAmt(total);
						}
					} else {
						sellBillHeader.setRemainingAmt(Math.round(total) - sellBillHeaderRes.getPaidAmt());
					}
					sellBillHeader.setPaidAmt(advAmt);

					//sellBillHeader.setPaymentMode(1);
				} else {
					sellBillHeader.setStatus(2);
					sellBillHeader.setRemainingAmt(0);
					//sellBillHeader.setPaymentMode(paymentMode);
					sellBillHeader.setPaidAmt(Math.round(total));

				}

				sellBillHeader.setExtInt1(frEmpDetails.getFrEmpId());

				sellBillHeader.setSellBillDetailsList(sellbilldetaillist);

				hashMap.remove(index);
				itemBillList = new ArrayList<>();

				System.err.println("SAVE ================================================== ");
				System.err.println("" + sellBillHeader);

				/*
				 * if (creditBill != 1) {
				 * 
				 * mvm = new LinkedMultiValueMap<String, Object>(); mvm.add("sellBillNo",
				 * sellBillNo); mvm.add("advAmtStatus", 0); int res =
				 * restTemplate.postForObject(Constant.URL +
				 * "/deleteTransactionDetailsByIsAdvAmt", mvm, Integer.class);
				 * 
				 * System.err.println("DELETE TRANSC DETAILS --------------------------- " +
				 * res); }
				 */

				if (mode == 0) {
					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("sellBillNo", sellBillNo);
					mvm.add("advAmtStatus", 0);
					int res = restTemplate.postForObject(Constant.URL + "/deleteTransactionDetailsByIsAdvAmt", mvm,
							Integer.class);

					System.err.println("DELETE TRANSC DETAILS --------------------------- " + res);
				}

				SellBillHeader sellBillHeaderRes1 = restTemplate.postForObject(Constant.URL + "insertSellBillData",
						sellBillHeader, SellBillHeader.class);

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
				}

				if (sellBillHeaderRes1 != null) {

					info.setError(false);
					info.setMessage("" + sellBillHeaderRes1.getSellBillNo());

					List<TransactionDetail> dList = new ArrayList<>();

					TransactionDetail transactionDetail = new TransactionDetail();
					transactionDetail.setSellBillNo(sellBillHeaderRes1.getSellBillNo());
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

							if (billType == 1) {
								transactionDetail.setCashAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							} else if (billType == 2) {
								transactionDetail.setCardAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							} else if (billType == 3) {
								transactionDetail.setePayAmt(Math.round(Float.parseFloat(payAmt)));
								transactionDetail.setExVar1("0," + payType);
							}
						} else {

							String type = payTypeSplit;
							if (cashAmt > 0) {
								transactionDetail.setCashAmt(Math.round(cashAmt));
							}
							if (cardAmt > 0) {
								transactionDetail.setCardAmt(Math.round(cardAmt)); // type = type + "," + 2;
							}
							if (epayAmt > 0) {
								transactionDetail.setePayAmt(Math.round(epayAmt)); // type = type + "," +3;
							}
							transactionDetail.setExVar1(type);
						}

					}

					transactionDetail.setRemark(remark);
					
					dList.add(transactionDetail);

					if (creditBill != 1) {

						TransactionDetail[] transactionDetailRes = restTemplate
								.postForObject(Constant.URL + "saveTransactionDetail", dList, TransactionDetail[].class);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
				info.setError(true);
				info.setMessage("failed");
			}
			return info;
		}
		
		// --------------------------------------END----------------------------------------------------

		
		
		
		
		
		public static String getInvoiceNo(HttpServletRequest request, HttpServletResponse response) {

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

			// int length = String.valueOf(settingValue).length();

			String invoiceNo = frDetails.getFrCode() + curStrYear + "-" + String.format("%05d", settingValue);

			// String invoiceNo = null;
			/*
			 * if (length == 1)
			 * 
			 * invoiceNo = curStrYear + "-" + "0000" + settingValue; if (length == 2)
			 * 
			 * invoiceNo = curStrYear + "-" + "000" + settingValue;
			 * 
			 * if (length == 3)
			 * 
			 * invoiceNo = curStrYear + "-" + "00" + settingValue;
			 * 
			 * if (length == 4)
			 * 
			 * invoiceNo = curStrYear + "-" + "0" + settingValue;
			 */

			// invoiceNo = frDetails.getFrCode() + invoiceNo;
			System.out.println("*** settingValue= " + settingValue);
			return invoiceNo;

		}
		
		
		
		@RequestMapping(value = "/getItemListByCatSubCatForCustomerBill", method = RequestMethod.POST)
		@ResponseBody
		public List<Item> getItemListByCatSubCatForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

			List<Item> newItemsList = new ArrayList<>();

			try {

				int searchBy = Integer.parseInt(request.getParameter("searchBy"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

				ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

				String items;
				StringBuilder builder = new StringBuilder();
				for (FrMenu frMenu : menuList) {

					if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
							|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
							|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

						builder.append("," + frMenu.getItemShow());

					}

				}
				items = builder.toString();
				items = items.substring(1, items.length());
				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				mvm.add("frId", frDetails.getFrId());
				mvm.add("searchBy", searchBy);
				mvm.add("catId", catId);
				ItemResponse itemsList = restTemplate.postForObject(
						Constant.URL + "/getItemsNameByIdWithOtherItemCateIdOrSubCatId", mvm, ItemResponse.class);
				newItemsList = itemsList.getItemList();
				System.err.println("NEW ITEM LIST - "+newItemsList);

			} catch (Exception e) {
				e.printStackTrace();

			}
			return newItemsList;
		}
		
		
		@RequestMapping(value = "/getItemListByCatForPos", method = RequestMethod.POST)
		@ResponseBody
		public List<Item> getItemListByCatForPos(HttpServletRequest request, HttpServletResponse responsel) {

			List<Item> newItemsList = new ArrayList<>();

			try {

				int catId = Integer.parseInt(request.getParameter("catId"));
				HttpSession session = request.getSession();
				Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

				ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

				String items;
				StringBuilder builder = new StringBuilder();
				for (FrMenu frMenu : menuList) {

					if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
							|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
							|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

						builder.append("," + frMenu.getItemShow());

					}

				}
				items = builder.toString();
				items = items.substring(1, items.length());
				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				mvm.add("catId", catId);
				
				ItemResponse itemsList = restTemplate.postForObject(
						Constant.URL + "/getItemsNameByCatIdForPos", mvm, ItemResponse.class);
				newItemsList = itemsList.getItemList();
				System.err.println("NEW ITEM LIST - "+newItemsList);

			} catch (Exception e) {
				e.printStackTrace();

			}
			return newItemsList;
		}

	
	

		

		

		@RequestMapping(value = "/billOnHold", method = RequestMethod.POST)
		@ResponseBody
		public Info billOnHold(HttpServletRequest request, HttpServletResponse responsel) {

			Info info = new Info();

			try {

				int key = Integer.parseInt(request.getParameter("key"));
				int custId = Integer.parseInt(request.getParameter("custId"));
				String holdCustName = request.getParameter("holdCustName");

				if (hashMap.containsKey(key)) {
					hashMap.get(key).setCustId(custId);
					hashMap.get(key).setItemList(itemBillList);
				} else {
					CustomerBillOnHold addNew = new CustomerBillOnHold();
					tempBillNo = tempBillNo + 1;
					addNew.setCustId(custId);
					addNew.setItemList(itemBillList);
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
	
		
		// mode------- 0=edit, 1=pay
		@RequestMapping(value = "/editcustomerbill/{type}/{sellBillNo}/{mode}", method = RequestMethod.GET)
		public String editCustomerBill(@PathVariable int type, @PathVariable int sellBillNo, @PathVariable int mode,
				HttpServletRequest request, HttpServletResponse response, Model model) {

			String mav = "customerBill/editcustomerbill";
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			try {

				model.addAttribute("mode", mode);

				DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
				Calendar cal = Calendar.getInstance();

				String curDateTime = dateFormat.format(cal.getTime());
				System.err.println("curDateTime" + curDateTime);
				SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();
				model.addAttribute("date1", sf.format(date));
				Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
				List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));
				model.addAttribute("customerList", customerList);

				ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

				String items;
				StringBuilder builder = new StringBuilder();
				for (FrMenu frMenu : menuList) {

					if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
							|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
							|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

						builder.append("," + frMenu.getItemShow());

					}

				}
				items = builder.toString();
				items = items.substring(1, items.length());
				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("itemList", items);
				mvm.add("frId", frDetails.getFrId());
//				ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getItemsNameByIdWithOtherItem", mvm,
//						ItemResponse.class);
//				List<Item> newItemsList = itemsList.getItemList();
				
				ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getAllItemsForPos", mvm,
						ItemResponse.class);
						
				
				List<Item> newItemsList = itemsList.getItemList();
				posItemsList=new ArrayList<>();
				posItemsList=itemsList.getItemList();

				model.addAttribute("newItemsList", newItemsList);

				CategoryList categoryList = restTemplate.getForObject(Constant.URL + "findAllOnlyCategory",
						CategoryList.class);
				model.addAttribute("catList", categoryList.getmCategoryList());
				model.addAttribute("frRateCat", frDetails.getFrRateCat());
				model.addAttribute("holdingList", hashMap);

				model.addAttribute("sellBillNo", sellBillNo);

				try {
					// String custId = String.valueOf(session.getAttribute("editCustId"));

					System.err.println("type 0**" + sellBillNo);

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("sellBillNo", sellBillNo);

					SellBillHeader sellBillHeaderRes = restTemplate.postForObject(
							Constant.URL + "/getSellBillItemsBySellBillNoForEdit", mvm, SellBillHeader.class);

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("sellBillNo", sellBillNo);

					ItemListForCustomerBill[] itemsList1 = restTemplate.postForObject(
							Constant.URL + "/getBillItemsBySellBillNo", mvm, ItemListForCustomerBill[].class);

					System.err.println("BILL ITEM LIST ---------------------------- " + itemsList1);

					itemBillList = new ArrayList<>();
					for (int i = 0; i < itemsList1.length; i++) {
						itemBillList.add(itemsList1[i]);
					}

					CustomerBillOnHold customerBillOnHold = new CustomerBillOnHold();
					customerBillOnHold.setItemList(itemBillList);

					model.addAttribute("tempCust", sellBillHeaderRes.getCustId());
					model.addAttribute("tempHeader", sellBillHeaderRes);

					model.addAttribute("advAmt", customerBillOnHold);
					model.addAttribute("holdBill", customerBillOnHold);

					System.err.println("holdBill ------------------------- " + customerBillOnHold);

					model.addAttribute("key", 0);

					List<UomWiseTotalList> uomList = new ArrayList<>();

					if (itemBillList != null) {
						List<UomWiseTotalList> tempUomList = new ArrayList<>();
						List<String> tempUom = new ArrayList<>();
						HashSet<String> set = new HashSet<>();

						for (ItemListForCustomerBill item : itemBillList) {
							set.add(item.getUom());
						}

						tempUom.addAll(set);

						for (String uom : tempUom) {
							float qty = 0;
							for (ItemListForCustomerBill item : itemBillList) {
								if (uom.equalsIgnoreCase(item.getUom())) {
									qty = qty + item.getQty();
								}
							}
							UomWiseTotalList um = new UomWiseTotalList(uom, qty);
							uomList.add(um);
						}

					}

					model.addAttribute("uomList", uomList);

				} catch (Exception e) {
					itemBillList = new ArrayList<>();
					model.addAttribute("key", 0);
					model.addAttribute("tempCust", 0);
					model.addAttribute("advanceAmt", 0);
					model.addAttribute("isAdvanceOrder", 0);
					model.addAttribute("advOrderDate", "");
					model.addAttribute("actionName", "ADD BILL");

					/* model.addAttribute("advKey", 0); */
					// e.printStackTrace();
				}

				try {

					mvm = new LinkedMultiValueMap<String, Object>();
					mvm.add("sellBillNo", sellBillNo);

					TransactionDetail transactionDetail = restTemplate.postForObject(Constant.URL + "/getAdvAmtTransaction",
							mvm, TransactionDetail.class);

					float trAdvAmt = 0;
					if (transactionDetail != null) {
						trAdvAmt = transactionDetail.getCashAmt();
					}

					model.addAttribute("advAmtTransaction", trAdvAmt);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("advAmtTransaction", 0);
				}

				mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("settingKey", "DEFLTCUST");
				NewSetting settingValue = restTemplate.postForObject(Constant.URL + "/findNewSettingByKey", mvm,
						NewSetting.class);
				System.err.println(settingValue.toString());
				model.addAttribute("defaultCustomer", settingValue.getSettingValue1());

				model.addAttribute("frtype", frDetails.getFrGstType());

			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		}
		
		
		
		@RequestMapping(value = "/getItemDataByIdPos", method = RequestMethod.POST)
		@ResponseBody
		public Item getItemDataByIdPos(HttpServletRequest request, HttpServletResponse responsel) {

			Item item = new Item();

			try {
				
				int id=Integer.parseInt(request.getParameter("id"));
				System.err.println("ITEM ID - "+id);
				
				if(posItemsList!=null) {
					
					for(int i=0;i<posItemsList.size();i++) {
						
						if(id==posItemsList.get(i).getId()) {
							item=posItemsList.get(i);
							break;
						}
						
					}
					
				}


			} catch (Exception e) {
				e.printStackTrace();

			}
			return item;
		}
		
		
		
		
}
