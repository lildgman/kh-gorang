package com.kh.gorang.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@PropertySource("classpath:application.properties")
public class APIController {
	
	@Value("${food.serviceKey}")
	private String foodServiceKey;
	
	@ResponseBody
	@RequestMapping(value="food.me", produces="application/json; charset=UTF-8")
	public String getFoodNutriInfo(String foodName, String makerName, int cpage) throws IOException{
		String url = "http://apis.data.go.kr/1471000/FoodNtrCpntDbInfo/getFoodNtrCpntDbInq";
		url += "?serviceKey=" + foodServiceKey;
		url += "&pageNo=" + cpage;
		url += "&numOfRows=10";
		url += "&type=json";
		url += "&FOOD_NM_KR=" + URLEncoder.encode(foodName, "UTF-8");
		url += "&MAKER_NM=" + URLEncoder.encode(makerName, "UTF-8");
		
		URL requestURL = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestURL.openConnection();
		
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		
		urlConnection.disconnect();
		
		return responseText;
	}
}
