package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

public interface OdgRecipeService {

	ArrayList<Recipe> getRecentRecipe();

	ArrayList<Product> getRandomProduct();

}
