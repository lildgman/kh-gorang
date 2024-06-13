package com.kh.gorang;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j
@EnableAspectJAutoProxy
public class LoggingAOP {

	@Pointcut("execution(* com.kh.gorang..controller.*.*(..) )")
	private void cut() {}
	
	@Before("cut()")
	public void before(JoinPoint joinPoint) {
		MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
		java.lang.reflect.Method method = methodSignature.getMethod();
		
		Object[] args = joinPoint.getArgs();
		
		log.error("=============================START=================================");
		log.error("------------------------API Controller-----------------------------");
		log.error("Information     :  " + methodSignature);
		log.error("Method Name     :  " + method);
		log.error("Parameter     :  " + Arrays.toString(args));
	}
	
	@AfterReturning(value = "cut()", returning = "obj")
	public void afterReturn(JoinPoint joinPoint, Object obj) {
		log.error("=============================END=================================");
		log.error("Object     :  " + obj);
	}
	
	@Around("cut()")
	public Object displayLogInfo(ProceedingJoinPoint pJoinPoint) throws Throwable {
		long start = System.currentTimeMillis();// 0
		
		Object result = pJoinPoint.proceed(); // 원래 해야되는 기능을 실행해준다.
		
		long end = System.currentTimeMillis(); // 10
		
		long pTime = end - start;
		
		log.error("-----------------------------------------------------------------");
		log.error("Information      : " + pJoinPoint.getSignature());
		log.error("Processing Time  : " + pTime + "ms");
		
		return result;
	}
}

