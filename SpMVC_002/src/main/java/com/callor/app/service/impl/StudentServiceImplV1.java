package com.callor.app.service.impl;

import org.springframework.stereotype.Service;

import com.callor.app.domain.StudentVO;
import com.callor.app.service.StudentService;

@Service // StudentService라고 정의 해주기
public class StudentServiceImplV1 implements StudentService {
	
	// TODO 학생데이터를 추가하기
	@Override // StudentService에 있는거 재정의
	public int insert(StudentVO studentVO) {

		return 0;
	}
	
	// TODO 전체 데이터 가져오기
	@Override
	public StudentVO[] selectAll() {
		return null;
	}

	// TODO 학생 데이터 ID로 조회하기
	@Override
	public StudentVO findById(String stNum) {
		return null;
	}



}
