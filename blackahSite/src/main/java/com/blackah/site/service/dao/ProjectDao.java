package com.blackah.site.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

@Repository("ProDao")
@Mapper
public interface ProjectDao {
	List<SkillVO> skillList();

	String listCnt(PagingVO pagingVO);

	List<ProjectVO> list(PagingVO pagingVO);

	int insert(ProjectVO projectVO);

	int update(ProjectVO projectVO);

	ProjectVO GetProject(String pbIdx);

	int delete(String[] checkList);
}
