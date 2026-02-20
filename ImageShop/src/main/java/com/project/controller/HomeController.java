package com.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		
		log.info("Slf4j 환영합니다. 지역은 " + locale + " 입니다.");
		
		//현재시간 삽입
		Date date = new Date();
		
		//우리나라 시간과 날짜형식
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//이 양식에 현재 날짜를 적용할거야
		String formatterDate = dateFormat.format(date);
		
		//화면에 정보를 전달하자(Model)
		model.addAttribute("serverTime", formatterDate);
		
		return "home";
	}
}