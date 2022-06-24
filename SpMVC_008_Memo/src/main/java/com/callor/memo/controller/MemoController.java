
package com.callor.memo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoVO;
import com.callor.memo.service.MemoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/memo")
public class MemoController {

	private final MemoService memoService;

	public MemoController(MemoService memoService) {
		this.memoService = memoService;
	}

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<MemoVO> memoList = memoService.selectAll();
		// log.debug(memoList.toString());
		model.addAttribute("MEMO", memoList);
		return null;

	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("LAYOUT", "MEMO-INPUT");

		return null;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemoVO memoVO, Model model, @RequestParam("mimage") MultipartFile file) {
		log.debug("메모내용 : " + memoVO.toString());

		memoService.insertfileAndimage(memoVO, file);
		// insert 처리를 수행한 후 list 보기 화면으로 전환하라
		return "redirect:/memo/list";

	}

	@RequestMapping(value = "/{m_seq}/detail", method = RequestMethod.GET)
	public String detail(@PathVariable("m_seq") int m_seq, Model model) {
		MemoVO memoVO = memoService.findById(m_seq);
		model.addAttribute("MEMO", memoVO);

		return "memo/detail";

	}

	@RequestMapping(value = "/{m_seq}/update", method = RequestMethod.GET)
	public String update(@PathVariable("m_seq") int m_seq, Model model) {

		MemoVO memoVO = memoService.findById(m_seq);
		model.addAttribute("MEMO", memoVO);

		return "memo/insert";

	}

	@RequestMapping(value = "/{m_seq}/update", method = RequestMethod.POST)
	public String update(MemoVO memoVO) {

		 memoService.update(memoVO);

		String retStr = String.format("redirect:/memo/%s/detail", memoVO.getM_seq());
		return retStr;

	}

	@RequestMapping(value = "/{m_seq}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable("m_seq") int m_seq) {

		// 삭제한 데이터개수를 return 한다
		int ret = memoService.delete(m_seq);
		return "redirect:/memo/list";
	}
}
