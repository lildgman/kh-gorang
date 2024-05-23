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
    <!--js-->
<script src="${pageContext.request.contextPath}/resources/js/member/myPageLike/myPageLikeRecipe.js"></script>
</head>
<body>
    
    <%@ include file="../common/header.jsp"%>
    
     
    <div id="body-area">
        <jsp:include page="myPageMenubar.jsp" />

        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <div id="scrap-area">
                <div id="scrap-area-top">
                    <span>스크랩 > 상품</span>
                    <span>(9)</span>
                </div>
                <div id="delete-edit" onclick="editBtn()">편집</div>           
                    <div id="delete-like" onclick="deleteBtn()">삭제</div>
            
                <div id="scrap-area-content">

					<c:forEach begin="1" end="9" step="1">
						<div class="scrap-content">
                        <div class="scrap-img">
                            <img src="${contextPath}/resources/dummyImg/shopping/dog.jpeg" alt="">
                        </div>
                        <div class="scrap-checkbox">
                            <input type="checkbox" name="" id="delete-check" class="delete-check">
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