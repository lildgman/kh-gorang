package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.shopping.model.vo.ProductInsertDTO;
import com.kh.gorang.shopping.service.EnrollProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class EnrollProductController {
	
	private final EnrollProductService enrollProductService;
	
	
	@PostMapping("insert.po")
	public String insertProduct(
			MultipartFile upfile,
			ProductInsertDTO productDTO,
			HttpSession session,
			Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(upfile, session, "/product/productimg/");
			productDTO.setMainImg(changeFileName);
		}
				
		int result = enrollProductService.insertProduct(productDTO);

		if(result > 0) {
			session.setAttribute("alertMsg", "상품을 성공적으로 등록하였습니다.");
			return "redirect:/enrollproduct.ma";

		} else {
			session.setAttribute("alertMsg", "상품 등록을 실패하였습니다. 다시 등록해주세요.");
			return "redirect:/enrollproduct.ma";
		}
	}
	

}
