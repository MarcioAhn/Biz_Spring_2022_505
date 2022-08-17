package com.callor.food.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.food.model.FoodVO;
import com.callor.food.service.FoodService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/food")
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public String home(Principal principal,Model model) {

		// Spring Security Project 에서 로그인한 사용자의 
		// username 을 get 하기
		String username = principal.getName();
		
		// 만약 혹시, 로그인된 사용자 정보를 알수 없으면
		// 로그인 화면으로 redirect
		if(username == null) {
			return "redirect:/user/login?error=LOGIN_NEED";
		}
		
		// 사용자의 username 이 정상이면
		// 데이터 SELECT 하기
		List<FoodVO> foodList = foodService.findByUsername(username);
	
		model.addAttribute("FOODS", foodList);
		model.addAttribute("LAYOUT","FOOD_LIST");
		
		return "home";
		
	}
	
	public  String insert(String t_content) {
		// todoService.insert() 에게 
		// todoVO 에 데이터를 담아서 보내야 한다
		FoodVO foodVO = FoodVO.builder().t_content(t_content).build();
		foodService.insert(foodVO);
		return "redirect:/food";
	}
	
	@RequestMapping(value= {"/",""},method=RequestMethod.POST)
	public  String insert(Principal principal, FoodVO foodVO) {
		
		String username = principal.getName();
		if(username == null) {
			return "redirect:/user/login?error=LOGIN_NEED";
		}
		foodVO.setT_username(username);
		foodService.insert(foodVO);
		return "redirect:/food";
	}
	
	
	/*
	 * @RequestMapping(value="/update",method=RequestMethod.GET) public String
	 * update(String t_seq, Model model) {
	 * 
	 * Long l_seq = 0L; try { l_seq = Long.valueOf(t_seq); } catch (Exception e) {
	 * // TODO: handle exception }
	 * 
	 * FoodVO foodVO = foodService.findById(l_seq);
	 * model.addAttribute("FOOD",foodVO); model.addAttribute("LAYOUT","FOOD_LIST");
	 * return "home";
	 * 
	 * }
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(String t_seq, Model model, Principal principal) {
		
		String username = principal.getName();
		Long l_seq = 0L;
		try { l_seq = Long.valueOf(t_seq); }
		
		catch (Exception e) {}
		FoodVO foodVO = foodService.findById(l_seq);
		model.addAttribute("FOOD", foodVO);
		
		if(username == null) {
			return "redirect:/user/login?error=LOGIN_NEED";
		}
		
		
		List<FoodVO> foodList = foodService.findByUsername(username);
		
		model.addAttribute("FOODS", foodList);
		model.addAttribute("LAYOUT","FOOD_LIST");
		return "home";
		
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(FoodVO foodVO, Model model) {
		
		log.debug("수신된 데이터 {}", foodVO);
		foodService.update(foodVO);
		return "redirect:/food";
	}
	
	@RequestMapping(value="/comp",method=RequestMethod.GET)
	public String comp(String t_seq, Model model) {
		
		int ret = foodService.foodComp(t_seq);
		return "redirect:/food";
	}
	@RequestMapping(value="/{seq}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("seq") String seq) {
		foodService.delete(Long.valueOf(seq));
		return "redirect:/food";
	}
	
	
	

	
	
	
}

