package org.petplanet.web.persistence.find;

import java.util.List;

import org.petplanet.web.domain.find.FindVO;
import org.petplanet.web.page.Pagination;

public interface FindDAO {
	List<FindVO> listFind(Pagination pagination);
	FindVO detailFind(int find_id);
	void updateFind(FindVO vo);
	void deleteFind(int find_id);
	void insertFind(FindVO vo);
	String fileInfo(int find_id);
	int getBoardListCnt();
}
