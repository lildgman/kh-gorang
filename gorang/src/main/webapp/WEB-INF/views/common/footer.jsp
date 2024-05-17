<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>

<body>
    <footer id="footer">
        <div id="footer-wrapper">
            <div id="footer-wrapper-wrap">
                <div id="footer-wrapper-wrap-container">
                    <div id="footer-wrapper-wrap-container-box">
                        <div class="footer-wrapper-wrap-container-box-contents">
                            <strong>팀원소개</strong>
                            <span>김동현</span>
                            <span>오동건</span>
                            <span>이강산</span>
                            <span>함유철</span>
                            <span>장연식</span>
                        </div>
                        <div class="footer-wrapper-wrap-container-box-contents">
                            <strong>역할소개</strong>
                            <span>조장</span>
                            <span>형상관리</span>
                            <span>이슈 및 일정관리</span>
                            <span>DB관리</span>
                        </div>
                        <div class="footer-wrapper-wrap-container-box-contents">
                            <strong>프로젝트 정보</strong>
                            <span>요구사항 명세서</span>
                            <span>ERD Cloud</span>
                            <span>개발일정</span>
                            <span>UseCase</span>
                        </div>
                        <div id="footer-wrapper-wrap-container-box-info">
                            <div id="footer-wrapper-wrap-container-box-info-customerCenter">
                                <div id="footer-wrapper-wrap-container-box-info-customerCenter-phone">
                                    <span>고객센터</span>
                                    <span>1111-1111</span>
                                </div>
                                <div></div>
                                <div></div>
                            </div>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>