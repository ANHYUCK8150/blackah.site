package com.blackah.site;

import javax.servlet.http.HttpServletRequest;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class BlackahSiteApplicationTests {
	
	@Test
	void contextLoads() {
	}
	
	@Test
	public void bookList(HttpServletRequest request) {
		//System.out.println(bookService.searchBook("java",10,1));
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		System.out.println(root_path);
	}
	

}
