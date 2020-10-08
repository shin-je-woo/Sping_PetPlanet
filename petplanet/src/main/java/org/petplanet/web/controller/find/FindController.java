package org.petplanet.web.controller.find;

import org.petplanet.web.domain.find.FindVO;
import org.petplanet.web.page.Pagination;
import org.petplanet.web.service.find.FindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/find/*")
public class FindController {
	@Autowired
	FindService findService;

	@RequestMapping(value = {"example"})
	public String example() {
		return "find/find_example";
	}
	@RequestMapping(value = {"example2"})
	public String example_post() {
		System.out.println("example2호출");
		return "home";
	}

	@RequestMapping(value = {"write"}, method = RequestMethod.GET)
	public String write() {
		return "find/find_write";
	}

//	@RequestMapping(value = {"insert"})
//	public String insert(FindVO vo){
//		System.out.println("find/insert메쏘드 호출");
//		// 파일 업로드 처리
//		String fileName = "";
//		MultipartFile mpf = vo.getImage();
//		if (!mpf.isEmpty()){
//			String originalFileName = mpf.getOriginalFilename();
//			String ext = FilenameUtils.getExtension(originalFileName);
//
//			UUID uuid = UUID.randomUUID();
//			fileName = uuid + "." + ext;
//			try {
//				mpf.transferTo(new File(filePath + fileName));
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		vo.setImage_url(fileName);
//		findService.insertFind(vo);
//		return "redirect:/find/list";
//	}

	@RequestMapping(value = {"list"})
	public String list(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		// 전체 게시글 수
		int listCnt = findService.getBoardListCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", findService.listFind(pagination));
		
		return "find/find_list";
	}

	@RequestMapping(value = {"detail/{find_id}"})
	public String detail(@PathVariable("find_id") int find_id, Model model) {
		model.addAttribute("vo", findService.detailFind(find_id));
		model.addAttribute("lat", findService.detailFind(find_id).getMap_lat());
		model.addAttribute("lng", findService.detailFind(find_id).getMap_lng());
		return "find/find_detail";
	}

//	@RequestMapping(value="/example_ajax", method=RequestMethod.GET)
//	public String example_ajax(@RequestParam Map<String, Object> paramMap, Model model) {
//		return "find/find_example_ajax";
//	}
//	@RequestMapping(value="/write_example", method=RequestMethod.GET)
//	public String example_ajax() {
//		return "find/write_example";
//	}

	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST, consumes ={"multipart/form-data"}) 
	public boolean find_insert(@RequestParam("image") MultipartFile mpf, @ModelAttribute FindVO vo,
			@RequestParam("lat") String lat, @RequestParam("lng") String lng
			,@RequestParam("address") String address) {
		findService.insertFind(mpf, vo, lat, lng, address);
		return true;
	}
	
}
