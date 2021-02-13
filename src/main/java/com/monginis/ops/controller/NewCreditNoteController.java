package com.monginis.ops.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.billing.SellBillDetail;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.constant.VpsImageUpload;
import com.monginis.ops.model.CreditNotePos;
import com.monginis.ops.model.CreditNotePosHeaderDisp;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.Expense;
import com.monginis.ops.model.FrEmpLoginResp;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.GetBillHeader;
import com.monginis.ops.model.GetSellBillDetail;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.SellBillDetailList;
import com.monginis.ops.model.Setting;
import com.monginis.ops.model.TransactionDetail;
import com.monginis.ops.model.frsetting.FrSetting;
import com.monginis.ops.model.pettycash.FrEmpMaster;

@Controller
@Scope("session")
public class NewCreditNoteController {

	RestTemplate restTemplate = new RestTemplate();
	List<SellBillHeader> itemsList = null;

	@RequestMapping(value = "/insertCreditNote", method = RequestMethod.GET)
	public ModelAndView insertCreditNote(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		HttpSession session = request.getSession();

		model = new ModelAndView("newcreditnote/insertCreditNote");

		Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
		List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));
		model.addObject("customerList", customerList);

		return model;

	}

	@RequestMapping(value = "/getCustBillsForCreditNote", method = RequestMethod.GET)
	@ResponseBody
	public List<SellBillHeader> getCustBillsForCreditNote(HttpServletRequest request, HttpServletResponse responsel) {

		System.err.println("----------------------------- getCustBillsForCreditNote --------------------------- ");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		itemsList = new ArrayList<SellBillHeader>();

		try {

			int custId = Integer.parseInt(request.getParameter("custId"));

			MultiValueMap<String, Object> mvm;

			mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());

			System.err.println("CUST ID - " + custId + "              FR ID - " + frDetails.getFrId());

			SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getAllSellCustBillForCreditNote",
					mvm, SellBillHeader[].class);

			itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

			System.err.println("getCustBillsForCreditNote*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemsList;
	}

	List<SellBillDetail> getSellBillDetailList;

	@RequestMapping(value = "/getCustBillDetailsForCreditNote", method = RequestMethod.GET)
	@ResponseBody
	public List<SellBillDetail> getCustBillDetailsForCreditNote(HttpServletRequest request,
			HttpServletResponse responsel) {

		System.err
				.println("----------------------------- getCustBillDetailsForCreditNote --------------------------- ");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		getSellBillDetailList = new ArrayList<SellBillDetail>();

		try {

			int sellBillNo = Integer.parseInt(request.getParameter("sellBillNo"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("billNo", sellBillNo);

			SellBillDetailList sellBillDetailList = restTemplate.postForObject(Constant.URL + "/getSellBillDetails",
					map, SellBillDetailList.class);

			List<SellBillDetail> sellBillDetails = sellBillDetailList.getSellBillDetailList();
			getSellBillDetailList = sellBillDetails;

			System.err.println("DATAAAAA -------------------- " + sellBillDetailList.getSellBillDetailList());

			System.err.println("DATA -------------------- " + getSellBillDetailList);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return getSellBillDetailList;
	}

	@RequestMapping(value = "/addCreditNote", method = RequestMethod.POST)
	public String addCreditNote(HttpServletRequest request, HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			FrEmpMaster loginResponse = (FrEmpMaster) session.getAttribute("frEmpDetails");
			int userId = loginResponse.getFrEmpId();

			int stockable = Integer.parseInt(request.getParameter("stockable"));
			System.err.println("STOCKABLE ----------- " + stockable);

			int custId = Integer.parseInt(request.getParameter("cust"));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			int crnNo = 0;
			try {
				Setting setting = restTemplate.getForObject(Constant.URL + "/getSettingDataById?settingId={settingId}",
						Setting.class, 54);
				crnNo = setting.getSettingValue();

			} catch (Exception e) {
				e.printStackTrace();
			}

			String crnInvoiceNo = "";
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);
				crnInvoiceNo = "" + frDetails.getFrCode() + "_" + frSetting.getSpNo();
			} catch (Exception e) {
				e.printStackTrace();
			}

			String billInvoiceNo = "";
			try {

				int billNo = 0;
				if (getSellBillDetailList != null) {
					billNo = getSellBillDetailList.get(0).getSellBillNo();
				}

				map = new LinkedMultiValueMap<String, Object>();
				map.add("sellBillNo", billNo);
				SellBillHeader billHead = restTemplate.postForObject(Constant.URL + "/getBillHeaderBySellBillNo", map,
						SellBillHeader.class);
				billInvoiceNo = billHead.getInvoiceNo();
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<CreditNotePos> crnList = new ArrayList<>();

			float returnPer = Float.parseFloat(request.getParameter("returnPer"));
			System.err.println("per - " + returnPer);

			if (getSellBillDetailList != null) {
				for (int i = 0; i < getSellBillDetailList.size(); i++) {

					SellBillDetail billDetail = getSellBillDetailList.get(i);

					try {
						float crnQty = Float.parseFloat(
								request.getParameter("qty" + getSellBillDetailList.get(i).getSellBillDetailNo()));

						if (crnQty > 0) {

							float billTotal = (billDetail.getMrp() - billDetail.getDiscAmt() / billDetail.getQty())
									* crnQty;
							float tempGrandTotal = (billTotal * returnPer) / 100;
							float taxableAmt = (tempGrandTotal * 100)
									/ (100 + billDetail.getCgstPer() + billDetail.getSgstPer());

							float cgstAmt = taxableAmt * (billDetail.getCgstPer() / 100);
							float sgstAmt = taxableAmt * (billDetail.getSgstPer() / 100);

							float grandTotal = taxableAmt + cgstAmt + sgstAmt;

							CreditNotePos cr = new CreditNotePos();
							cr.setCrnDetailNo(0);
							cr.setCrnNo(crnNo);
							cr.setCrnInvoiceNo(crnInvoiceNo);
							cr.setBillNo(billDetail.getSellBillNo());
							cr.setBillDetailNo(billDetail.getSellBillDetailNo());
							cr.setBillInvoice(billInvoiceNo);
							cr.setCrnDate("" + sdf.format(Calendar.getInstance().getTimeInMillis()));
							cr.setItemId(billDetail.getItemId());
							cr.setItemName(billDetail.getItemName());
							cr.setCrnQty(crnQty);
							cr.setBillQty(billDetail.getQty());
							cr.setRate(billDetail.getMrp());
							cr.setDiscAmt(billDetail.getDiscAmt());
							cr.setBillTotal(billTotal);
							cr.setReturnPer(returnPer);
							cr.setTaxableAmt(taxableAmt);
							cr.setCgstPer(billDetail.getCgstPer());
							cr.setCgstAmt(cgstAmt);
							cr.setSgstPer(billDetail.getSgstPer());
							cr.setSgstAmt(sgstAmt);
							cr.setIgstPer(billDetail.getIgstPer());
							cr.setIgstAmt(billDetail.getIgstRs());
							cr.setCessPer(0);
							cr.setCessAmt(0);
							cr.setGrandTotal(grandTotal);
							cr.setDelStatus(0);
							cr.setStatus(0);
							cr.setUserId(userId);
							cr.setCustId(custId);
							cr.setIsStockable(stockable);
							cr.setExInt1(frDetails.getFrId());

							crnList.add(cr);
						}

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

				System.err.println("crnList ========== " + crnList);
				if (!crnList.isEmpty()) {

					CreditNotePos[] res = restTemplate.postForObject(Constant.URL + "saveNewPosCreditNoteList", crnList,
							CreditNotePos[].class);

					if (res != null) {
						map = new LinkedMultiValueMap<String, Object>();
						map.add("frId", frDetails.getFrId());
						Info updateFrSettingCrnInvoice = restTemplate
								.postForObject(Constant.URL + "updateFrSettingSpNo", map, Info.class);
					}

				}

			}

		} catch (Exception e) {
			System.out.println("Exception In addCreditNote Process:" + e.getMessage());
		}

		return "redirect:/insertCreditNote";
	}

	@RequestMapping(value = "/creditNoteHeaderList", method = RequestMethod.GET)
	public ModelAndView creditNoteHeaderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		HttpSession session = request.getSession();
		

		model = new ModelAndView("newcreditnote/newPosCreditNoteList");

		Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
		List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));
		model.addObject("customerList", customerList);

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		model.addObject("todaysDate", sdf.format(Calendar.getInstance().getTimeInMillis()));

		return model;

	}

	List<CreditNotePosHeaderDisp> headerList;

	@RequestMapping(value = "/getPosCreditNoteHeaderList", method = RequestMethod.GET)
	@ResponseBody
	public List<CreditNotePosHeaderDisp> getPosCreditNoteHeaderList(HttpServletRequest request,
			HttpServletResponse responsel) {

		HttpSession session = request.getSession();

		headerList = new ArrayList<CreditNotePosHeaderDisp>();

		try {
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int custId = Integer.parseInt(request.getParameter("custId"));

			System.err.println("Date ------- " + fromDate + "          " + toDate + "                 " + custId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			map.add("custId", custId);
			map.add("frId", frDetails.getFrId());

			headerList = restTemplate.postForObject(Constant.URL + "/getPosCreditNoteHeaderDisp", map, ArrayList.class);

			/*
			 * if(headerList!=null) { for(int i=0;i<headerList.size();i++) { String
			 * dt=DateConvertor.convertToDMY(headerList.get(i).getCrnDate());
			 * headerList.get(i).setCrnDate(dt); } }
			 */

			System.err.println("DATA -------------------- " + headerList);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return headerList;
	}
	
	
	List<CreditNotePos> crnList;

	@RequestMapping(value = "/getPosCreditNoteListByCrNo", method = RequestMethod.GET)
	@ResponseBody
	public List<CreditNotePos> getPosCreditNoteListByCrNo(HttpServletRequest request,
			HttpServletResponse responsel) {

		HttpSession session = request.getSession();

		crnList = new ArrayList<CreditNotePos>();

		try {

			int crnNo = Integer.parseInt(request.getParameter("crnNo"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("crnNo", crnNo);
			
			CreditNotePos[] detailListRes = restTemplate
					.postForObject(Constant.URL + "/getPosCreditNoteListByCrnNo", map, CreditNotePos[].class);

			crnList = Arrays.asList(detailListRes);

			//crnList = restTemplate.postForObject(Constant.URL + "/getPosCreditNoteListByCrnNo", map, ArrayList.class);

			System.err.println("DATA -------------------- " + crnList);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return crnList;
	}
	
	
	
	@RequestMapping(value = "/editCreditNote", method = RequestMethod.POST)
	public String editCreditNote(HttpServletRequest request, HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			FrEmpMaster loginResponse = (FrEmpMaster) session.getAttribute("frEmpDetails");
			int userId = loginResponse.getFrEmpId();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			List<CreditNotePos> newCrnList = new ArrayList<>();

			if (crnList != null) {
				for (int i = 0; i < crnList.size(); i++) {

					CreditNotePos crn = crnList.get(i);

					try {
						float crnQty = Float.parseFloat(request.getParameter("qty" + crn.getCrnDetailNo()));
						float returnPer = Integer.parseInt(request.getParameter("retPer" + crn.getCrnDetailNo()));

						if (crnQty > 0) {

							float billTotal = (crn.getRate() - crn.getDiscAmt() / crn.getBillQty())
									* crnQty;
							float tempGrandTotal = (billTotal * returnPer) / 100;
							float taxableAmt = (tempGrandTotal * 100)
									/ (100 + crn.getCgstPer() + crn.getSgstPer());

							float cgstAmt = taxableAmt * (crn.getCgstPer() / 100);
							float sgstAmt = taxableAmt * (crn.getSgstPer() / 100);

							float grandTotal = taxableAmt + cgstAmt + sgstAmt;

							CreditNotePos cr = new CreditNotePos();
							cr.setCrnDetailNo(crn.getCrnDetailNo());
							cr.setCrnNo(crn.getCrnNo());
							cr.setCrnInvoiceNo(crn.getCrnInvoiceNo());
							cr.setBillNo(crn.getBillNo());
							cr.setBillDetailNo(crn.getBillDetailNo());
							cr.setBillInvoice(crn.getBillInvoice());
							cr.setCrnDate(crn.getCrnDate());
							cr.setItemId(crn.getItemId());
							cr.setItemName(crn.getItemName());
							cr.setCrnQty(crnQty);
							cr.setBillQty((int) crn.getBillQty());
							cr.setRate(crn.getRate());
							cr.setDiscAmt(crn.getDiscAmt());
							cr.setBillTotal(billTotal);
							cr.setReturnPer(returnPer);
							cr.setTaxableAmt(taxableAmt);
							cr.setCgstPer(crn.getCgstPer());
							cr.setCgstAmt(cgstAmt);
							cr.setSgstPer(crn.getSgstPer());
							cr.setSgstAmt(sgstAmt);
							cr.setIgstPer(crn.getIgstPer());
							cr.setIgstAmt(crn.getIgstAmt());
							cr.setCessPer(0);
							cr.setCessAmt(0);
							cr.setGrandTotal(grandTotal);
							cr.setDelStatus(0);
							cr.setStatus(0);
							cr.setUserId(userId);
							cr.setCustId(crn.getCustId());
							cr.setIsStockable(crn.getIsStockable());
							cr.setExInt1(crn.getExInt1());
							cr.setExInt2(crn.getExInt2());
							cr.setExVar1(crn.getExVar1());
							cr.setExVar2(crn.getExVar2());
							cr.setExFloat1(crn.getExFloat1());
							cr.setExFloat1(crn.getExFloat1());

							newCrnList.add(cr);
						}

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

				System.err.println("crnList ========== " + newCrnList);
				if (!newCrnList.isEmpty()) {

					CreditNotePos[] res = restTemplate.postForObject(Constant.URL + "editNewPosCreditNoteList", newCrnList,
							CreditNotePos[].class);
				}

			}

		} catch (Exception e) {
			System.out.println("Exception In addCreditNote Process:" + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/creditNoteHeaderList";
	}
	

}
