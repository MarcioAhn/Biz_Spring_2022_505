package com.callor.naver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.naver.config.QualifierConfig;
import com.callor.naver.domain.BookVO;
import com.callor.naver.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/books")
public class BooksController {

	@Qualifier(QualifierConfig.SERVICE.BOOKS_V1) 
	private final BookService bookSerivce;
	public BooksController(
			BookService bookService) {
		this.bookSerivce = bookService;
	}
	@RequestMapping(value = { "/", "" })
	public String home() {
		/*
		 * return "문자열" 형식은 명시적으로 
		 * 어떤 jsp 파일을 rendering 할 것인지 알려주는 것이다 
		 * 현재 method를 요청한
		 * URL에 대하여 jsp를 
		 * 명시적으로 전달한다
		 */
		return "books/list";
	}

	@RequestMapping(value = "/list")
	public String list(Model model) {
		/*
		 * return null 형식은 
		 * 암시적으로 어떤 jsp 파일을 rendering 할 것인지 
		 * 알려주는 것이다 현재 method를 요청한 URL이
		 * 명시적으로 명확할 경우 
		 * NULL 값을 return하면 Spring에서 자체적으로 
		 * 폴터/파일 형식으로 구성을 하여준다
		 */
		
		List<BookVO> bookList = bookSerivce.selectAll();
		// bookList에 담긴 데이터를 BOOKS 이름으로 변수에 담아
		// jsp 파일로 보내겠다
		model.addAttribute("BOOKS",bookList);
		return null;
	}
	/*
	 * RequestMethod가 없는 Mapping은
	 * GET 요청이나 POST 요청을 모두 처리하는 method가 되어버린다
	 * 
	 * method=RequestMethod.GET로 지정을 하면
	 * a tag link를 눌렀을 때의 요청만 처리하도록 역할을 제한한다
	 */
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert() {
		return null;
	}
	/*
	 * method=POST가 부착된 form으로 감싼 데이터들이 전송되었을 때
	 * 요청을 받아 처리할 method(VO 매개변수로 받음)
	 */
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(BookVO bookVO) {
		bookSerivce.insert(bookVO);
		log.debug("도서정보 : " + bookVO.toString());
		return null;
	}

}
