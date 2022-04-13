package com.blackah.site.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackah.site.config.APIClass;
import com.blackah.site.service.APIService;
import com.blackah.site.vo.HmCodeVO;

@Controller
public class APIController {
	@Resource(name="APIService")
	private APIService apiService;
	
	@RequestMapping("api/fruit.do")
	public String fruit(Model model) {
		
		HmCodeVO hmCode = new HmCodeVO();
		
		hmCode.setHmcParent("0");
		
		List<HmCodeVO> list = apiService.list(hmCode);
		hmCode.setHmcParent("1000000");
		List<HmCodeVO> list_market = apiService.list(hmCode);
		
		model.addAttribute("fruitList", list);
		model.addAttribute("marketList", list_market);
		
		return "API/list_fruit";
	}
	
	@RequestMapping("api/CodeImport.do")
	@ResponseBody
	public String CodeImport(
			@RequestParam(value="hmcIdx", required=false)String hmcIdx
			,@RequestParam(value="hmcParent", required=false)String hmcParent
			,@RequestParam(value="hmcNM", required=false)String hmcNM) {
		String result = "";
		HmCodeVO hmCode = new HmCodeVO();
		
		hmCode.setHmcIdx(hmcIdx);
		hmCode.setHmcParent(hmcParent);
		hmCode.setHmcNM(hmcNM);
		
		int queryChk = apiService.insert(hmCode);
		
		if(queryChk > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
	@RequestMapping("api/GetCode.do")
	@ResponseBody
	public List<HmCodeVO> GetCode(@RequestParam(value="hmcParent", required=false)String hmcParent) {
		
		HmCodeVO hmCode = new HmCodeVO();
		
		hmCode.setHmcParent(hmcParent);
		
		return apiService.list(hmCode);
	}
	
	@RequestMapping("api/GetFruitAPI.do")
	@ResponseBody
	public Object GetFruitAPI(
			@RequestParam Map<String,Object> params
		) throws UnsupportedEncodingException {
		
		APIClass apiClass = new APIClass();
		
		System.out.println("================= map " + params);
		
		Object result = apiClass.response(params);
		
		return result;
	}
}
