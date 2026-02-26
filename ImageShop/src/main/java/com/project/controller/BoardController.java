package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.security.domain.CustomUser;
import com.project.domain.Board;
import com.project.domain.Member;
import com.project.service.BoardService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void getMethodName(Model model, Authentication authentication) throws Exception {
		// 로그인한 사용자 정보 획득
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		Board board = new Board();

		// 로그인한 사용자 아이디를 등록 페이지에 표시
		board.setWriter(member.getUserId());
		model.addAttribute(board);
	}

	@PostMapping("/register")
	public String postMethodName(Board board, RedirectAttributes rttr) throws Exception {
		int count = service.register(board);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/board/list";
		}
		return "redirect:/board/register";
	}
	
	@GetMapping("/list")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}
	
	@GetMapping("/detail")
	public void detail(Board board, Model model) throws Exception {
		model.addAttribute(service.read(board));
	}
	
	@GetMapping("/modify")
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	public void modifyForm(Board board, Model model) throws Exception {
		model.addAttribute(service.read(board));
	}
	
	@PostMapping("/modify")
	public String modify(Board board, RedirectAttributes rttr) throws Exception {
		int count = service.modify(board);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	public String remove(Board board, RedirectAttributes rttr) throws Exception {
		int count = service.remove(board);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		return "redirect:/board/list";
	}
	

}