package kr.co.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.VO.BoardVO;
import kr.co.VO.Criteria;
import kr.co.VO.PageMaker;
import kr.co.VO.SearchCriteria;
import kr.co.service.BoardService;

@Controller
public class HomeController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		// 목록 전부 조회
//		List<BoardVO> list = boardService.selectBoard();
//		model.addAttribute("list", list);
//		System.out.println(list); // kr.co.VO.BoardVO@171ec095, kr.co.VO.BoardVO@21323225, kr.co.VO

		// 페이징 조회
//		model.addAttribute("list", boardService.list(cri));
//
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(boardService.listCount());
//		model.addAttribute("pageMaker", pageMaker);

		// 페이징+검색 조회
		model.addAttribute("list",boardService.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		// 목록 no 표시
		model.addAttribute("number", boardService.listCount(scri));
		model.addAttribute("curPage", scri.getPage());
		System.out.println("현재 게시판 총 개수 확인 : " + boardService.listCount(scri));
		System.out.println("현재 페이지 확인 : " + scri.getPage());
		
		return "home";
	}
}