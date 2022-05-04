package com.callor.school.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.school.domain.StudentVO;
import com.callor.school.service.StudentService;

/*
 * Controller level 에 @RequestMapping을 설정하면
 * Controller의 mapping 과 method의 mapping 서로 연결되어
 * RequestMapping을 구성한다
 */
@RequestMapping(value="/student")
@Controller
public class StudentController {
	
	/*
	 * Dependency inject 중
	 * 생성자 injection
	 */
	private final StudentService stService;
	public StudentController(StudentService stService) {
		this.stService = stService;
	}
	/*
	 * return type이 String type인 method의 경우
	 * null 값을 return하면 Request Path와 같은 jsp 파일을 찾아서
	 * rendering을 수행한다
	 * 단, @ResponseBody 설정이 없어야 한다
	 * localhost:8080/school/student/list
	 */
	
	@RequestMapping(value="/student",method=RequestMethod.GET)
	public String list(Model model) {
		
		List<StudentVO> stList = stService.selectAll();
		model.addAttribute("STUDENTS", stList);
		return "student/list_view";
	}
	
	@RequestMapping(value="/student/detail",method=RequestMethod.GET)
	public String detail(String stNum, Model model) {
		
		StudentVO stVO = stService.findById(stNum);
		model.addAttribute("STUDENT", stVO);
		
		return "student/detail";
	}
	
	@RequestMapping(value="/student/insert",
						method=RequestMethod.GET)
	public String insert( ) {
		return "student/insert";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list() {
		// RequestMapping 이 /student/list 이기 때문에
		// return null을 수행하면
		// return "student/list"를 수행한것과 동일한 효과가 나타난다
		return null;
	}
	@RequestMapping(value="/input", method = RequestMethod.GET)
	public String input() {
		return null;
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detail() {
		return "student/detail_view";
	}
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		return null;
	}
	@RequestMapping(value="/delte", method= RequestMethod.GET)
	public String delete() {
		return null;
	}

	public StudentService getStService() {
		return stService;
	}


}
