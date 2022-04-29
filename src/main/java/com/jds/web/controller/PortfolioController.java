package com.jds.web.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jds.web.portfolio.domain.FileDTO;
import com.jds.web.portfolio.domain.PortfolioDTO;
import com.jds.web.portfolio.domain.StackDTO;
import com.jds.web.service.PortfolioService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.webjjang.util.PageObject;


@Controller
@RequestMapping("/portfolio")
public class PortfolioController {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	private final String DIR_POFOL = "portfolio";
	private final String DIR_MY_POFOL = "/my_pofol";
	private final String DIR_USER_POFOL = "/user_pofol";
	
	@Autowired
	@Qualifier("PortfolioService")
	private PortfolioService service;
	
	@RequestMapping("/{m_id}")
	public String myPofolView(@PathVariable String m_id, HashMap<String, Object> map, PageObject pageObject, Model model, PortfolioDTO pofolDTO) {
		logger.info("myPofolView().pofolDTO.getM_id() : " + pofolDTO.getM_id());
		
		map.put("pofolDTO", pofolDTO);
		
		logger.info("myPofolView().map.pageObject : " + map.get("pageObject"));
		logger.info("myPofolView().map.pofolDTO : " + map.get("pofolDTO"));
		logger.info("myPofolView().map : " + map);
		
		model.addAttribute("myPofolList", service.myPofolList(map, pageObject));
		model.addAttribute("pageObject", map.get("pageObject"));
		
		return DIR_POFOL + DIR_MY_POFOL + "/myPofolInfo-view";
	}
	
	// 글쓰기 관련 ========================================================================================
	@RequestMapping("/write")
	public String writeView() {
		return DIR_POFOL + "/write/write-view";
	}
	
	/*
	 * @GetMapping("/wirte/returnSkillChk")
	 * 
	 * @ResponseBody public String returnSkillChk(@RequestParam List<String>
	 * skillChkList, Model model) { model.addAttribute("chkSkillList",
	 * skillChkList); return "redirect:/portfolio/write"; }
	 */
	/*
	// 스택 검색 부분
	@PostMapping("/write/stackSearch")
	@ResponseBody
	public HashMap<String, Object> searchStack(@RequestParam("searchValue") String searchValue) {
		logger.info("searchStack().param: " + searchValue);
		
		List<StackDTO> stackList = service.selectStackByStackName(searchValue);
		
		logger.info(stackList.toString());
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();
		String msg = "";
		boolean check = false;
		
		if(!stackList.isEmpty()) {
			
			msg = "성공";
			check = true;
			
			searchResult.put("msg", msg);
			searchResult.put("check", check);
			searchResult.put("stackList", stackList);
			
			return searchResult;
		} else {
			msg = "실패";
			check = false;
			
			searchResult.put("msg", msg);
			searchResult.put("check", check);
			
			return searchResult;
		}
		
	}*/
	
	@RequestMapping("/write/upload/thumbnail")
	@ResponseBody
	public FileDTO uploadThumbnail(HttpServletRequest request) {
		logger.info("uploadThumbnail()");
		
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/portfolio/upload");
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "UTF-8";
		
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		FileDTO fileDTO = new FileDTO();
		
		File file = new File(saveDirectory);
		
		if(request.getParameterNames() != null) {
			logger.info("uploadThumbnail().request 체크");
			if(!file.isDirectory()) {
				file.mkdirs();
			}
			
			try {
				MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
				
				Enumeration<String> names = multi.getFileNames();
				
				String fileSysName = null;
				
				while(names.hasMoreElements()) {
					String name = names.nextElement();
					fileSysName = multi.getFilesystemName(name);
				}
				
				fileDTO.setFile_name(fileSysName);
				fileDTO.setFile_path(saveDirectory);
				fileDTO.setFileChk(true);
				
				logger.info("uploadThumbnail().file_name: " + fileDTO.getFile_name());
				logger.info("uploadThumbnail().file_path: " + fileDTO.getFile_path());
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return fileDTO;
		} else {
			fileDTO.setFileChk(false);
			return fileDTO;
		}
		
	}
	
	@PostMapping("/write/complete")
	@ResponseBody
	public String writeComplete(PortfolioDTO pofolDTO) {
		logger.info("writeComplete()");
		logger.info("writeComplete().pofolDTO: " + pofolDTO.toString());
		
		int result = service.insertPortfolio(pofolDTO);
		
		if(result == 1) {
			return "Success";
		}
		
		return "Fail";
	}
	
	// =================================================================================================

	// 게시글 리스트 ======================================================================================
	@RequestMapping("/userPofolList")
	public String userPofolList(HashMap<String, Object> map, PageObject pageObject, Model model, @RequestParam(value = "sort", required = false, defaultValue = "new") String sort) {
		logger.info("userPofolList()");
		logger.info("userPofolList().PageObject.getWord(): " + pageObject.getWord());
		
		map.put("sort", sort);
		
		logger.info("userPofolList().map.getSort : " + map.get("sort"));
		
		pageObject.setPerPageNum(12);
		
		model.addAttribute("pofolList", service.portfolioList(map, pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return DIR_POFOL + DIR_USER_POFOL + "/userPofolList-view";
	}
	
	// 게시글 보기 ========================================================================================
	@RequestMapping("/{m_id}/view/{p_no}")
	public String myPofolView(@PathVariable int p_no, @PathVariable String m_id , Model model) {
		logger.info("userPofolView().p_no: " + p_no);
		
		model.addAttribute("pofolDTO", service.pofolView(p_no));
		
		return DIR_POFOL + "/portfolio-view";
	}
	
	@RequestMapping("/userPofol/view/{p_no}")
	public String userPofolView(@PathVariable int p_no, Model model) {
		logger.info("userPofolView().p_no: " + p_no);
		
		model.addAttribute("pofolDTO", service.pofolView(p_no));
		
		return DIR_POFOL + "/portfolio-view";
	}
}
