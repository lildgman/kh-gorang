package com.kh.gorang.member.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class CoolSmsController {
	public void sms(String userPhone, String auth) {
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSBAMEWNQV9CEGR", "NHNXPTQFBBZYOL2KJG5K6AAXNGX8TV3R", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01053748549");
		message.setTo(userPhone);
		message.setText("테스트중");
		
		try {
			  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
			  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}  
    }    
}
