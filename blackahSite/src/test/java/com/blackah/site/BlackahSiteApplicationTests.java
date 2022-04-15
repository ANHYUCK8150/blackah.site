package com.blackah.site;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.blackah.site.service.impl.NaverBookService;

@SpringBootTest
class BlackahSiteApplicationTests {
	@Resource(name="BookAPI")
	private NaverBookService bookService;
	
	@Test
	void contextLoads() {
	}
	
	@Test
	public void bookList() {
		//System.out.println(bookService.searchBook("java",10,1));
	}
	

}
