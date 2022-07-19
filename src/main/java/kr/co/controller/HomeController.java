package kr.co.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.VO.BoardVO;
import kr.co.service.BoardService;

@Controller
public class HomeController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {

		List<BoardVO> list = boardService.selectBoard();
		model.addAttribute("list", list);
		System.out.println(list); // kr.co.VO.BoardVO@171ec095, kr.co.VO.BoardVO@21323225, kr.co.VO

		return "home";
	}

}
