package com.blackah.site.service;

import com.blackah.site.vo.MemberVO;

public interface MemberService {

	int insertMember(MemberVO memberVO);

	MemberVO checkID(String mbID);

	Integer checkPhone(String mbPhone);

	Integer checkEmail(String mbEmail);

	int updateMember(MemberVO memberVO);

	int updatePW(MemberVO memberVO);

}
