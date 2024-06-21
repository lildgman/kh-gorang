package com.kh.gorang.common.repository;

import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface EmitterRepository {

	public void save(int id, SseEmitter emitter);
	
	public void deleteById(int id);
	
	public SseEmitter get(int id);
}
