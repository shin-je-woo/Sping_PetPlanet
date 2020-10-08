package org.petplanet.web.persistence.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.petplanet.web.domain.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO read(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.addMember", vo);
	}

	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public String loginCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.login_check", vo);
	}

	@Override
	public void getKey(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("member.get_key", vo);
	}

	@Override
	public void alterEmailCheck(Map<String, String> paramters) {
		// TODO Auto-generated method stub
		sqlSession.update("member.alter_email_check", paramters);
	}

}
