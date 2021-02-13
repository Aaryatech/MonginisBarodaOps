package com.monginis.ops.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.Info;

@Controller
@Scope("session")
public class PosPlaceOrderController {

	
	@RequestMapping(value = "/checkEmailText", method = RequestMethod.GET)
	@ResponseBody
	public int checkEmailText(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		int res = 0;

		try {

			String phoneNo = request.getParameter("phoneNo");
			System.out.println("Info" + phoneNo);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("phoneNo", phoneNo);
			RestTemplate restTemplate = new RestTemplate();
			info = restTemplate.postForObject(Constant.URL + "/checkCustPhone", map, Info.class);
			System.out.println("Info" + info + "info.isError()" + info.isError());
			if (info.isError() == false) {
				res = 0;// exists
				System.out.println("0s" + res);
			} else {
				try {
					res = Integer.parseInt(info.getMessage());
				} catch (Exception e) {
					res = 0;
				}

				System.out.println("1888" + res);
			}

		} catch (Exception e) {
			System.err.println("Exception in checkEmailText : " + e.getMessage());
			e.printStackTrace();
		}

		return res;

	}
	
}
