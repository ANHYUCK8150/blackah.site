package com.blackah.site.controller;

import java.io.UnsupportedEncodingException;
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
import com.blackah.site.service.impl.NaverBookService;
import com.blackah.site.vo.BookVO;
import com.blackah.site.vo.HmCodeVO;
import com.blackah.site.vo.PagingVO;

@Controller
public class APIController {
	@Resource(name="APIService")
	private APIService apiService;
	
	@Resource(name="BookAPI")
	private NaverBookService bookService;
	
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
		
		Object result = apiClass.response(params);
		
		return result;
	}
	
	
	
	
	/*
	 * 도서 검색 API
	 */
	@RequestMapping("api/book.do")
	public String bookAPI(Model model) {
		
		PagingVO pagingVO = new PagingVO();
		List<BookVO> bookList = bookService.searchBook("java", 10, 1,pagingVO);
		System.out.println(pagingVO);
		model.addAttribute("bookList",bookList);
		model.addAttribute("total", pagingVO.getTotal());
		model.addAttribute("paging", pagingVO);
		return "API/list_book";
	}
	
	@RequestMapping("api/list_book_ajax.do")
	public String bookAPI_ajax(Model model
			,@RequestParam(value="nowPage", required=false)Integer nowPage
			,@RequestParam(value="searchText", required=false)String searchText
			,@RequestParam(value="searchOption", required=false)Integer searchOption
		) {
		
		if(searchText.equals("")) {
			searchText = "java";
		}
		
		PagingVO pagingVO = new PagingVO();
		List<BookVO> bookList = bookService.searchBook(searchText, searchOption, nowPage,pagingVO);
		model.addAttribute("bookList",bookList);
		model.addAttribute("total", pagingVO.getTotal());
		model.addAttribute("paging", pagingVO);
		return "API/ajax/list_book_ajax";
	}
	
}
