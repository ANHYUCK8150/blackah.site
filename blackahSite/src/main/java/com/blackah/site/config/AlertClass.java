package com.blackah.site.config;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertClass{
	public AlertClass() {
		
	}
	
	public void alert(HttpServletResponse response, String msg, String link) throws Exception{
		String op = "";
		
		if(link.equals("back")) {
			op = "history.go(-1)";
		}else if(link.equals("close")) {
			op = "window.close()";
		}
		else {
			op = "location.href='"+link+"'";
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('" + msg + ".');" + op + ";</script>");
		out.flush();
	}
}
