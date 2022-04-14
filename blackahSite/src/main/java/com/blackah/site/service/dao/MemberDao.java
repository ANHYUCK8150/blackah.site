package com.blackah.site.service.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.blackah.site.vo.MemberVO;

@Repository("MemberDao")
@Mapper
public interface MemberDao {

	int insertMember(MemberVO memberVO);

	MemberVO checkID(String mbID);

	Integer checkPhone(String mbPhone);

	Integer checkEmail(String mbEmail);

	int updateMember(MemberVO memberVO);

	int updatePW(MemberVO memberVO);

}
