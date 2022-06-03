package com.callor.school.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.school.model.StudentVO;
import com.callor.school.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	/*
	 * 
	 * 생성자 주입 방식(SETTER 주입 방식보다권장)
	 * HomeController homeController
	 * 				= new HomeController(stService)
	 * 
	 */
	private final StudentService stService;
	public HomeController(StudentService stService) {
		this.stService = stService;
		// stService = new StduentServiceImplV1();
	}

	
	/*
	 *  클래스에 @Slf4j Annotation을 부착함으로써 다음 코드를
	 * lombok이 대신 만들어 준다
	 */
	//	private static final Logger log 
	//		= LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<StudentVO> stList = stService.selectAll();
		model.addAttribute("ST_LIST", stList);
		return "home";
	}
	
}
