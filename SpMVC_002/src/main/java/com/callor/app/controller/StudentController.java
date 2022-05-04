package com.callor.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.app.service.StudentService;

@Controller // 컴포넌트라 부름 = 객체인 bean과 같은 역할 ex) 객체.~~~();
public class StudentController {
	
	// IOC : 제어의 역전
	// spring container : 알아서 필요한 데이터 보내주기
	/*
	 * Controller에서 Service interface를 상속받은
	 * 클래스 중에 한가지를 사용하고자 한다
	 * 전통적인 java 에서는 : 인터페이스 객체 = new 클래스생성자()
	 * 와 같이 사용한다.
	 * 
	 * spring framework project에서는
	 * private final 인터페이스 객체; 와 같이 선언하고
	 * 임의 생성자를 만들어 argument로 전달받아
	 * 객체에 대입하는 코드를 만들어 둔다
	 * 
	 * 그러면
	 * 미리 bean으로 생성되어 있는 객체들 중에
	 * 자동으로 주입이 된다
	 */
	private final StudentService scService;
	public StudentController(StudentService scService) {
		this.scService = scService;
	}
	@RequestMapping(value="/student", method=RequestMethod.GET)
	public String list() {
		return "student/list_view";
	}
	@RequestMapping(value="/student/insert", method=RequestMethod.GET)
	public String insert() {
		return "student/insert";
	}
	
	
}
