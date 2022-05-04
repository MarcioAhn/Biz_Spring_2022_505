package com.callor.hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.hello.domain.ScoreVO;

@Controller
public class ScoreController {
	
	@ResponseBody
	/*
	 * RB가 없으면 home.jsp(view내)을 불러오고 RB가 있으면 home을 불러온다
	 */
	@RequestMapping(value="/print")
	public String printScore() {
		
		int intKor = 100;
		int intEng = 100;
		
		int intSum = intKor + intEng;
		
		return intSum + ""; // 숫자형 문자열형으로 바꾸기
	}
	/*
	 * @RequestMapping(value = "/score", method=RequestMethod.GET) public String
	 * score() { return "score"; }
	 */
	
	@RequestMapping(value = "/score", method=RequestMethod.POST)
	public String score(ScoreVO scoreVO, Model model) {
		model.addAttribute("SCORE", scoreVO);
		return "score";
	}
}
