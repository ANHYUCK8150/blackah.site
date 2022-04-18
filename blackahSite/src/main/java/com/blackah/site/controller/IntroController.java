package com.blackah.site.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blackah.site.config.AlertClass;
import com.blackah.site.vo.MemberVO;

@Controller
public class IntroController {
	@RequestMapping("intro/resume.do")
	public String resume(HttpSession session, HttpServletResponse response) throws Exception {
		AlertClass alertClass = new AlertClass();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO != null) {
		}else {
			alertClass.alert(response, "로그인 해주세요", "/member/login.do");
		}
		
		return "Intro/Resume";
	}
	
	@RequestMapping("intro/introduce.do")
	public String introduce() {
		return "Intro/Introduce";
	}
}
