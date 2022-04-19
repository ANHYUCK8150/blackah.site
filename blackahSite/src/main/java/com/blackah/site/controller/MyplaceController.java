package com.blackah.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.blackah.site.vo.DevelopVO;
import com.blackah.site.vo.MemberVO;
import com.blackah.site.vo.MyBookVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

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
	public String book_reg(@RequestParam(value="brIdx", required=false)String brIdx, Model model, HttpSession session){
		MyBookVO myBookVO = new MyBookVO();
		if(brIdx != null) {
			List<MyBookVO> list = myplaceService.mybookList(brIdx);
			
			myBookVO = list.get(0);
		}
		
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
			, HttpServletRequest request
			,  HttpServletResponse response) throws Exception {
		
		int sqlResult = 0;
		
		MyBookVO myBookVO = new MyBookVO();
		
		myBookVO.setBrIdx(params.get("brIdx").toString());		
		myBookVO.setBrSubject(params.get("brSubject").toString());
		myBookVO.setBrContent(params.get("brContent").toString());
		myBookVO.setBrState(params.get("brState").toString());
		
		try {
			FileUploadClass fileUpload = new FileUploadClass();
			
			String url = fileUpload.restore(file,request);
		    
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
	@RequestMapping("myplace/develop.do")
	public String develop(Model model, @RequestParam(value="nowPage", required=false)String nowPage) {
		//검색값 or 초기값 선언부
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO();
		String[] selectSkill = {"ALL"};
		String[] selectWork = {"ALL"};
		String searchText = "";
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//개발공간 리스트 총합
		String listCnt = myplaceService.developListCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("9"));
		
		//리스트
		List<SkillVO> skillList = myplaceService.skillList();
		List<ProjectVO> list = myplaceService.developList(pagingVO);
		
		//model
		model.addAttribute("skillList", skillList);
		model.addAttribute("developList", list);
		model.addAttribute("TotaldevelopList", listCnt);
		model.addAttribute("paging", pagingVO);
		
		return "Myplace/develop_list";
	}
	
	//AJAX 프로젝트 리스트
	@RequestMapping("myplace/develop_list_ajax.do")
	public String develop_list_ajax(Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="searchSkill[]", required=false)String[] selectSkill
			, @RequestParam(value="searchText", required=false)String searchText) {
		//검색값 or 초기값 선언부
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO();;
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchText(searchText);
		
		//개발공간 리스트 총합
		String listCnt = myplaceService.developListCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("9"));
		
		//리스트
		List<SkillVO> skillList = myplaceService.skillList();
		List<ProjectVO> list = myplaceService.developList(pagingVO);
		
		//model
		model.addAttribute("skillList", skillList);
		model.addAttribute("developList", list);
		model.addAttribute("TotaldevelopList", listCnt);
		model.addAttribute("paging", pagingVO);
		
		return "Myplace/ajax/develop_list_ajax";
	}
	
	//개발공간 등록 페이지
	@RequestMapping("myplace/develop_reg.do")
	public String develop_reg(Model model, @RequestParam(value="diIdx", required=false)String diIdx
			,HttpSession session) {
		
		DevelopVO developList = new DevelopVO();
		if(diIdx != null) {
			developList = myplaceService.GetDevelop(diIdx);
		}
		List<SkillVO> skillList = myplaceService.skillList();
		
		model.addAttribute("skillList", skillList);
		model.addAttribute("developList", developList);

		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO == null) {
			return "Myplace/develop_view";
		}else {
			if(!memberVO.getMbID().equals("admin")) {
				return "Myplace/develop_view";
			}
		}
		
		return "Myplace/develop_reg";
	}
	
	//개발공간 삭제
	@RequestMapping("myplace/develop_delete.do")
	public String DevelopDel(@RequestParam(value="checkList", required=false)String[] checkList) {
		
		int sqlResult = myplaceService.deleteDevelop(checkList);
		
		return "redirect:develop.do";
	}
	
	//개발공간 등록
	@RequestMapping("myplace/develop_modify.do")
	public String ProjectModify(@RequestParam Map<String,Object> params, HttpServletResponse response) throws Exception {
		System.out.println(params);
		int sqlResult = 0;
		
		DevelopVO developVO = new DevelopVO();
		
		developVO.setDiIdx(params.get("diIdx").toString());		
		developVO.setDiSubject(params.get("diSubject").toString());
		developVO.setDiTech(params.get("diTech").toString());
		developVO.setDiContent(params.get("diContent").toString());
		
		if(params.get("diIdx").equals("")) {
			//등록 로직
			sqlResult = myplaceService.insertDevelop(developVO);
			
			if(sqlResult > 0) {
				alertClass.alert(response, "등록에 성공 하였습니다.", "develop.do");
			}else {
				alertClass.alert(response, "등록에 실패 하였습니다.", "back");
			}
		}else {
			//수정 로직
			sqlResult = myplaceService.updateDevelop(developVO);
			
			if(sqlResult > 0) {
				alertClass.alert(response, "수정 성공 하였습니다.", "develop.do");
			}else {
				alertClass.alert(response, "수정 실패 하였습니다.", "back");
			}
		}
		return "Myplace/develop_list";
	}
	
	/*------------------------------------------
	 * 개발공간 end
	 -------------------------------------------*/
}
