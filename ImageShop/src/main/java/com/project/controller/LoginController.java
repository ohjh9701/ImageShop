package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/auth")
public class LoginController {

	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "아래 정보를 반드시 입력한 후 로그인 해주세요.");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃을 진행합니다.");
		}
		return "auth/loginForm";
	}
	
	@GetMapping("/logout")
	public String logoutForm() {
	log.info("logoutForm");
	return "auth/logoutForm";
	}

}

