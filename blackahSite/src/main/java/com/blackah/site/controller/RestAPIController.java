package com.blackah.site.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blackah.site.service.ProjectService;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class RestAPIController {
	private final ProjectService projectService;
	
	@PostMapping("/projectlist")
	public Map<String, Object> projectList(
			@RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="listType", required=false)String listType
			, @RequestParam(value="searchSkill[]", required=false)String[] selectSkill
			, @RequestParam(value="searchWork[]", required=false)String[] selectWork
			, @RequestParam(value="searchText", required=false)String searchText){
		
		if(nowPage == null) {
			nowPage = "1";
		}
		
		if(selectSkill == null) {
			selectSkill = new String[1];
			selectSkill[0] = "ALL";
		}
		
		if(selectWork == null) {
			selectWork = new String[1];
			selectWork[0] = "ALL";
		}
		
		if(searchText == null) {
			searchText = "";
		}
		
		PagingVO pagingVO = new PagingVO();;
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//프로젝트 리스트 총합
		String listCnt = projectService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("10"));
		
		//리스트
		List<ProjectVO> list = projectService.list(pagingVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("projectList", list);
		map.put("paging", pagingVO);
		
		return map;
	}
}
