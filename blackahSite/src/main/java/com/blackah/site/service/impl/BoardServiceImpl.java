package com.blackah.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blackah.site.service.BoardService;
import com.blackah.site.service.dao.BoardDao;
import com.blackah.site.vo.BoardReplyVO;
import com.blackah.site.vo.BoardVO;
import com.blackah.site.vo.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDao")
	private BoardDao boardDao;

	@Override
	public String listCnt(PagingVO pagingVO) {
		return boardDao.listCnt(pagingVO);
	}

	@Override
	public List<BoardVO> list(PagingVO pagingVO) {
		return boardDao.list(pagingVO);
	}

	@Override
	public int insert(Map<String,Object> params) {
		return boardDao.insert(params);
	}

	@Override
	public BoardVO listOne(String qbIdx) {
		return boardDao.listOne(qbIdx);
	}

	@Override
	public List<BoardReplyVO> childList(String qbIdx) {
		return boardDao.childList(qbIdx);
	}

	@Override
	public String boardPWchk(Map<String, Object> map) {
		return boardDao.boardPWchk(map);
	}

	@Override
	public int update(Map<String, Object> params) {
		return boardDao.update(params);
	}

}
