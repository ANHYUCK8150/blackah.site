package com.blackah.site.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blackah.site.service.MyplaceService;
import com.blackah.site.service.dao.MyplaceDao;
import com.blackah.site.vo.DevelopVO;
import com.blackah.site.vo.MyBookVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

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

	@Override
	public String developListCnt(PagingVO pagingVO) {
		return myplaceDao.developListCnt(pagingVO);
	}

	@Override
	public List<SkillVO> skillList() {
		return myplaceDao.skillList();
	}

	@Override
	public List<ProjectVO> developList(PagingVO pagingVO) {
		return myplaceDao.developList(pagingVO);
	}

	@Override
	public DevelopVO GetDevelop(String diIdx) {
		return myplaceDao.GetDevelop(diIdx);
	}

	@Override
	public int deleteDevelop(String[] checkList) {
		return myplaceDao.deleteDevelop(checkList);
	}

	@Override
	public int insertDevelop(DevelopVO developVO) {
		return myplaceDao.insertDevelop(developVO);
	}

	@Override
	public int updateDevelop(DevelopVO developVO) {
		return myplaceDao.updateDevelop(developVO);
	}

}
