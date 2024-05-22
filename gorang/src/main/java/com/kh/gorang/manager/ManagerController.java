package com.kh.gorang.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@RequestMapping("manager/product/enroll")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@RequestMapping("manager/product/update")
	public String managerProductUpdateForm() {
		return "manager/updateProductForm";
	}
}
