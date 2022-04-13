package com.blackah.site.service;

import java.util.List;

import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

public interface ProjectService {
	List<SkillVO> skillList();

	String listCnt(PagingVO pagingVO);

	List<ProjectVO> list(PagingVO pagingVO);

	int insert(ProjectVO projectVO);

	int update(ProjectVO projectVO);

	ProjectVO GetProject(String pbIdx);

	int delete(String[] checkList);
}
