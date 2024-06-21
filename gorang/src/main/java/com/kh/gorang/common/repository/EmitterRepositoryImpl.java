package com.kh.gorang.common.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EmitterRepositoryImpl implements EmitterRepository{
	
	private final Map<Integer, SseEmitter> emitters = new ConcurrentHashMap<Integer, SseEmitter>();
	
	
	/**
     * 주어진 아이디와 이미터를 저장
     *
     * @param id      - 사용자 아이디.
     * @param emitter - 이벤트 Emitter.
     */
	@Override
	public void save(int id, SseEmitter emitter) {
		emitters.put(id, emitter);
	}
	
	/**
     * 주어진 아이디의 Emitter를 제거
     *
     * @param id - 사용자 아이디.
     */
	@Override
	public void deleteById(int id) {
		emitters.remove(id);
	}

	/**
     * 주어진 아이디의 Emitter를 가져옴.
     *
     * @param id - 사용자 아이디.
     * @return SseEmitter - 이벤트 Emitter.
     */
	@Override
	public SseEmitter get(int id) {
		return emitters.get(id);
	}
	
	

}
