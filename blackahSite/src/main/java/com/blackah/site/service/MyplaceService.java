package com.blackah.site.service;

import java.util.List;

import com.blackah.site.vo.MyBookVO;

public interface MyplaceService {

	int insertBook(MyBookVO myBookVO);

	int updateBook(MyBookVO myBookVO);

	List<MyBookVO> mybookList(String string);

}
