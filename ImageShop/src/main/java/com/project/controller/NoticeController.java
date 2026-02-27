package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.domain.CodeLabelValue;
import com.project.common.domain.PageRequest;
import com.project.common.domain.Pagination;
import com.project.domain.Board;
import com.project.domain.Notice;
import com.project.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;

	// 공지사항 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {
		Notice notice = new Notice();
		model.addAttribute(notice);
	}

	// 공지사항 등록 처리
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Notice notice, RedirectAttributes rttr) throws Exception {
		int count = service.register(notice);
		
		if(count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("/list")
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		//요청하는 페이지가 4페이지라면 31~40 게시글을 불러온다.
		model.addAttribute("list", service.list(pageRequest));
		
		//페이지를 보여주는 기능 <<{prev=true} 1, 2, 3, [4], 5, 6, 7, 8, 9, 10 {next=true}>>
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(service.count(pageRequest));
		model.addAttribute("pagination",pagination);
		
		// 검색 유형의 코드명과 코드값을 정의한다.
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "제목"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "내용"));
		searchTypeCodeValueList.add(new CodeLabelValue("tc", "제목/내용"));
		
		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}
	
	@GetMapping("/detail")
	public void detail(@ModelAttribute("pgrq") PageRequest pageRequest, Notice notice, Model model) throws Exception {
		model.addAttribute(service.read(notice));
	}
	
	@GetMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void modifyForm(Notice notice, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		model.addAttribute(service.read(notice));
	}

	@PostMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Notice notice, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		int count = service.modify(notice);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		rttr.addAttribute("page",pageRequest.getPage());
		rttr.addAttribute("sizePerPage",pageRequest.getSizePerPage());
		rttr.addAttribute("searchType",pageRequest.getSearchType());
		rttr.addAttribute("keyword",pageRequest.getKeyword());
		log.info("searchType="+pageRequest.getSearchType());
		log.info("keyword="+pageRequest.getKeyword());
		
		return "redirect:/notice/list";
	}

	@GetMapping("/remove")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(Notice notice, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		int count = service.remove(notice);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		rttr.addAttribute("page",pageRequest.getPage());
		rttr.addAttribute("sizePerPage",pageRequest.getSizePerPage());
		rttr.addAttribute("searchType",pageRequest.getSearchType());
		rttr.addAttribute("keyword",pageRequest.getKeyword());
		
		return "redirect:/notice/list";
	}

}
