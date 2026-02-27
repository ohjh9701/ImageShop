package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Member;
import com.project.domain.Reply;
import com.project.service.MemberService;
import com.project.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/replyRegister")
	public String replyRegister(String username,Reply reply, Model model, RedirectAttributes rttr) throws Exception {
		Member member = memberService.readByNo(username);
		reply.setUserNo(member.getUserNo());
		int count = service.replyRegister(reply);
		if(count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		return "redirect:/board/detail?boardNo="+reply.getBoardNo();
	}
	
}
