<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/member/myPageScrapBoard.css">
    
</head>
<body>
    
    <%@ include file="../common/header.jsp"%>
    
     
    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <jsp:include page="myPageMenubar.jsp" />

        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <div id="scrap-area">
                <div id="scrap-area-top">
                    <span>스크랩 > 게시글</span>
                    <span>(9)</span>
                </div>

                <div id="scrap-area-content">

					<c:forEach begin="1" end="9" step="1">
						<div class="scrap-content">
                        <div class="scrap-img">
                            <img src="${contextPath}/resources/dummyImg/shopping/dog.jpeg" alt="">
                        </div>
                        <div class="scrap-checkbox">
                            <input type="checkbox" name="" id="">
                        </div>
                    </div>
					</c:forEach>                    
                    
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>