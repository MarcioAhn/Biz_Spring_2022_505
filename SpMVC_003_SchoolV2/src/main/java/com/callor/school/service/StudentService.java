package com.callor.school.service;

import java.util.List;

import com.callor.school.domain.StudentVO;

public interface StudentService {
	

	public StudentVO findById(String stNum); // 특정한 1개의 데이터만 가져오기
	/* CRUD method의 prototype 선언
	* Create(새로운 데이터추가) 
	* Read(이미 저장된 데이터를 읽어오기)
	* Update(기존 데이터 변경된 내용으로 저장하고) 
	* Delete(기존 데이터 중 필요없는 내용 삭제)
	*/
	public List<StudentVO> selectAll(); // R
	public StudentVO findByStNum(String stNum); // R
	public Integer insert(StudentVO stVO); // C
	public Integer update(StudentVO stVO); // U
	public Integer delete(String stNum); // D
	
	// 위에서 stNum -> ID(식별자)
	
	public List<StudentVO> findByStTel(String stTel);
	public List<StudentVO> findByStName(String stName);
	public List<StudentVO> findByStAddr(String stAddr);
}
