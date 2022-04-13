package com.blackah.site.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackah.site.service.BoardService;
import com.blackah.site.vo.BoardReplyVO;
import com.blackah.site.vo.BoardVO;
import com.blackah.site.vo.PagingVO;

@Controller
public class BoardController {
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("board/board.do")
	public String list(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="nowPage", required=false)String nowPage
		) {
		//변수 선언
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO();
		String searchOption = "";
		String searchText = "";
		
		pagingVO.setSearchOption(searchOption);
		pagingVO.setSearchText(searchText);
		pagingVO.setBoardOption(op);
		
		//게시판 총 개수
		String listCnt = boardService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("10"));
		
		//리스트
		List<BoardVO> list = boardService.list(pagingVO);
				
		if(op.equals("notice")) {
			//공지사항

		}else if(op.equals("qna")) {
			//질문과 답변

		}else {
			return "redirect:../error.do";
		}
		
		//모델
		model.addAttribute("title", op);
		model.addAttribute("BoradList", list);
		model.addAttribute("paging", pagingVO);
		model.addAttribute("ListCnt",listCnt);
		
		return "Board/list";
	}
	
	@RequestMapping("board/board_ajax.do")
	public String list_ajax(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="searchText", required=false)String searchText
			,@RequestParam(value="searchOption", required=false)String searchOption
		) {
		PagingVO pagingVO = new PagingVO();
		
		pagingVO.setSearchOption(searchOption);
		pagingVO.setSearchText(searchText);
		pagingVO.setBoardOption(op);
		
		//게시판 총 개수
		String listCnt = boardService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("10"));
		
		//리스트
		List<BoardVO> list = boardService.list(pagingVO);
				
		if(op.equals("notice")) {
			//공지사항

		}else if(op.equals("qna")) {
			//질문과 답변

		}else {
			return "redirect:../error.do";
		}
		
		//모델
		model.addAttribute("title", op);
		model.addAttribute("BoradList", list);
		model.addAttribute("paging", pagingVO);
		model.addAttribute("ListCnt",listCnt);
		
		return "/Board/ajax/list_ajax";
	}
	
	
	
	@RequestMapping("/board/reg.do")
	public String reg(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="option", required=false)String option
			,@RequestParam(value="qbIdx", required=false)String qbIdx
		) {
		
		if(qbIdx != null) {
			BoardVO listOne = boardService.listOne(qbIdx);
			model.addAttribute("ParentList",listOne);
		}
		//모델
		model.addAttribute("title",op);
		model.addAttribute("reply",option);
		return "Board/reg";
	}
	
	@RequestMapping("/board/view.do")
	public String view(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="qbIdx", required=false)String qbIdx
		) {
		
		//부모 요소 데이터 조회
		BoardVO listOne = boardService.listOne(qbIdx);
		
		//자식 요소 데이터 조회
		List<BoardReplyVO> childList = boardService.childList(qbIdx);
		
		//모델
		model.addAttribute("title",op);
		model.addAttribute("ParentList",listOne);
		model.addAttribute("ChildList",childList);
		return "Board/view";
	}
	
	@RequestMapping("/board/modify.do")
	public String modify(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="option", required=false)String option
			,@RequestParam Map<String,Object> params
		) {
		
		params.put("qbOption", op);
		params.put("replyOption", option);
		
		int queryChk = 0;
		if(params.get("qbIdx").equals("")) {
			//등록
			queryChk = boardService.insert(params);
		}else {
			//수정
			queryChk = boardService.update(params);
		}
		
		return "redirect:board.do?op="+op;
	}
	
	@RequestMapping("board/board_PWchk.do")
	@ResponseBody
	public String board_PWchk(@RequestParam(value="qbIdx", required=false)String qbIdx,@RequestParam(value="qbPW", required=false)String qbPW) {
		String result = "FIND";
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("qbIdx", qbIdx);
		map.put("qbPW", qbPW);
		
		String chk = boardService.boardPWchk(map);

		if(chk.equals("0")) {
			result = "ERROR";
		}
		
		return result;
	}
}
