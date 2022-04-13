package com.blackah.site.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blackah.site.service.BoardService;
import com.blackah.site.service.ProjectService;
import com.blackah.site.vo.BoardVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;

@Controller
public class HomeController {
	@Resource(name="ProService")
	private ProjectService proService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String root() {
		
		return "redirect:/";
	}
	
	@RequestMapping("/")
	public String home(Model model) {
		
		PagingVO pagingVO = new PagingVO();
		String[] selectSkill = {"ALL"};
		String[] selectWork = {"ALL"};
		String searchText = "";
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//프로젝트 리스트 총합
		//String listCnt = proService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt("99"), Integer.parseInt("1"), Integer.parseInt("99"));
		
		//리스트
		List<ProjectVO> list = proService.list(pagingVO);
		
		//model
		model.addAttribute("projectList", list);
		
		pagingVO.setBoardOption("notice");
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt("99"), Integer.parseInt("1"), Integer.parseInt("6"));
		
		//리스트
		List<BoardVO> boardlist = boardService.list(pagingVO);
		model.addAttribute("BoradList", boardlist);
		
		return "index";
	}
	
}
