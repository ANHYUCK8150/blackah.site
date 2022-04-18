package com.blackah.site.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.DevelopVO;
import com.blackah.site.vo.MyBookVO;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

@Repository("myplaceDao")
@Mapper
public interface MyplaceDao {

	int insertBook(MyBookVO myBookVO);

	int updateBook(MyBookVO myBookVO);

	List<MyBookVO> mybookList(String brIdx);

	String developListCnt(PagingVO pagingVO);

	List<SkillVO> skillList();

	List<ProjectVO> developList(PagingVO pagingVO);

	DevelopVO GetDevelop(String diIdx);

	int deleteDevelop(String[] checkList);

	int insertDevelop(DevelopVO developVO);

	int updateDevelop(DevelopVO developVO);

}
