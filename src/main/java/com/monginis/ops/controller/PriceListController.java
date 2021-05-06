package com.monginis.ops.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;


import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.CategoryListResponse;
import com.monginis.ops.model.ExportToExcel;
import com.monginis.ops.model.Flavour;
import com.monginis.ops.model.FlavourConf;
import com.monginis.ops.model.FlavourList;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.MCategoryList;
import com.monginis.ops.model.SearchSpCakeResponse;
import com.monginis.ops.model.SpCakeOrder;
import com.monginis.ops.model.SpCakeResponse;
import com.monginis.ops.model.SpecialCake;
import com.monginis.ops.model.SubCategory;

@Controller
@Scope("session")
public class PriceListController {
	
	List<MCategoryList> CatList=  new ArrayList<MCategoryList>();
	
	FlavourList	flavourList =new FlavourList();
	
	List<SpecialCake> specialCakeList = new ArrayList<SpecialCake>();

	public static List<MCategoryList> mCategoryList = null;
	
	@RequestMapping(value = "/showPriceList", method = RequestMethod.GET)
	public ModelAndView showPriceList(HttpServletRequest request, HttpServletResponse response)
	{
		System.err.println("In /showPriceList");
		ModelAndView model = new ModelAndView("priceList");
		RestTemplate restTemplate=new RestTemplate();
	
	    try {
    		  HttpSession session = request.getSession();
    			CategoryListResponse catResp 	= restTemplate.getForObject(Constant.URL + "showAllCategory", CategoryListResponse.class);
    			CatList=catResp.getmCategoryList();
    			model.addObject("mCategoryList", CatList);
    			mCategoryList = catResp.getmCategoryList();
    			
    		flavourList = restTemplate.getForObject(Constant.URL + "/showFlavourList", FlavourList.class);
    		model.addObject("flavourList", flavourList.getFlavour());
	    	// System.err.println("flvours==>"+flavourList.toString());
    		
    		SpCakeResponse spCakeResponse = restTemplate
					.getForObject(Constant.URL + "showSpecialCakeListOrderBySpCode", com.monginis.ops.model.SpCakeResponse.class);
			System.out.println("SpCake Controller SpCakeList Response " + spCakeResponse.toString());
			

			specialCakeList = spCakeResponse.getSpecialCake();
	    	  
			model.addObject("specialCakeList", specialCakeList);
	    	 
	    	
	
            
	    }catch (Exception e) {
			e.printStackTrace();
			System.err.println("Exception In /showPriceList");
		}
		    return model;

	}
	
	
	List<FlavourConf> resp=new ArrayList<>();
	
