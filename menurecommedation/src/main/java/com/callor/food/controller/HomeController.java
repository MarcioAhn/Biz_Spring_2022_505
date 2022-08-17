package com.callor.food.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.food.model.MenuVO;
import com.callor.food.service.MenuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private MenuService post;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<MenuVO> recipeList = new ArrayList<MenuVO>();
		recipeList = post.getAllRecipes();
		
		int intRan1 = (int) (Math.random()* recipeList.size()) ;
		int intRan2 = (int) (Math.random()* recipeList.size()) ;
		int intRan3 = (int) (Math.random()* recipeList.size()) ;
		int intRan4 = (int) (Math.random()* recipeList.size()) ;
		int intRan5 = (int) (Math.random()* recipeList.size()) ;
		
		List<MenuVO> randList = new ArrayList<MenuVO>();
		
		
		randList.add(recipeList.get(intRan1));
		randList.add(recipeList.get(intRan2));
		randList.add(recipeList.get(intRan3));
		randList.add(recipeList.get(intRan4));
		randList.add(recipeList.get(intRan5));
		model.addAttribute("RECIPES", randList);
		return "home";
	}
	
	@RequestMapping(value="/403",method=RequestMethod.GET)
	public String error403() {
		return "error/403";
	}
	
	
}
