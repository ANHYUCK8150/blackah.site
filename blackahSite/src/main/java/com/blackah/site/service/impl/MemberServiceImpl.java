package com.blackah.site.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.blackah.site.service.MemberService;
import com.blackah.site.service.dao.MemberDao;
import com.blackah.site.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="MemberDao")
	private MemberDao memberDao;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public int insertMember(MemberVO memberVO) {
		//비밀번호 암호화
		String encodePW = encoder.encode(memberVO.getMbPW());
		memberVO.setMbPW(encodePW);
		return memberDao.insertMember(memberVO);
	}

	@Override
	public MemberVO checkID(String mbID) {
		return memberDao.checkID(mbID);
	}

	@Override
	public Integer checkPhone(String mbPhone) {
		return memberDao.checkPhone(mbPhone);
	}

	@Override
	public Integer checkEmail(String mbEmail) {
		return memberDao.checkEmail(mbEmail);
	}

	@Override
	public int updateMember(MemberVO memberVO) {
		return memberDao.updateMember(memberVO);
	}

	@Override
	public int updatePW(MemberVO memberVO) {
		return memberDao.updatePW(memberVO);
	}
}
