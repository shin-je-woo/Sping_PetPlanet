package org.petplanet.web.service.find;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.petplanet.web.domain.find.FindVO;
import org.petplanet.web.page.Pagination;
import org.petplanet.web.persistence.find.FindDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FindServiceImpl implements FindService {
	
	private static String filePath = "C:\\petplanetupload\\";
	
	@Autowired
	FindDAO findDAO;

	@Override
	public List<FindVO> listFind(Pagination pagination) {
		// TODO Auto-generated method stub
		return findDAO.listFind(pagination);
	}

	@Override
	public FindVO detailFind(int find_id) {
		// TODO Auto-generated method stub
		return findDAO.detailFind(find_id);
	}

	@Override
	public String fileInfo(int find_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateFind(FindVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFind(int find_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFind(MultipartFile mpf, FindVO vo, String lat, String lng, String address) {
		// TODO Auto-generated method stub
		System.out.println("find/insert메쏘드 호출");
		System.out.println(vo.getTitle());
		System.out.println(vo.getAnimaltype());
		System.out.println(vo.getGender());
		System.out.println(vo.getPhone());
		System.out.println(vo.getLost_date());
		System.out.println(vo.getLost_description()); 
		System.out.println(lat);
		System.out.println(lng);
		System.out.println(address);
		// 파일 업로드 처리
		String fileName = "";
		if (!mpf.isEmpty()){
			String originalFileName = mpf.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);

			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			try {
				mpf.transferTo(new File(filePath + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		vo.setImage_url(fileName);
		vo.setMap_lat(lat);
		vo.setMap_lng(lng);
		vo.setMap_address(address);
		findDAO.insertFind(vo);
	}

	@Override
	public int getBoardListCnt() {
		// TODO Auto-generated method stub
		return findDAO.getBoardListCnt();
	}
	
}
