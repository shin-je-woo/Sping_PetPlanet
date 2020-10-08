package org.petplanet.web.service.find;

import java.util.List;

import org.petplanet.web.domain.find.FindVO;
import org.petplanet.web.page.Pagination;
import org.springframework.web.multipart.MultipartFile;

public interface FindService {
	List<FindVO> listFind(Pagination pagination);
	FindVO detailFind(int find_id);
	String fileInfo(int find_id);
	void updateFind(FindVO vo);
	void deleteFind(int find_id);
	void insertFind(MultipartFile mpf, FindVO vo, String lat, String lng, String address);
	int getBoardListCnt();
}
