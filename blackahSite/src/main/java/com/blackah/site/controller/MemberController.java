package com.blackah.site.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackah.site.config.AlertClass;
import com.blackah.site.service.MemberService;
import com.blackah.site.vo.MemberVO;

@Controller
public class MemberController {
	AlertClass alertClass = new AlertClass();
	@Resource(name="MemberService")
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("member/login.do")
	public String LoginForm() {
		return "Member/Login";
	}
	
	@RequestMapping("member/confirm.do")
	public String ConfirmForm() {
		return "Member/Confirm";
	}
	
	//회원가입
	@PostMapping("member/reg.do")
	public String reg(MemberVO memberVO, HttpServletResponse response) throws Exception {
		int result = memberService.insertMember(memberVO);
		
		if(result > 0) {
			alertClass.alert(response, "회원가입이 완료!!\n 환영합니다.", "login.do");
		}else {
			alertClass.alert(response, "회원가입이 실패 하였습니다.", "back");
		}
		
		return "Member/Login";
	}
	
	//로그인
	@PostMapping("/Login_OK.do")
	public String Login_OK(@RequestParam String mbID, @RequestParam String mbPW
			,HttpServletRequest request, HttpServletResponse response
			,HttpSession session
		) throws Exception {
		String url = "Member/Login";
		
		MemberVO memberVO = memberService.checkID(mbID);
		
		if(memberVO != null) {
			if(encoder.matches(mbPW, memberVO.getMbPW().toString())) {
				session.setAttribute("memberInfo", memberVO);
				url = "redirect:/";
			}else {
				alertClass.alert(response, "비밀번호가 틀립니다.", "back");
			}
		}else {
			alertClass.alert(response, "해당 아이디는 없습니다.", "back");
		}
		
		return url;
	}
	
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session, HttpServletResponse response) throws Exception {
		
		session.invalidate();
		
		alertClass.alert(response, "로그아웃 되었습니다.", "/");
		
		return "index";
	}
	
	@PostMapping("member/id_check.do")
	@ResponseBody
	public String id_check(@RequestParam String mbID) {
		String result = "FIND";
		
		MemberVO memberVO = memberService.checkID(mbID);
		
		if(memberVO==null) {
			result = "TRUE";
		}
		
		return result;
	}
	
	@PostMapping("member/phone_check.do")
	@ResponseBody
	public String phone_check(@RequestParam String mbPhone) {
		String result = "FIND";
		
		Integer Cnt = memberService.checkPhone(mbPhone);
		
		if(Cnt==0) {
			result = "TRUE";
		}
		
		return result;
	}
	
	@PostMapping("member/email_check.do")
	@ResponseBody
	public String email_check(@RequestParam String mbEmail) {
		String result = "FIND";
		
		Integer Cnt = memberService.checkEmail(mbEmail);
		
		if(Cnt==0) {
			result = "TRUE";
		}
		
		return result;
	}
	
	
	//마이페이지
	@RequestMapping("member/mypage.do")
	public String mypage(HttpSession session, HttpServletResponse response, Model model) throws Exception {
		String url = "Member/Mypage";
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO != null) {
		}else {
			alertClass.alert(response, "로그인 해주세요", "login.do");
		}
		
		return url;
	}
	
	@PostMapping("member/modify.do")
	public String modify(MemberVO memberVO, HttpServletResponse response,HttpSession session) throws Exception{
		String url = "Member/Mypage";
		
		int queryChk = memberService.updateMember(memberVO);
		
		if(queryChk > 0) {
			MemberVO memberInfo = memberService.checkID(memberVO.getMbID());
			session.setAttribute("memberInfo", memberInfo);
			
			alertClass.alert(response, "변경 완료되었습니다.", "mypage.do");
		}else {
			alertClass.alert(response, "변경 실패하였습니다.", "back");
		}
		
		return url;
	}
	
	@RequestMapping("member/pwModify.do")
	public String pwModifyForm() {
		return "Home/pop/pop/PasswordModify";
	}
	
	@PostMapping("member/modify_pw.do")
	public void modify_pw(@RequestParam String mbPW, @RequestParam String modifyPW, HttpSession session,HttpServletResponse respons) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		String mbID = memberInfo.getMbID();
		
		MemberVO memberVO = memberService.checkID(mbID);
		
		if(encoder.matches(mbPW, memberVO.getMbPW())) {
			memberVO.setMbPW(encoder.encode(modifyPW));
			int queryChk = memberService.updatePW(memberVO);
			
			if(queryChk > 0) {
				alertClass.alert(respons, "비밀번호 변경 성공!", "close");
			}else {
				alertClass.alert(respons, "비밀번호 변경 실패!", "back");
			}
		}else {
			alertClass.alert(respons, "기존 비밀번호가 다릅니다.", "back");
		}
	}
	
	
}
