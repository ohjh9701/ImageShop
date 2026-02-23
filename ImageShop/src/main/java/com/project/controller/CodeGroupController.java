package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CodeGroup;
import com.project.service.CodeGroupService;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/codegroup")
public class CodeGroupController {

	@Autowired
	private CodeGroupService service;

	// 코드그룹 입력 페이지 요청
	@GetMapping("/register")
	public void registerForm(Model model) throws Exception {
		CodeGroup codeGroup = new CodeGroup();
		model.addAttribute(codeGroup);
		// return "codegroup/register"; -> void를 했기 때문에 쓰지 않아도 됨
	}

	// 코드그룹 등록 처리요청
	@PostMapping("/register")
	public String register(CodeGroup codeGroup, RedirectAttributes rttr) throws Exception {
		int count = service.register(codeGroup);
		log.info("codeGroup/register = " + count);
		if (count != 0) {
			// rttr.addFlashAttribute("msg", "SUCCESS") 세션에 정보를 임시저장한다.
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/codegroup/list";
		}
		return "redirect:/codegroup/register";
	}

	@GetMapping("/list")
	public void list(Model model) throws Exception {
		log.info("model.addAttribute(msg) = " + model.addAttribute("msg"));
		model.addAttribute("list", service.list());
	}

	// 코드그룹 상세페이지 요청
	@GetMapping("/detail")
	public void read(CodeGroup codeGroup, Model model) throws Exception {
		model.addAttribute(service.read(codeGroup));
	}

	// 코드그룹 삭제 처리요청
	@GetMapping("/remove")
	public String remove(CodeGroup codeGroup, RedirectAttributes rttr) throws Exception {
		int count = service.remove(codeGroup);
		if (count != 0) {
			// rttr.addFlashAttribute("msg", "SUCCESS") 세션에 정보를 임시저장한다.
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:/codegroup/list";
	}
}
