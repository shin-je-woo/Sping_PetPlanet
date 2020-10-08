package org.petplanet.web.persistence.find;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.petplanet.web.domain.find.FindVO;
import org.petplanet.web.page.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindDAOImpl implements FindDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<FindVO> listFind(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("find.findList", pagination);
	}

	@Override
	public FindVO detailFind(int find_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("find.detail_find", find_id);
	}

	@Override
	public void updateFind(FindVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("find.update", vo);
	}

	@Override
	public void deleteFind(int find_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertFind(FindVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("find.insert", vo);
	}

	@Override
	public String fileInfo(int find_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBoardListCnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("find.getBoardListCnt");
	}

}
