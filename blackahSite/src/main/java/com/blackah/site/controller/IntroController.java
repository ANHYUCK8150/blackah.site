package com.blackah.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	@RequestMapping("intro/resume.do")
	public String resume() {
		return "Intro/Resume";
	}
	
	@RequestMapping("intro/introduce.do")
	public String introduce() {
		return "Intro/Introduce";
	}
}
