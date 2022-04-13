package com.blackah.site.config;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionHadlingController implements ErrorController{

	@RequestMapping(value = "/error")
	public String handleError(HttpServletRequest request, Model model) {
		return "Home/error/error/error";
	}
	

}
