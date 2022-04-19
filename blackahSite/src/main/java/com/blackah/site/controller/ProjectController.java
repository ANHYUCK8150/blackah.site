package com.blackah.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blackah.site.config.FileUploadClass;
import com.blackah.site.service.ProjectService;
import com.blackah.site.vo.MemberVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

@Controller
public class ProjectController {
	@Resource(name = "ProService")
	private ProjectService proService;
	
	@RequestMapping("project/list.do")
	public String list(Model model, @RequestParam(value="nowPage", required=false)String nowPage) {
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
		
		//프로젝트 리스트 총합
		String listCnt = proService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("9"));
		
		//리스트
		List<SkillVO> skillList = proService.skillList();
		List<ProjectVO> list = proService.list(pagingVO);
		
		//model
		model.addAttribute("skillList", skillList);
		model.addAttribute("projectList", list);
		model.addAttribute("TotalProjectList", listCnt);
		model.addAttribute("paging", pagingVO);
		
		return "Project/list";
	}
	
	//AJAX 프로젝트 리스트
	@RequestMapping("project/list_ajax.do")
	public String list_ajax(Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="listType", required=false)String listType
			, @RequestParam(value="searchSkill[]", required=false)String[] selectSkill
			, @RequestParam(value="searchWork[]", required=false)String[] selectWork
			, @RequestParam(value="searchText", required=false)String searchText) {
		//검색값 or 초기값 선언부
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO();;
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//프로젝트 리스트 총합
		String listCnt = proService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("9"));
		
		//리스트
		List<ProjectVO> list = proService.list(pagingVO);
		
		//model
		model.addAttribute("projectList", list);
		model.addAttribute("TotalProjectList", listCnt);
		model.addAttribute("paging", pagingVO);
		model.addAttribute("listType", listType);
		
		return "Project/ajax/list_ajax";
	}
	
	//프로젝트 등록 페이지
	@RequestMapping("project/reg.do")
	public String reg(Model model, @RequestParam(value="pbIdx", required=false)String pbIdx
			,HttpSession session) {
		
		String result = "Project/reg";
		ProjectVO projectList = new ProjectVO();
		if(pbIdx != null) {
			projectList = proService.GetProject(pbIdx);
		}
		List<SkillVO> skillList = proService.skillList();
		
		model.addAttribute("skillList", skillList);
		model.addAttribute("projectList", projectList);

		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO == null) {
			result = "Project/view";
		}else {
			if(!memberVO.getMbID().equals("admin")) {
				result = "Project/view";
			}
		}
		
		return result;
	}
	
	//프로젝트 삭제
	@RequestMapping("project/delete.do")
	public String ProjectDel(@RequestParam(value="checkList", required=false)String[] checkList) {
		
		int sqlResult = proService.delete(checkList);
		
		return "redirect:list.do";
	}
	
	//프로젝트 등록
	@RequestMapping("project/modify.do")
	public String ProjectModify(@RequestParam Map<String,Object> params
			, @RequestParam("pbImage") MultipartFile file
			,  HttpServletRequest request
			, HttpSession session
			) {
		
		String resultUrl = "redirect:list.do";
		int sqlResult = 0;
		
		ProjectVO projectVO = new ProjectVO();
		
		projectVO.setPbIdx(params.get("pbIdx").toString());		
		projectVO.setPbSubject(params.get("pbSubject").toString());
		projectVO.setPbSkill(params.get("pbSkill").toString());
		projectVO.setPbWork(params.get("pbWork").toString());
		projectVO.setPbStartDT(params.get("pbStartDT").toString());
		projectVO.setPbEndDT(params.get("pbEndDT").toString());
		projectVO.setPbContent(params.get("pbContent").toString());
		
		try {
			FileUploadClass fileUpload = new FileUploadClass();
			
			String url = fileUpload.restore(file,request,session);
		    
		    projectVO.setPbImage(url);
		    
		}catch (Exception e) {
			projectVO.setPbImage("");
		}
		
		if(projectVO.getPbIdx().equals("")) {
			//insert
			sqlResult = proService.insert(projectVO);
			
			if(sqlResult < 1) {
				resultUrl = "project/modify.do";
			}
			
		}else {
			//update
			if(projectVO.getPbImage().toString() == "") {
				projectVO.setPbImage("UPDATE");
			}
			sqlResult = proService.update(projectVO);
			
			if(sqlResult < 1) {
				resultUrl = "project/modify.do";
			}
		}
		return resultUrl;
	}
}