	@RequestMapping(value="/searchSpPrice",method=RequestMethod.POST)
	public @ResponseBody 	List<FlavourConf> searchBulkOrderAjax(HttpServletRequest request,HttpServletResponse response){
		System.err.println("In /searchSpPrice");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		RestTemplate restTemplate=new RestTemplate();
		
		try {
			 Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			
			int flag=Integer.parseInt(request.getParameter("flag"));
			String ids=request.getParameter("ids");
			ids = ids.substring(1, ids.length() - 1);
			ids = ids.replaceAll("\"", "");
			System.err.println("Flag-->"+flag+"\t"+"ids-->"+ids);
			if(flag==2) {
				map=new LinkedMultiValueMap<>();
				//map.add("frId", frDetails.getFrId());
				map.add("flavIds", ids);
				FlavourConf[] resArr=restTemplate.postForObject(Constant.URL+"getSpByFlavId", map, FlavourConf[].class);
				resp=new ArrayList<>(Arrays.asList(resArr));
			System.err.println("Resp-->"+resp.toString());
			}else if(flag==1) {
				map=new LinkedMultiValueMap<>();
					//map.add("frId", frDetails.getFrId());
					map.add("spIds", ids);
					FlavourConf[] resArr=restTemplate.postForObject(Constant.URL+"getSpBySpId", map, FlavourConf[].class);
					resp=new ArrayList<>(Arrays.asList(resArr));
				System.err.println("Resp-->"+resp.toString());
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception In /searchBulkOrderAjax");
		e.printStackTrace();
		}
		return resp;
	}
	
	
	@RequestMapping(value = "pdf/showSpPricelistPdf/", method = RequestMethod.GET)
	public ModelAndView showSpPricelistPdf(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("In /showSpPricelistPdf");
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd ");  
		   LocalDateTime now = LocalDateTime.now();  
		 
		   HttpSession session = request.getSession();
		   
		   Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		ModelAndView model = new ModelAndView("showSpPricelistPdf"); 
		//model.addObject("fromDate", );

		model.addObject("frName",frDetails.getFrName() );
		model.addObject("toDate",dtf.format(now) );
		model.addObject("FACTORYNAME", Constant.FACTORYNAME);
		model.addObject("FACTORYADDRESS", Constant.FACTORYADDRESS);
		model.addObject("configList", resp);

		return model;
	}
	
	
	
	@RequestMapping(value="/selAllCakeAjax",method=RequestMethod.GET)
	public @ResponseBody 	List<SpecialCake> selAllCakeAjax(){
		System.err.println("In /selAllCakeAjax");
		return specialCakeList;
	}
	
	
	@RequestMapping(value="/selAllFlavAjax",method=RequestMethod.GET)
	public @ResponseBody 	List<Flavour> getAllFlav(){
		System.err.println("In /selAllFlavAjax");
		return flavourList.getFlavour();
	}
	
	
	@RequestMapping(value="/getAllCategoery",method=RequestMethod.GET)
	public @ResponseBody 	List<MCategoryList> getAllCategoery(){
		System.err.println("In /getAllCategoery");
		return CatList;
	}
	
	
	
	
	
	@RequestMapping(value = "/getSubcat2ByCatId", method = RequestMethod.GET)
	public @ResponseBody List<SubCategory> subCatById(@RequestParam(value = "catId", required = true) int catId) {
	
		System.err.println("In /getSubcat2ByCatId"+catId);
		List<SubCategory> subCatList = new ArrayList<SubCategory>();
		System.out.println("CatId" + mCategoryList.size());
		try {
			for (int x = 0; x < mCategoryList.size(); x++) {
				System.out.println("mCategoryList.get(x).getCatId(" + mCategoryList.get(x).getCatId());
				if (mCategoryList.get(x).getCatId() == catId) {
					subCatList = mCategoryList.get(x).getSubCategoryList();
				}

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /getGroup2ByCatId");
		}

		return subCatList;
	}
	
	
	
	
	List<Item> itemList=new ArrayList<>();
	@RequestMapping(value="/searchItemInSubcat",method=RequestMethod.POST)
	public @ResponseBody List<Item> getItemsInSubcat(HttpServletRequest request,HttpServletResponse response){
		System.err.println("In /searchItemsForMultiSubcat");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		RestTemplate restTemplate=new RestTemplate();
		HttpSession session = request.getSession();
		
		
		
		
		try {
			String selectedCat=request.getParameter("subcatIds");
			Integer mrp =Integer.parseInt(request.getParameter("mrpType"));
			System.err.println("MRP Type--->"+mrp);
			selectedCat = selectedCat.substring(1, selectedCat.length() - 1);
			selectedCat = selectedCat.replaceAll("\"", "");
			
			System.err.println(selectedCat);
			
			map.add("subCatId", selectedCat);
			map.add("Mrp", mrp);
			Item[] itemArr = restTemplate.postForObject(Constant.URL + "getItemsBySubCatIdWithMrp", map, Item[].class);
			itemList=new ArrayList<>(Arrays.asList(itemArr));
			
			
			
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Sr. No.");
			rowData.add("Item  Name");
			rowData.add("Mrp");
		

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
			List<Item> excelItems = itemList;
			for (int i = 0; i < excelItems.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();
				rowData.add("" + (i + 1));
				rowData.add("" + excelItems.get(i).getItemName());
				rowData.add("" + excelItems.get(i).getItemMrp1());
				
				
				

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}

			session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "itemsList");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception Occuered in /searchItemsForMultiSubcat");
		}
		
		return itemList;
	}
	
	
	@RequestMapping(value = "pdf/showPricelistPdf/", method = RequestMethod.GET)
	public ModelAndView showConfigMenuPdf(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("In /showPricelistPdf");
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd ");  
		   LocalDateTime now = LocalDateTime.now();  
		 
		   HttpSession session = request.getSession();
		   
		   Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		ModelAndView model = new ModelAndView("showPricelistPdf"); 
		//model.addObject("fromDate", );

		model.addObject("frName",frDetails.getFrName() );
		model.addObject("toDate",dtf.format(now) );
		model.addObject("FACTORYNAME", Constant.FACTORYNAME);
		model.addObject("FACTORYADDRESS", Constant.FACTORYADDRESS);
		model.addObject("configList", itemList);

		return model;
	}
	
	
	
	
	
	

}
