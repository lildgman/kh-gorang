package com.kh.gorang.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.gorang.common.model.vo.NotifyDto;
import com.kh.gorang.common.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/notifications")
@RequiredArgsConstructor
public class NotificationController {
	// 클라이언트가 알림을 구독하는 기능을 수행하는 컨트롤러
	
	@Autowired
	private final NotificationService notificationService;
	// SSE 통신을 위해서는 produces 로 반환할 데이터 타입을 text/event-stream 로 해줘야함
	
	@GetMapping(value = "/subscribe/{id}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public SseEmitter subscribe(@PathVariable int id) {
		return notificationService.subscribe(id);
	}
	
	@PostMapping("/send-data/{id}")
    public void sendData(@PathVariable int id, String url) {
        notificationService.notify(id, url);
    }
	
}
