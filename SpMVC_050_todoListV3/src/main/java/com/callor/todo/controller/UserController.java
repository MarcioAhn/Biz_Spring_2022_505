package com.callor.todo.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.todo.model.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/user")
public class UserController {

	
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return null;
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(UserVO userVO) {
		log.debug(userVO.toString());
		log.debug("회원가입 데이터 : " + userVO);
		log.debug("회원가입 데이터 : {} {}" + userVO, userVO);
		

		return "redirect:/";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(String error, Model model) {
		model.addAttribute("error", error);
		return null;
	}
	@PreAuthorize("hasAnyRole(['ROLE_USER','ROLE_ADMIN']")
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypape(Principal principal, Model model) {
		String username = principal.getName();
			model.addAttribute("LAYOUT","MYPAGE");
		return null;
	}
}
