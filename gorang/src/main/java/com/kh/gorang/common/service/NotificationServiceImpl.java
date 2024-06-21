package com.kh.gorang.common.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.gorang.common.repository.EmitterRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NotificationServiceImpl implements NotificationService {
	
	// SSE 연결 지속 시간 설정
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;
	@Autowired
	private final EmitterRepository emitterRepository;

	
	/** 
	 * 
	 * 클라이언트가 구독을 위해 호출하는 메서드.
	 * @param memberId - 구독하는 클라이언트의 사용자 번호.
	 * @return SseEmitter - 서버에서 보낸 이벤트 Emitter.
	 * */
	@Override
	public SseEmitter subscribe(int memberNo) {
		SseEmitter emitter = createEmitter(memberNo);
		// 처음 sse 응답시 아무 이벤트가 없다면 재연결 요청하거나 연결 요청 자체에서 오류 발생하기에 더미 데이터 넣어 503 에러 방지
		sendToClient(memberNo, "EventStream Create.[memberNo= " + memberNo + "]");
		
		return emitter;
		}
	
	/**
	 * 서버의 이벤트를 클라이언트에게 보내는 메서드
	 * 다른 서비스 로직에서 이 메서드를 사용해 데이터를 Object event 에 넣고 전송하면 됨
	 * @param memberNo - 메세지 전송할 사용자의 번호
	 * @param event - 전송할 이벤트 객체
	 */
	@Override
	public void notify(int memberNo, Object event) {
		sendToClient(memberNo, event);
	}
	
	/**
     * 클라이언트에게 데이터를 전송
     *
     * @param id   - 데이터를 받을 사용자의 아이디.
     * @param data - 전송할 데이터.
     */
	@Override
	public void sendToClient(int memberNo, Object data) {
		SseEmitter emitter = emitterRepository.get(memberNo);
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event().id(String.valueOf(memberNo)).name("sse").data(data));
            } catch (IOException exception) {
                emitterRepository.deleteById(memberNo);
                emitter.completeWithError(exception);
            }
        }
	}

	
	/**
     * 사용자 아이디를 기반으로 이벤트 Emitter를 생성
     *
     * @param id - 사용자 아이디.
     * @return SseEmitter - 생성된 이벤트 Emitter.
     */
	@Override
	public SseEmitter createEmitter(int memberNo) {
		SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(memberNo, emitter);

        // Emitter가 완료될 때(모든 데이터가 성공적으로 전송된 상태) Emitter를 삭제한다.
        emitter.onCompletion(() -> emitterRepository.deleteById(memberNo));
        // Emitter가 타임아웃 되었을 때(지정된 시간동안 어떠한 이벤트도 전송되지 않았을 때) Emitter를 삭제한다.
        emitter.onTimeout(() -> emitterRepository.deleteById(memberNo));
        return emitter;
	}
	
	
	




	
}
