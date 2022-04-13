package com.blackah.site.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blackah.site.service.ProjectService;
import com.blackah.site.service.dao.ProjectDao;
import com.blackah.site.vo.PagingVO;
import com.blackah.site.vo.ProjectVO;
import com.blackah.site.vo.SkillVO;

@Service("ProService")
public class ProjectServiceImpl implements ProjectService {
	@Resource(name = "ProDao")
	private ProjectDao ProDao;

	@Override
	public List<SkillVO> skillList() {
		return ProDao.skillList();
	}

	@Override
	public String listCnt(PagingVO pagingVO) {
		return ProDao.listCnt(pagingVO);
	}

	@Override
	public List<ProjectVO> list(PagingVO pagingVO) {
		return ProDao.list(pagingVO);
	}

	@Override
	public int insert(ProjectVO projectVO) {
		return ProDao.insert(projectVO);
	}

	@Override
	public int update(ProjectVO projectVO) {
		return ProDao.update(projectVO);
	}

	@Override
	public ProjectVO GetProject(String pbIdx) {
		return ProDao.GetProject(pbIdx);
	}

	@Override
	public int delete(String[] checkList) {
		return ProDao.delete(checkList);
	}
}
