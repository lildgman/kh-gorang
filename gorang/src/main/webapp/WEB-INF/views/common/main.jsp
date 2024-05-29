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
    <link rel="stylesheet" href="${contextPath }/resources/css/common/main.css">
    
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="../common/header.jsp" />
    
    
    <div id="main-container">
        <!-- 배너 -->
        <div id="main-banner-area">
        
        	<c:forEach begin="1" end="3" step="1">
        		<div class="main-banner">
                <img class="main-banner-img" src="${contextPath}/resources/dummyImg/common/main/banner2.png" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
			                        심플한 재료, 풍부한 맛<br>
			                        진정한 집밥의 매력
                    </div>
                    <div class="sub-comment">편안함과 따뜻함을 담은 요리</div>
                </div>
            	</div>
        	</c:forEach>
        	
        </div>

        <!-- 금주의 리스트 -->
        <div id="main-content-area">
            <!-- 금주의 레시피 -->
            <div id="weekly-best-recipe-container"  class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 레시피</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/main.re">더보기</a></span>
                </div>
    
                <div class="weekly-best-list">
                <!-- 레시피 리스트 -->
                <c:forEach begin="1" end="4">
                	<div class="weekly-recipe">
                        <div class="weekly-item-img-container">
                            <img class="weekly-item-img" src="${contextPath}/resources/dummyImg/shopping/recipe1.png" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_1">해독주스로 딱인</div>
                            <div class="info_2">ABC주스</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
            
            <!-- 금주의 베스트 상품 -->
            <div id="weekly-best-product-container" class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 베스트 상품</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/main.po">더보기</a></span>
                </div>

                <!-- 상품 리스트 -->
                <div class="weekly-best-list">                           
                	<c:forEach begin="1" end="4">
                		<div class="weekly-product">
	                        <div class="weekly-item-img-container">
	                            <img class="weekly-item-img" src="${contextPath}/resources/dummyImg/shopping/recipe1.png" alt="">
	                        </div>
	                        <div class="weekly-item-info-container">
	                            <div class="info_title">
	                                <div class="product-brand">성주</div>
	                                <div class="product-name">당도선별 성주 꿀참외 1.5kg</div>
	                            </div>
	                            <div class="info_price">
	                                <div class="product-origin-price">26,200</div>
	                                <div class="product-sale-info">
	                                    <span class="product-discount-percent">20%</span>
	                                    <span class="product-saled-price">16,900</span>
	                                </div>
	                            </div>
	                        </div>
                    	</div>
                	</c:forEach>                 
                </div>
            </div>

            <!-- 금주의 노하우 -->
            <div id="weekly-best-board-container" class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 노하우</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/main.bo">더보기</a></span>
                </div>

                <!-- 노하우 리스트 -->
                <div class="weekly-best-list flex-gap-20">
                
                	<c:forEach begin="1" end="5">
                		<div class="weekly-board flex-gap-16px">
	                        <div class="board-img-container">
	                            <img class="weekly-item-img" src="${contextPath}/resources/dummyImg/common/main/board1.png" alt="">
	                        </div>
	                        <div class="board-title-container">
	                            <div>글 제목</div>
	                        </div>
                    	</div>
                	</c:forEach>
                    
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>