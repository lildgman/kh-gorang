package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	
	@PostMapping("detaildesc")
	@ResponseBody
	public String uploadDetailDesc(List<MultipartFile> fileList, HttpSession session) {
		
		List<String> changeNameList = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			String changeName = saveFile(mf,session,"/productdescimg/");
			changeNameList.add("/productdescimg/"+changeName);
		}
		return new Gson().toJson(changeNameList);
	}

	@RequestMapping("main.po")
	public String storeMainForm() {
		return "shopping/shoppingMain";
	}
	
	@RequestMapping("list.po")
	public String storeList() {
		return "shopping/productList";
	}
	
	@RequestMapping("detail.po")
	public String productDetailForm() {
		return "shopping/productDetailForm";
	}
	
	@RequestMapping("cart")
	public String productCartForm() {
		return "shopping/shoppingCartForm";
	}
	
	@RequestMapping("order")
	public String productOrderForm() {
		return "shopping/shoppingOrderForm";
	}
}
