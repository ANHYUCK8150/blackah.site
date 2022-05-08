package com.blackah.site.api;

import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blackah.site.service.MemberService;
import com.blackah.site.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {
	private final MemberService memberService;
	private final PasswordEncoder encoder;
	
	@PostMapping("/login")
	public MemberVO login(@RequestParam Map<String, Object> map) {
		
		MemberVO memberVO = memberService.checkID(map.get("username").toString());
		
		if(memberVO != null) {
			if(encoder.matches(map.get("password").toString(), memberVO.getMbPW().toString())) {
				return memberVO;
			}else {
				return null;
			}
		}else {
			return null;
		}
		
	}
	
	@PostMapping("/register")
	public String register(@RequestParam Map<String, Object> map) {
		String msg = "";
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMbID(map.get("username").toString());
		memberVO.setMbPW(map.get("password").toString());
		memberVO.setMbNM(map.get("username").toString());
		memberVO.setMbPhone("010-0000-0000");
		memberVO.setMbEmail("tset@email.com");
		
		int chk = memberService.insertMember(memberVO);
		
		if(chk > 0) {
			msg = "회원가입 완료";
		}else {
			msg = "실패";
		}
		
		return msg;
	}
}
