package com.blackah.site.service;

import java.util.List;

import com.blackah.site.vo.HmCodeVO;

public interface APIService {

	int insert(HmCodeVO hmCode);

	List<HmCodeVO> list(HmCodeVO hmCode);

}
