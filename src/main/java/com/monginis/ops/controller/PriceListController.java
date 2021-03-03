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
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.MCategoryList;
import com.monginis.ops.model.SubCategory;

@Controller
@Scope("session")
public class PriceListController {
	
	

	public static List<MCategoryList> mCategoryList = null;
	
	@RequestMapping(value = "/showPriceList", method = RequestMethod.GET)
	public ModelAndView showPriceList(HttpServletRequest request, HttpServletResponse response)
	{
		System.err.println("In /showPriceList");
		ModelAndView model = new ModelAndView("priceList");
		RestTemplate restTemplate=new RestTemplate();
		List<MCategoryList> CatList=  new ArrayList<MCategoryList>();
	    try {
    		  HttpSession session = request.getSession();
    			CategoryListResponse catResp 	= restTemplate.getForObject(Constant.URL + "showAllCategory", CategoryListResponse.class);
    			CatList=catResp.getmCategoryList();
    			model.addObject("mCategoryList", CatList);
    			mCategoryList = catResp.getmCategoryList();
	    	 
	    	  
	    	 
	    	
	
            
	    }catch (Exception e) {
			e.printStackTrace();
			System.err.println("Exception In /showPriceList");
		}
		    return model;

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
		  
		ModelAndView model = new ModelAndView("showPricelistPdf"); 
		//model.addObject("fromDate", );

		model.addObject("toDate",dtf.format(now) );
		model.addObject("FACTORYNAME", Constant.FACTORYNAME);
		model.addObject("FACTORYADDRESS", Constant.FACTORYADDRESS);
		model.addObject("configList", itemList);

		return model;
	}
	
	
	
	
	
	

}
