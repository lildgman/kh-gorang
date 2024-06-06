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
    <script src="${contextPath }/resources/js/shopping/shoppingCart.js"></script>
    <!-- font awesome kit -->
    <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>

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
                    <input type="checkbox" id="all-select-checkbox" value="">
                    <label for="all-select-checkbox" id="all-check-label">모두 선택</label>
                </div>
                <div id="selected-delete" onclick="reallyDelete()">선택삭제</div>
            </div>

            <!-- 장바구니 내용물들 -->
            <div id="product-content-area">
                <c:choose>
                    <c:when test="${empty carts}">
                        <div><span>장바구니가 비어있습니다.</span></div>
                    </c:when>
                    <c:otherwise>
        <!-- 장바구니 내용물 -->
                        <c:forEach var="cart" items="${carts}">
                            <div class="product-in-cart">
                                <div class="select-checkbox-container">
                                    <input type="checkbox" class="select-checkbox" onclick="changeAllCheckBox()">
                                </div>
                                <div class="product-img-container">
                                    <img class="product-img" src="${contextPath }/resources/dummyImg/shopping/${cart.pdForCart.mainImg}" alt="">
                                </div>
                                <div class="cart-product-info-container">
                                    <div class="cart-product-name-container">
                                        <span class="cart-product-name">${cart.pdForCart.productName}</span>
                                        <span class="cart-productOpt-name">${cart.pdOptForCart.detailOptionName}</span>
                                    </div>
                                    <div class="product-delivery-method">${cart.pdForCart.shipmentType}</div>
                                    <div class="product-quantity-price-container">
                                        <div class="product-quantity">
                                            <div class="pbtn minus_quantity" id="minus_quantity">-</div>
                                            <div class="pbtn quantity" id="quantity">1</div>
                                            <div class="pbtn plus_quantity" id="plus_quantity" >+</div>
                                        </div>
                                        <div class="product-price">
                                            <div>
                                                <span class="product-origin-price">${cart.pdOptForCart.detailOptionOriginPrice}</span><span class="origin-won">원</span>
                                            </div>
                                            <div>
                                                <span class="product-saled-price">${cart.pdOptForCart.detailOptionSaledPrice}</span><span class="saled-won">원</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cart-product-delete" onclick="deleteProduct(this)"><i class="fa-solid fa-x"></i></div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div id="cart-price-area">
            <div id="cart-detail-price-area">
                <div id="cart-detail-price">
                    <div id="total-product-price-area">
                        <span>총 상품금액</span>
                        <div>
                            <span id="total-origin-price">30,000</span><span>원</span>
                        </div>
                    </div>
                    <div id="total-delivery-charge-area">
                        <span>총 배송비</span>
                        <div>
                            <span id="total-delivery-charge">0</span><span>원</span>
                        </div>
                    </div>
                    <div id="total-discount-quantity-area">
                        <span>총 할인금액</span>
                        <div>
                            <span id="total-discount-price">6,000</span><span>원</span>
                        </div>
                    </div>
                </div>
                <div id="cart-price-sum-area">
                    <span style="font-size: 17px; font-weight: bold;">결제금액</span>
                    <div>
                        <span id="cart-price-sum">24,000</span><span style="font-size: 25px; font-weight: bold;">원</span>
                    </div>
                </div>

            </div>

            <div id="buy_btn_container">
                <button id="buy_btn" onclick="location.href='${contextPath}/order'">구매하기</button>
            </div>
        </div>
    </div>


    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp" />
</body>

</html>