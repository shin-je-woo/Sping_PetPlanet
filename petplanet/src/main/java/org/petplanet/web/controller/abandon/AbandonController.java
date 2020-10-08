package org.petplanet.web.controller.abandon;

import org.petplanet.web.page.Pagination;
import org.petplanet.web.service.abandon.AbandonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/abandon/*")
public class AbandonController {
	@Autowired
	AbandonService abandonService;

	@RequestMapping(value = {"list"})
	public String list(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		// 전체 게시글 수
		int listCnt = 6000;
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", abandonService.listAbandon(pagination));

		return "abandon/abandon_list";
	}
	
	@RequestMapping(value = {"detail"})
	public String detail(Model model) {
		
		return "abandon/abandon_detail";
	}


}
