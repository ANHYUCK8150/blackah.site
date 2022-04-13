package com.blackah.site.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.HmCodeVO;

@Repository("APIDao")
@Mapper
public interface APIDao {

	int insert(HmCodeVO hmCode);

	List<HmCodeVO> list(HmCodeVO hmCode);

}
