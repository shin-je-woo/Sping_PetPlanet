package org.petplanet.web.persistence.member;

import java.util.Map;

import org.petplanet.web.domain.member.MemberVO;

public interface MemberDAO {
	public MemberVO read(String userid);
	public void add(MemberVO vo);
	public void update(MemberVO vo);
	public void delete(String userid);
	public String loginCheck(MemberVO vo);
	public void getKey(MemberVO vo);
	public void alterEmailCheck(Map<String, String> paramters);
}
