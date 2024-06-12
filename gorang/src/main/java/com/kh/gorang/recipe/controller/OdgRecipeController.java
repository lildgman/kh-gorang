package com.kh.gorang.recipe.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.service.OdgRecipeService;
import com.kh.gorang.shopping.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OdgRecipeController {
	
	private final OdgRecipeService odgRecipeService;
	
	
}
