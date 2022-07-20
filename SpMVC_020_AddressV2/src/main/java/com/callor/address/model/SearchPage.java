package com.callor.address.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * pagination 구현하기
 * 
 * 전체 데이터 갯수
 * 현재 페이지에 보여질 리스트 갯수
 * 페이지 하단에 보여질 페이지 번호 갯수
 * 
 * 보여지는 페이지의 첫 번호
 * 보여지는 페이지의 끝 번호
 * 
 * 처음 페이지
 * 마지막 페이지
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class SearchPage {

	private String a_name;
	private long totalCount; // 전체 데이터 갯수
	private long limit; // 한페이지의 갯수
	private long offset; // 첫페이지 번호
	
	private long listPerPage; // 한페이지에 보여질 데이터 갯수
	private long pageNoCount; // 하단에 보여질 페이지 번호 갯수
	
	private long firstPageNo; // 전체데이터의 첫페이지 번호
	private long finalPageNo; // 전체데이터의 마지막 페이지 번호
	
	private long startPageNo; // 보여질 리스트의 시작페이지 번호
	private long endPageNo;
	private long currentPageNo; // 
}
