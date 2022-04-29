package com.jds.web.service;

import java.util.HashMap;
import java.util.List;

import com.jds.web.portfolio.domain.PortfolioDTO;
import com.jds.web.portfolio.domain.StackDTO;
import com.webjjang.util.PageObject;

public interface PortfolioService {

	// stack 검색
	public List<StackDTO> selectStackByStackName(String searchValue);
	
	// 포트폴리오 등록
	public int insertPortfolio(PortfolioDTO pofolDTO);
	
	// 메인 포트폴리오 리스트
	// 최신순 or 인기순
	public List<PortfolioDTO> mainList(String sort);
		
	// 포트폴리오 목록
	public List<PortfolioDTO> portfolioList(HashMap<String, Object> map, PageObject pageObject);
	
	// 아이디 별 포트폴리오 목록 (나의 포트폴리오)
	public List<PortfolioDTO> myPofolList(HashMap<String, Object> map, PageObject pageObject);

	// 포트폴리오 내용 보기
	public PortfolioDTO pofolView(int pno);
}
