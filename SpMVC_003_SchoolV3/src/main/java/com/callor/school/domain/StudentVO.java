package com.callor.school.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * spring project에서 VO(DTO) 클래스를 선언할 때는
 * 필드 변수를 private으로 선언하고
 * getter() & setter() 메서드를 선언하고
 * toString() 메서드를 재정의하고
 * 기본생성자와 필드생성자를 정의해둔다 
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StudentVO {

	private String stNum; // 학번
	private String stName; // 이름
	private int intGrade; // 학년
	private String stTel; // 전화번호
	private String stAddr; // 주소
	private String stDept; // 학과
	
	
	

}