package org.petplanet.web.service.member;

import javax.servlet.http.HttpSession;

import org.petplanet.web.domain.member.MemberVO;

public interface MemberService {
	public void addMember(MemberVO vo);
	public MemberVO readMember(String userid);
	public void deleteMember(String userid);
	public void updateMember(MemberVO vo);
	public String loginCheck(MemberVO vo, HttpSession session);
	public void logout(HttpSession session);
}
