package com.blackah.site.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blackah.site.service.APIService;
import com.blackah.site.service.dao.APIDao;
import com.blackah.site.vo.HmCodeVO;

@Service("APIService")
public class APIServiceImpl implements APIService {
	@Resource(name="APIDao")
	private APIDao apiDao;

	@Override
	public int insert(HmCodeVO hmCode) {
		return apiDao.insert(hmCode);
	}

	@Override
	public List<HmCodeVO> list(HmCodeVO hmCode) {
		return apiDao.list(hmCode);
	}
}
