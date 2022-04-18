package com.blackah.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blackah.site.config.AlertClass;
import com.blackah.site.config.FileUploadClass;
import com.blackah.site.service.MyplaceService;
import com.blackah.site.vo.MemberVO;
import com.blackah.site.vo.MyBookVO;

@Controller
public class MyplaceController {
	AlertClass alertClass = new AlertClass();
	
	@Resource(name="myplaceService")
	private MyplaceService myplaceService;
	/*------------------------------------------
	 * 독서 start
	 -------------------------------------------*/
	@RequestMapping("myplace/bookreport.do")
	public String bookreport(Model model) {
		
		List<MyBookVO> list = myplaceService.mybookList("");
		
		model.addAttribute("bookList", list);
		
		return "Myplace/book_list";
	}
	
	@RequestMapping("myplace/book_reg.do")
	public String book_reg(@RequestParam String brIdx, Model model, HttpSession session){
		
		List<MyBookVO> list = myplaceService.mybookList(brIdx);
		
		MyBookVO myBookVO = list.get(0);
		
		model.addAttribute("bookList", myBookVO);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO == null) {
			return "Myplace/book_view";
		}else {
			if(!memberVO.getMbID().equals("admin")) {
				return "Myplace/book_view";
			}
		}
		
		return "Myplace/book_reg";
	}
	
	@PostMapping("myplace/book_modify.do")
	public String book_modify(@RequestParam Map<String,Object> params
			, @RequestParam("brImage") MultipartFile file
			,  HttpServletResponse response) throws Exception {
		System.out.println(params);
		
		int sqlResult = 0;
		
		MyBookVO myBookVO = new MyBookVO();
		
		myBookVO.setBrIdx(params.get("brIdx").toString());		
		myBookVO.setBrSubject(params.get("brSubject").toString());
		myBookVO.setBrContent(params.get("brContent").toString());
		myBookVO.setBrState(params.get("brState").toString());
		
		try {
			FileUploadClass fileUpload = new FileUploadClass();
			
			String url = fileUpload.restore(file);
		    
			myBookVO.setBrImage(url);
		    
		}catch (Exception e) {
			myBookVO.setBrImage("");
		}
		
		if(params.get("brIdx").equals("")) {
			//등록 로직
			sqlResult = myplaceService.insertBook(myBookVO);
			
			if(sqlResult > 0) {
				alertClass.alert(response, "등록에 성공 하였습니다.", "bookreport.do");
			}else {
				alertClass.alert(response, "등록에 실패 하였습니다.", "back");
			}
		}else {
			//수정 로직
			if(myBookVO.getBrImage().toString() == "") {
				myBookVO.setBrImage("UPDATE");
			}
			sqlResult = myplaceService.updateBook(myBookVO);
			
			if(sqlResult > 0) {
				alertClass.alert(response, "수정 성공 하였습니다.", "bookreport.do");
			}else {
				alertClass.alert(response, "수정 실패 하였습니다.", "back");
			}
		}
		return "Myplace/book_list";
	}
	
	/*------------------------------------------
	 * 독서 end
	 -------------------------------------------*/
	
	/*------------------------------------------
	 * 개발공간 start
	 -------------------------------------------*/
	
	/*------------------------------------------
	 * 개발공간 end
	 -------------------------------------------*/
}
