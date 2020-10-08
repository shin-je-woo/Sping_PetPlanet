package org.petplanet.web.service.member;

import javax.servlet.http.HttpSession;

import org.petplanet.web.domain.member.MemberVO;
import org.petplanet.web.persistence.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired	// 스프링 컨테이너가 만든 dao객체 의존관계 주입
	private MemberDAO memberDAO;

	@Override
	public void addMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.add(vo);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public String loginCheck(MemberVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		String username = memberDAO.loginCheck(vo);
		// 로그인정보 맞으면
		if(username != null) {
			// 세션변수 등록
			session.setAttribute("userid", vo.getUserid());
			session.setAttribute("username", username);
		}
		return username;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

}
