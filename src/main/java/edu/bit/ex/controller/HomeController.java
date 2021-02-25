package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@RequestMapping("/")
	public String home(Model model) {
		log.info("home..");

		BoardVO boardVO = new BoardVO();
		boardVO.setbName("홍길동");
		boardVO.setbTitle("테이블");
		boardVO.setbContent("컨텐츠");

		model.addAttribute("board", boardVO);

		return "thymeleaf/index";
	}
}