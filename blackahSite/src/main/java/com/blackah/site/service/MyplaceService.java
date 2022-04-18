package com.blackah.site.service;

import java.util.List;

import com.blackah.site.vo.DevelopVO;
import com.blackah.site.vo.MyBookVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

public interface MyplaceService {

	int insertBook(MyBookVO myBookVO);

	int updateBook(MyBookVO myBookVO);

	List<MyBookVO> mybookList(String string);

	String developListCnt(PagingVO pagingVO);

	List<SkillVO> skillList();

	List<ProjectVO> developList(PagingVO pagingVO);

	DevelopVO GetDevelop(String diIdx);

	int deleteDevelop(String[] checkList);

	int insertDevelop(DevelopVO developVO);

	int updateDevelop(DevelopVO developVO);

}
