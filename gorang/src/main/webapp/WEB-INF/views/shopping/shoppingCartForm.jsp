<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- font awesome kit -->
    <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${contextPath }/resources/css/default.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/shopping/shoppingCart.css">

</head>

<body>
    <!-- 헤더 -->
    <jsp:include page="../common/header.jsp" />


    <!-- 장바구니 container -->
    <div id="cart-container">
        <div id="cart-product-area">
            <!-- 장바구니 top -->
            <div id="product-area-top">
                <div id="selectall-checkbox-container">
                    <input type="checkbox" id="all" value="">
                    <label for="all">모두 선택</label>
                </div>
                <div id="selected-delete">선택삭제</div>
            </div>

            <!-- 장바구니 내용물들 -->
            <div id="product-content-area">
    			
    			<c:forEach begin="1" end="3" step="1">
	    			<div class="product-in-cart">
	                    <div class="select-checkbox-container">
	                        <input type="checkbox">
	                    </div>
	
	                    <div class="product-img-container">
	                        <img class="product-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
	                    </div>
	
	                    <div class="cart-product-info-container">
	                        <div class="cart-product-name-container">
	                            <span class="cart-product-name">성주 참외 꿀참외 1.5kg</span>
	                            <span class="cart-product-delete">X</span>
	                        </div>
	                        <div class="product-delivery-method">무료배송</div>
	                        <div class="product-quantity-price-container">
	                            <div class="product-quantity">
	                                <div class="pbtn" id="minus_quantity">-</div>
	                                <div class="pbtn" id="quantity">1</div>
	                                <div class="pbtn" id="plus_quantity">+</div>
	                            </div>
	                            <div class="product-price">
	                                <span class="product-origin-price">30,000원</span>
	                                <span class="product-saled-price">24,000원</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
    			
    			</c:forEach>
                <!-- 장바구니 내용물 -->
                

                
            </div>
        </div>

        <div id="cart-price-area">
            <div id="cart-detail-price-area">
                <div id="cart-detail-price">
                    <div id="total-product-price-area">
                        <span>총 상품금액</span>
                        <span id="total-product-price">30,000원</span>
                    </div>
                    <div id="total-delivery-charge-area">
                        <span>총 배송비</span>
                        <span id="total-delivery-charge">0원</span>
                    </div>
                    <div id="total-discount-quantity-area">
                        <span>총 할인금액</span>
                        <span id="total-discount-quantity">6,000원</span>
                    </div>
                </div>
                <div id="cart-price-sum-area">
                    <span style="font-size: 17px; font-weight: bold;">결재금액</span>
                    <span id="cart-price-sum">24,000원</span>
                </div>

            </div>

            <div id="buy_btn_container">
                <button id="buy_btn">구매하기</button>
            </div>
        </div>
    </div>


    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>