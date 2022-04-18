package com.blackah.site.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blackah.site.service.MyplaceService;
import com.blackah.site.service.dao.MyplaceDao;
import com.blackah.site.vo.MyBookVO;

@Service("myplaceService")
public class MyplaceServiceImpl implements MyplaceService {
	@Resource(name = "myplaceDao")
	private MyplaceDao myplaceDao;

	@Override
	public int insertBook(MyBookVO myBookVO) {
		return myplaceDao.insertBook(myBookVO);
	}

	@Override
	public int updateBook(MyBookVO myBookVO) {
		return myplaceDao.updateBook(myBookVO);
	}

	@Override
	public List<MyBookVO> mybookList(String brIdx) {
		return myplaceDao.mybookList(brIdx);
	}

}
