package com.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Item;
import com.project.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService service;

	@Value("${D:/upload}")
	private String uploadPath;

	// 상품 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) {
		model.addAttribute(new Item());
	}

	// 상품 등록 처리
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Item item, RedirectAttributes rttr) throws Exception {
		// 클라이언트가 보낸 이미지 파일의 정보 모두 로드가 되었다.
		MultipartFile pictureFile = item.getPicture();
		MultipartFile previewFile = item.getPreview();

		String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(), pictureFile.getBytes());
		String createdPreviewFilename = uploadFile(previewFile.getOriginalFilename(), previewFile.getBytes());
		// 테이블에 저장하기 위한 파일명을 setter
		item.setPictureUrl(createdPictureFilename);
		item.setPreviewUrl(createdPreviewFilename);

		int count = service.register(item);

		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}

		return "redirect:/item/list";
	}

	@GetMapping("/list")
	public void getMethodName(Model model) throws Exception {
		List<Item> itemList = service.list();
		model.addAttribute("itemList", itemList);
	}

	// 상품 수정 페이지
	@GetMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modifyForm(Item item, Model model) throws Exception {
		model.addAttribute(service.read(item));
		return "item/modify";
	}

	// 미리보기 이미지 표시
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Item item) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		// 썸네일 이미지 파일명을 DB로 부터 가져온다.
		String fileName = service.getPreview(item);

		try {
			// 확장자 명을 가져온다
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			// 확장자명을 통해 미디어타입을 리턴받는다.
			MediaType mType = getMediaType(formatName);

			// httpHeader -> 서버가 브라우저에게 정보를 담아서 보내주는 객체
			HttpHeaders headers = new HttpHeaders();

			// 파일을 읽는다. File.separator = /
			// D:/upload/~~~_kdj.jpg 위치를 찾아서 파일을 읽어라
			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				// 미디어 타입을 httpHeader에 셋팅한다.
				headers.setContentType(mType);
			}
			// json 방식으로 전송한다.
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();
		}
		// 웹브라우저에게 바이트단위로 이미지를 전송한다.
		return entity;
	}

	// 원본 이미지 표시
	@ResponseBody
	@RequestMapping("/picture")
	public ResponseEntity<byte[]> pictureFile(Item item) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getPicture(item);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();

		}

		return entity;
	}

	// 파일 확장자로 이미지 형식 확인
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

	// 상품 이미지 파일명과, 상품 이미지 데이터를 byte[]로 바꿔 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대로 중복될 수 없는 ID를 생성
		UUID uid = UUID.randomUUID();
		// ~~~_kdj.jpg 생성
		String createdFileName = uid.toString() + "_" + originalName;
		// D:/upload/~~~_kdj.jpg 업로드
		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;
	}

}
