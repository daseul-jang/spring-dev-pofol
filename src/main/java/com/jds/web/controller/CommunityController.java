package com.jds.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userCommunity")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	private final String DIR_COMMU = "community";
	
	@RequestMapping("/freeBoard")
	public String freeBoardView() {
		return DIR_COMMU + "/freeBoard";
	}
	
	@RequestMapping("/qnaBoard")
	public String qnaBoardView() {
		return DIR_COMMU + "/qnaBoard";
	}
}
