package com.callor.app.domain;

public class StudentVO {

	private String stNum;
	private String stName;
	private int intGrade;
	private String stTel;
	private String stAddr;
	private String stDept;
	// private으로 지정한 변수의 값을 읽고 저장하기 위한 get과 set으로 통로
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public int getIntGrade() {
		return intGrade;
	}
	public void setIntGrade(int intGrade) {
		this.intGrade = intGrade;
	}
	public String getStTel() {
		return stTel;
	}
	public void setStTel(String stTel) {
		this.stTel = stTel;
	}
	public String getStAddr() {
		return stAddr;
	}
	public void setStAddr(String stAddr) {
		this.stAddr = stAddr;
	}
	public String getStDept() {
		return stDept;
	}
	public void setStDept(String stDept) {
		this.stDept = stDept;
	}
	// 저장된 변수의 값이 정상적으로 입력됬는지 확인하기 위해 
	// 문자열로 가져오는 toString(생성이 아닌 재정의) 호출
	@Override
	public String toString() {
		return "StudentVO [stNum=" + stNum + ", stName=" + stName + ", intGrade=" + intGrade + ", stTel=" + stTel
				+ ", stAddr=" + stAddr + ", stDept=" + stDept + "]";
	}
}
