package com.blackah.site.api;

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
	public MemberVO login(@RequestParam String username, @RequestParam String password) {
		
		MemberVO memberVO = memberService.checkID(username);
		
		if(memberVO != null) {
			if(encoder.matches(password, memberVO.getMbPW().toString())) {
				return memberVO;
			}else {
				return null;
			}
		}else {
			return null;
		}
		
	}
}
