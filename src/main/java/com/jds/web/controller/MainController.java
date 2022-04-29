package com.jds.web.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jds.web.service.PortfolioService;
import com.webjjang.util.PageObject;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	@Qualifier("PortfolioService")
	private PortfolioService pofolService;
	
	@RequestMapping("/main")
	public String main(@RequestParam(value = "sort", required = false, defaultValue = "new") String sort, Model model) {
		logger.info("MainController.main().sort : " + sort);
		
		String upperSort = "";
		
		if(sort.equals("new")) {
			upperSort = "최신순";
		} else if(sort.equals("best")) {
			upperSort = "인기순";
		}
		
		model.addAttribute("mainList", pofolService.mainList(sort));
		model.addAttribute("sort", upperSort);

		return "main";
	}

	// 권한 없는 페이지 접근 시
	@RequestMapping("/access-denied")
	public String access_denied() {
		logger.info("access_denied()");
		return "error/access-denied";
	}
}
