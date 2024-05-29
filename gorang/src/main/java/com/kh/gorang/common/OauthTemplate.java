package com.kh.gorang.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

public class OauthTemplate {
	//API에 GET요청 보내고 응답을 받아오는 메서드
	public static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection conn = connect(apiUrl);
		
		try {
			conn.setRequestMethod("GET");
			
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				conn.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = conn.getResponseCode();
			if(responseCode == 200) {
				return readBody(conn.getInputStream());
			} else {
				return readBody(conn.getErrorStream());
			}
			
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패. : " + apiUrl, e);
		} finally {
			conn.disconnect();
		}
	}
	
	//API에 연결하기위한 HttpURLConnection객체를 생성하고 반환하는 메서드
		public static HttpURLConnection connect(String apiUrl) {
			try {
				URL url = new URL(apiUrl);
				return (HttpURLConnection)url.openConnection();
			} catch (MalformedURLException e) {
				e.printStackTrace();
				throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("연결이 실패하였습니다. : " + apiUrl, e);
			} 
		}
	
		public static String readBody(InputStream body) {
			InputStreamReader streamReader = new InputStreamReader(body);
			
			try (BufferedReader br = new BufferedReader(streamReader)){
				StringBuilder responseBody = new StringBuilder();
				
				String line;
				while((line = br.readLine()) != null) {
					responseBody.append(line);
				}
				
				return responseBody.toString();
			} catch (IOException e) {
				throw new RuntimeException("API 응답을 읽는데 실패하였습니다.", e);
			}
			
		}
	
		
}
