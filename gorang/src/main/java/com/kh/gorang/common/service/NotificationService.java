package com.kh.gorang.common.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.gorang.member.model.vo.Member;

public interface NotificationService {
	
	// subscribe 관련
	public SseEmitter subscribe(int memberNo);
	
	public void notify(int memberNo, Object event);
	
	public void sendToClient(int memberNo, Object event);
	
	public SseEmitter createEmitter(int memberNo);

}
