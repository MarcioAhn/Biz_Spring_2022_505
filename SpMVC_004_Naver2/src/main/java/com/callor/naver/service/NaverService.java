package com.callor.naver.service;

import java.util.List;

import com.callor.naver.domain.BookVO;

public interface NaverService {

	public String queryString(String cat, String search);
	public List<Object> getNaver(String queryString);
	
	
}
