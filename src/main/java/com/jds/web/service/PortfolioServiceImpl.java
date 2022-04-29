package com.jds.web.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jds.web.mapper.PortfolioMapper;
import com.jds.web.portfolio.domain.PortfolioDTO;
import com.jds.web.portfolio.domain.StackDTO;
import com.webjjang.util.PageObject;

@Service("PortfolioService")
public class PortfolioServiceImpl implements PortfolioService {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioServiceImpl.class);

	@Autowired
	private PortfolioMapper pofolMapper;

	@Override
	public List<StackDTO> selectStackByStackName(String searchValue) {
		return pofolMapper.selectStackByStackName(searchValue);
	}

	@Override
	public int insertPortfolio(PortfolioDTO pofolDTO) {
		return pofolMapper.insertPortfolio(pofolDTO);
	}

	@Override
	public List<PortfolioDTO> portfolioList(HashMap<String, Object> map, PageObject pageObject) {
		logger.info("portfolioList()");
		
		HashMap<String, Object> pageObjMap = new HashMap<String, Object>();
		pageObjMap.put("pageObject", pageObject);
		
		pageObject.setTotalRow(pofolMapper.getPofolListCnt(pageObjMap));
		
		map.put("pageObject", pageObject);
		
		return pofolMapper.portfolioList(map);
	}

	@Override
	public List<PortfolioDTO> myPofolList(HashMap<String, Object> map, PageObject pageObject) {
		logger.info("myPofolList()");
		
		HashMap<String, Object> pageObjMap = new HashMap<String, Object>();
		pageObjMap.put("pageObject", pageObject);
		
		pageObject.setTotalRow(pofolMapper.getPofolListCnt(pageObjMap));
		
		map.put("pageObject", pageObject);
		logger.info("myPofolList().getTotalRow() : " + pageObject.getTotalRow());
		
		return pofolMapper.myPofolList(map);
	}

	@Override
	public PortfolioDTO pofolView(int pno) {
		return pofolMapper.pofolView(pno);
	}

	@Override
	public List<PortfolioDTO> mainList(String sort) {
		logger.info("mainList().sort: " + sort);
		
		if(sort.equals("new")) {
			return pofolMapper.newMainList();
		} else {
			return pofolMapper.bestMainList();
		}
	}

}
