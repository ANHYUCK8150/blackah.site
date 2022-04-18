package com.blackah.site.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.MyBookVO;

@Repository("myplaceDao")
@Mapper
public interface MyplaceDao {

	int insertBook(MyBookVO myBookVO);

	int updateBook(MyBookVO myBookVO);

	List<MyBookVO> mybookList(String brIdx);

}
