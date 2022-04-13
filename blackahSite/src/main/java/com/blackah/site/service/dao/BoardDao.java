package com.blackah.site.service.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.BoardReplyVO;
import com.blackah.site.vo.BoardVO;
import com.blackah.site.vo.PagingVO;

@Repository("boardDao")
@Mapper
public interface BoardDao {
	String listCnt(PagingVO pagingVO);

	List<BoardVO> list(PagingVO pagingVO);

	int insert(Map<String, Object> params);

	BoardVO listOne(String qbIdx);

	List<BoardReplyVO> childList(String qbIdx);

	String boardPWchk(Map<String, Object> map);

	int update(Map<String, Object> params);
}
