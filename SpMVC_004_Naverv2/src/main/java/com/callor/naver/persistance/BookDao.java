package com.callor.naver.persistance;

import java.util.List;

import com.callor.naver.domain.BookVO;

public interface BookDao extends GenericDao<BookVO, String>{

	/*
	 * 데이터 조회 method를 구현할 때
	 * PK(findById)를 기준으로 조회하는 method는
	 * 		return type을 VO를 사용한다
	 * PK가 아닌 칼럼을 기준으로 조회를 할 때는
	 * 		데이터가 1개만 있을 것이라는 보장이 지금은 있더라도
	 * 		return type을 반드시 List<VO>를 사용해야 한다
	 */
	public List<BookVO> findByTitle(String title);
	public List<BookVO> findByAutor(String author);
	public List<BookVO> findByPublisher(String publisher);
	public List<BookVO> findByPrice(int price);

}
