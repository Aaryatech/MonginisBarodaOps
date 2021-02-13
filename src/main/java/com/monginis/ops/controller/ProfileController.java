package com.monginis.ops.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.common.Firebase;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.constant.VpsImageUpload;
import com.monginis.ops.model.ErrorMessage;
import com.monginis.ops.model.FrLoginResponse;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.FranchiseSup;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.LoginInfo;
import com.monginis.ops.model.Setting;
import com.monginis.ops.model.pettycash.FrEmpMaster;
 

@Controller
@Scope("session")
public class ProfileController {
	
	int empCodeKey = 52;

	@RequestMapping(value = "/showeditprofile")
	public ModelAndView displaySavouries(HttpServletRequest request,HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("profile");
        int pestControlFlag=0;int aggrementFlag=0;int fbaFlag=0;
		try {
			HttpSession ses = request.getSession();
			Franchisee frDetails = (Franchisee) ses.getAttribute("frDetails");
			String frImageName = (String) ses.getAttribute("frImage");
			System.out.println("Franchisee Rsponse" + frDetails);
			RestTemplate rest = new RestTemplate();
			
			Setting setting= rest.getForObject(Constant.URL + "/getSettingDataById?settingId={settingId}",
					Setting.class,empCodeKey);
			model.addObject("empCode", setting.getSettingValue());
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());
			

			FranchiseSup frSup = rest.postForObject(Constant.URL + "/getFrSupByFrId", map, FranchiseSup.class);

			Date currentDate = new Date();
			Date pestControlDate = new SimpleDateFormat("dd-MM-yyyy").parse(frSup.getPestControlDate());
			Date agrementDate = new SimpleDateFormat("dd-MM-yyyy").parse(frDetails.getFrAgreementDate());
			Date fbaLicenseDate = new SimpleDateFormat("dd-MM-yyyy").parse(frDetails.getFbaLicenseDate());
			if (pestControlDate.before(currentDate)) {
				pestControlFlag=1;
			}
			if (agrementDate.before(currentDate)) {
				aggrementFlag=1;
			}
			if (fbaLicenseDate.before(currentDate)) {
				fbaFlag=1;
			}
			
			model.addObject("pestControlFlag", pestControlFlag);
			model.addObject("aggrementFlag", aggrementFlag);
			model.addObject("fbaFlag", fbaFlag);
			model.addObject("frSup", frSup);
			model.addObject("URL", Constant.FR_IMAGE_URL);
			model.addObject("frImageName", frImageName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;

}
	@RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
	public String editProfile(HttpServletRequest request,
		HttpServletResponse response,@RequestParam("fr_image") List<MultipartFile> file) {
		//,@RequestParam("fr_image") MultipartFile file
		//ModelAndView model = new ModelAndView("profile");
		System.out.println("I am here");
		
		String frName=request.getParameter("fr_name");
		String frEmail=request.getParameter("fr_email");
		String frMob=request.getParameter("fr_mobile");
		String frOwner=request.getParameter("fr_owner");
		String frCity=request.getParameter("fr_city");
		String frPassword=request.getParameter("fr_password");
		// String frImage=ImageS3Util.uploadFrImage(file);
		
		
		HttpSession ses = request.getSession();
		Franchisee frDetails = (Franchisee) ses.getAttribute("frDetails");
		
		
		try {
			RestTemplate rest = new RestTemplate();
			
			String frImage = request.getParameter("prevImage");

			if (!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {

				VpsImageUpload upload = new VpsImageUpload();

				//Calendar cal = Calendar.getInstance();
				//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				//System.out.println(sdf.format(cal.getTime()));

			//	String curTimeStamp = sdf.format(cal.getTime());
		 
				try {
					frImage=file.get(0).getOriginalFilename();
					upload.saveUploadedFiles(file, Constant.FR_IMAGE_TYPE,file.get(0).getOriginalFilename());
					System.out.println("upload method called " + file.toString());
					frDetails.setFrImage(Constant.FR_IMAGE_URL+frImage);
					ses.setAttribute("frDetails",frDetails);
					ses.setAttribute("frImage",frImage);

				} catch (IOException e) {
					
					System.out.println("Exce in File Upload In Fr Update Process " + e.getMessage());
					e.printStackTrace();
				}
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			map.add("frName", frName);
			frDetails.setFrName(frName);
			map.add("frCity", frCity);
			frDetails.setFrCity(frCity);
			map.add("frPassword",frDetails.getFrPassword());
			frDetails.setFrEmail(frEmail);
			map.add("frEmail", frEmail);
			map.add("frMob", frMob);
			frDetails.setFrMob(frMob);
			map.add("frOwner", frOwner);
			frDetails.setFrOwner(frOwner);
			map.add("grnTwo", frDetails.getGrnTwo());
			map.add("delStatus", frDetails.getDelStatus());
			map.add("ownerBirthDate", frDetails.getOwnerBirthDate());
			map.add("fbaLicenseDate", frDetails.getFbaLicenseDate());
			map.add("frAgreementDate", frDetails.getFrAgreementDate());
			map.add("frGstType", frDetails.getFrGstType());
			map.add("frGstNo", frDetails.getFrGstNo());
			map.add("stockType", frDetails.getStockType());
			map.add("frAddress", frDetails.getFrAddress());
			map.add("frTarget", frDetails.getFrTarget());
			map.add("frKg1", frDetails.getFrKg1());
			map.add("frKg2", frDetails.getFrKg2());
			map.add("frKg3", frDetails.getFrKg3());
			map.add("frKg4", frDetails.getFrKg4());
			map.add("frId",frDetails.getFrId() );
			map.add("frCode", frDetails.getFrCode());
			map.add("frOpeningDate",frDetails.getFrOpeningDate());
			map.add("frImage",frImage);
			map.add("frRouteId", frDetails.getFrRouteId());
			map.add("frRateCat", frDetails.getFrRateCat());
			map.add("isSameState",frDetails.getIsSameState());
			int intFrRate=(int) frDetails.getFrRate();
			map.add("frRate",intFrRate);
			map.add("frRmn1", frDetails.getFrRmn1());
			
			 System.out.println(frName+""+frEmail+""+frMob+""+frOwner+""+frCity+""+frPassword);
			
			//ErrorMessage errorMessage
			 ErrorMessage errorMessage= rest.postForObject(Constant.URL+"updateFranchisee", map, ErrorMessage.class);
			 System.out.println("REst");
			
			if (errorMessage.getError()) {
				return "redirect:/showeditprofile";
				
			} else {
				ses.setAttribute("frDetails", frDetails);
				 try {
					   map = new LinkedMultiValueMap<String, Object>();
					   map.add("frId",frDetails.getFrId());
					   
                       String token= rest.postForObject(Constant.URL+"getFrToken", map, String.class);
					
			           Firebase.sendPushNotifForCommunication(token,"Profile Updated","Your Profile has been changed. If you have not done the changes, Kindly report us. Team Monginis","inbox");
					
			         }
			         catch(Exception e2)
			         {
				       e2.printStackTrace();
			         }
				return "redirect:/showeditprofile";

			}

			}catch(Exception e)
			{
				
				System.out.println(e.getMessage());
			}
			 return "redirect:/showeditprofile";
	}
	
	
	@RequestMapping(value = "/checkUserAuthority", method = RequestMethod.GET)
	public @ResponseBody LoginInfo checkUserAuthority(HttpServletRequest request,HttpServletResponse response) {
		
		FrLoginResponse loginResponse=new FrLoginResponse();
		try
		{
		String adminPwd=request.getParameter("adminPwd");

		HttpSession session = request.getSession();

		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("frCode", frDetails.getFrCode());
		map.add("frPasswordKey",adminPwd);

		RestTemplate restTemplate = new RestTemplate();

		 loginResponse = restTemplate.postForObject(Constant.URL + "/loginFr", map,
				FrLoginResponse.class);

		System.out.println("Login Response " + loginResponse.toString());

		
		}
		catch(Exception e)
		{
			System.out.println("Exception In /checkAutority Method /ProfileController");
		}
		return loginResponse.getLoginInfo();

	}
	
	
	@RequestMapping(value = "/updateUserPasswords", method = RequestMethod.GET)
	public @ResponseBody Info updateUserPasswords(HttpServletRequest request,HttpServletResponse response) {
		
		//String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		String pass3=request.getParameter("pass3");

		HttpSession session = request.getSession();

		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("frId", frDetails.getFrId());
		//map.add("pass1", pass1);
		map.add("pass2",pass2);
		map.add("pass3",pass3);

		RestTemplate restTemplate = new RestTemplate();

		 Info info = restTemplate.postForObject(Constant.URL + "/updateFranchiseSupUsrPwd", map,
				 Info.class);

		 System.out.println(info.toString());
		return info;
	}
	
	
	
	@RequestMapping(value = "/updateAdminPassword", method = RequestMethod.GET)
	public @ResponseBody Info updateAdminPassword(HttpServletRequest request,HttpServletResponse response) {
		
		String adminPwd=request.getParameter("adminPwd");
	

		HttpSession session = request.getSession();

		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("frId", frDetails.getFrId());
		map.add("adminPwd", adminPwd);
	    
		RestTemplate restTemplate = new RestTemplate();

		 Info info = restTemplate.postForObject(Constant.URL + "/updateAdminPwd", map,
				 Info.class);

		 System.out.println(info.toString());
		return info;
	}
	
	
	/***********************************
	 * Franchisee Employee
	 ****************************************/

	@RequestMapping(value = "/saveFranchiseeEmp", method = RequestMethod.POST)
	public @ResponseBody FrEmpMaster saveFranchiseeEmp(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		FrEmpMaster saveEmp = new FrEmpMaster();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();

			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			RestTemplate rest = new RestTemplate();
			FrEmpMaster emp = new FrEmpMaster();
			int frEmpId = 0;
			try {
					frEmpId = Integer.parseInt(req.getParameter("fr_emp_id"));
				}catch (Exception e) {
					frEmpId = 0;
					e.printStackTrace();
				}
			System.out.println("EmpId=" + frEmpId);

			emp.setFrEmpId(frEmpId);
			emp.setCurrentBillAmt(Float.parseFloat(req.getParameter("curr_bill_amt")));
			emp.setDelStatus(Integer.parseInt(req.getParameter("emp_status")));
			emp.setDesignation(Integer.parseInt(req.getParameter("designation")));
			emp.setEmpCode(req.getParameter("emp_code"));
			emp.setExInt1(0);
			emp.setExInt2(0);
			emp.setExInt3(0);
			emp.setExVar1("NA");
			emp.setExVar2("NA");
			emp.setExVar3("NA");
			emp.setFrEmpAddress(req.getParameter("emp_address"));
			emp.setFrEmpContact(req.getParameter("emp_contact"));
			System.out.println(req.getParameter("join_date"));
			emp.setFrEmpJoiningDate(req.getParameter("join_date"));
			emp.setFrEmpName(req.getParameter("emp_name"));
			emp.setFrId(frid);

			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			String frDate = req.getParameter("from_date");
			String tDate = req.getParameter("to_date");
			
		//	System.err.println("FDATE ------------------------------ "+frDate);
		//	System.err.println("TDATE ------------------------------ "+tDate);
			
			if (frDate == null || frDate.isEmpty()) {
					frDate=sdf.format(Calendar.getInstance().getTimeInMillis());
			}

			if (tDate == null || tDate.isEmpty()) {
				tDate=sdf.format(Calendar.getInstance().getTimeInMillis());
			}
			
			//System.err.println("FDATE ------------------------------ "+frDate);
			//System.err.println("TDATE ------------------------------ "+tDate);

			emp.setFromDate(frDate);
			emp.setToDate(tDate);
			emp.setIsActive(0);
			emp.setPassword(req.getParameter("pass"));
			emp.setTotalLimit(Float.parseFloat(req.getParameter("ttl_limit")));
			emp.setUpdateDatetime(dateFormat.format(date));

			saveEmp = rest.postForObject(Constant.URL + "/saveFrEmpDetails", emp, FrEmpMaster.class);
			//System.out.println("Result-----------" + saveEmp);

			if (saveEmp != null) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return saveEmp;

	}

	@RequestMapping(value = "/getAllFrEmp", method = RequestMethod.GET)
	public @ResponseBody List<FrEmpMaster> getAllFrEmp(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		List<FrEmpMaster> empList = null;
		try {
			session = req.getSession();
			int frid = (int) session.getAttribute("frId");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", frid);
			FrEmpMaster[] empArr = rest.postForObject(Constant.URL + "/getAllFrEmp", map, FrEmpMaster[].class);
			empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));

		//	System.out.println("Emp List----------" + empList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;

	}
	
	@RequestMapping(value = "/getCurrentEmpCodeValue", method = RequestMethod.GET)
	public @ResponseBody int getCurrentEmpCodeValue(HttpServletRequest request,HttpServletResponse response) {
		
		int value=0;
		
		RestTemplate rest = new RestTemplate();
			
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("settingId", empCodeKey);
			Setting setting= rest.postForObject(Constant.URL + "/getSettingValueById",map,
					Setting.class);
			value=setting.getSettingValue();
			
		}catch(Exception e) {e.printStackTrace();}

		return value;
	}
	
	@RequestMapping(value = "/getFrEmpById", method = RequestMethod.GET)
	public @ResponseBody FrEmpMaster getFrEmpById(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		FrEmpMaster emp = new FrEmpMaster();
		try {
			RestTemplate rest = new RestTemplate();
			int empId = Integer.parseInt(req.getParameter("empId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("empId", empId);

			emp = rest.postForObject(Constant.URL + "/getFrEmpByEmpId", map, FrEmpMaster.class);
			emp.setExVar1(DateConvertor.convertToYMD(emp.getFrEmpJoiningDate()));
			emp.setExVar2(DateConvertor.convertToYMD(emp.getFromDate()));
			emp.setExVar3(DateConvertor.convertToYMD(emp.getToDate()));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}
	
	@RequestMapping(value = "/verifyUniqueContactNo", method = RequestMethod.GET)
	public @ResponseBody Info verifyUniqueContactNo(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		try {
			HttpSession session = request.getSession();
			int frid = (int) session.getAttribute("frId");
			RestTemplate restTemplate = new RestTemplate();
			String mobNo = request.getParameter("mobNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mobNo", mobNo);
			map.add("frId", frid);

			info = restTemplate.postForObject(Constant.URL + "/checkUniqueContactNo", map, Info.class);
			//System.out.println("Info Res----------------" + info);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;

	}
	
}
