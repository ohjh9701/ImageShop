package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.CodeDetailService;
import com.project.service.CodeService;

@Controller
@RequestMapping("/codedetail")
public class CodeDetailController {
	
	@Autowired
	private CodeDetailService codeDetailService;
	
	@Autowired
	private CodeService codeService;
	
}
