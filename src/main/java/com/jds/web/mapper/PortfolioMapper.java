package com.jds.web.mapper;

import java.util.HashMap;
import java.util.List;

import com.jds.web.portfolio.domain.PortfolioDTO;
import com.jds.web.portfolio.domain.StackDTO;
import com.webjjang.util.PageObject;

public interface PortfolioMapper {
	
	// stack 검색
	public List<StackDTO> selectStackByStackName(String searchValue);
	
	// 포트폴리오 등록
	public int insertPortfolio(PortfolioDTO pofolDTO);
	
	// 메인 포트폴리오 리스트
	// 최신순
	public List<PortfolioDTO> newMainList();
	
	// 인기순
	public List<PortfolioDTO> bestMainList();
	
	// 포트폴리오 전체 데이터 수
	public int getPofolListCnt(HashMap<String, Object> map);
	
	// 포트폴리오 목록
	public List<PortfolioDTO> portfolioList(HashMap<String, Object> map);
	
	// 아이디 별 포트폴리오 목록 (나의 포트폴리오)
	public List<PortfolioDTO> myPofolList(HashMap<String, Object> map);
	
	// 포트폴리오 내용 보기
	public PortfolioDTO pofolView(int pno);
}
