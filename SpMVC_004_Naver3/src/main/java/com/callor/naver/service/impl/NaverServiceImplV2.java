package com.callor.naver.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.callor.naver.config.NaverConfig;
import com.callor.naver.config.QualifierConfig;
import com.callor.naver.domain.BookVO;
import com.callor.naver.domain.MovieVO;
import com.callor.naver.domain.NaverParent;
import com.callor.naver.domain.NewsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.Naver_V2)
public class NaverServiceImplV2 extends NaverServiceImpl {


	@Override
	public List<Object> getNaver(String queryString) {
		URI restURI = null;
		try {
			restURI = new URI(queryString);
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			log.debug("URI 문법오류");
			return null;
		}
		// Http 프로토콜에 보안정보를 세팅하여
		// Naver로 전송할 준비
		HttpHeaders headers = new HttpHeaders();
		headers.set(NaverConfig.HEADER.ID, NaverConfig.NAVER_CLIENT_ID);
		headers.set(NaverConfig.HEADER.SEC, NaverConfig.NAVER_CLIENT_SEC);
		// JSON 데이터 타입으로 받겠다
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		// headers에 추가된 정보를 Entity type의 객체로 변환하기
		HttpEntity<String> entity = new HttpEntity<String>("parameter", headers);

		/*
		 * NaverParent는 List<VO> 타입의 items 변수를 갖는데 여기에서 VO type을 BookVO로 확정지어 준다
		 */
		RestTemplate restTemp = new RestTemplate();

		if (cat.equals("BOOK")) {
			ResponseEntity<NaverParent<BookVO>> resData = null;
			resData = restTemp.exchange(restURI, HttpMethod.GET, entity,
					new ParameterizedTypeReference<NaverParent<BookVO>>() {
					});
			return resData.getBody().items;
		} else if (cat.equals("NEWS")) {
			ResponseEntity<NaverParent<NewsVO>> resData = null;
			resData = restTemp.exchange(restURI, HttpMethod.GET, entity,
					new ParameterizedTypeReference<NaverParent<NewsVO>>() {
					});
			return resData.getBody().items;
		} else if (cat.equals("MOVIE")) {
			ResponseEntity<NaverParent<MovieVO>> resData = null;
			resData = restTemp.exchange(restURI, HttpMethod.GET, entity,
					new ParameterizedTypeReference<NaverParent<MovieVO>>() {
					});
			return resData.getBody().items;
		}

		// Naver에서 받은 데이터는 resData의 body에 담겨있다
		// body 데이터를 get하여 그 데이터 중에서 items만 추출하여
		// Controller로 return
		return null;
	}

}
