package com.callor.app.service;

import com.callor.app.domain.StudentVO;

public interface StudentService {
	
	// interface는 설계도
	public int insert(StudentVO studentVO); // 학생 데이터 추가하기
	public StudentVO[] selectAll(); // 전체 리스트 가져오기
	public StudentVO findById(String stNum); // 특정한 1개의 데이터만 가져오기
}
