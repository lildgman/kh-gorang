<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" href="${contextPath }/resources/css/default.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/shopping/storeMain.css">

	<script src="${contextPath }/resources/js/shopping/shoppingMain.js"></script>
</head>

<body>
	<!-- 헤더 시작-->
	<jsp:include page="../common/header.jsp" />
	<!-- 헤더 끝-->

	<div id="store-container">
		<!-- 베너 시작-->
		<div id="banner">
			<img class="banner-image" src="${contextPath }/resources/dummyImg/shopping/dim.png" alt="배너">
		</div>
		<!-- 베너 끝-->

		<div id="items">

		<!--카테고리 시작-->
			<div id="store-category-area">
				<div class="store-category" id="category-veget">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/vaget.png" alt="야채">
					</div>
					<div class="category-name">
						야채
					</div>
				</div>

				<div class="store-category" id="category-fruit">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/fruit.png" alt="과일">
					</div>
					<div class="category-name">
						과일
					</div>
				</div>

				<div class="store-category" id="category-fish">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/fish.png" alt="어류">
					</div>
					<div class="category-name">
						어류
					</div>
				</div>

				<div class="store-category" id="category-meat">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/meat.png" alt="육류">
					</div>
					<div class="category-name">
						육류
					</div>
				</div>

				<div class="store-category" id="category-bread">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/bread.png" alt="빵">
					</div>
					<div class="category-name">
						빵
					</div>
				</div>

				<div class="store-category" id="category-noodle">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/noodle.png" alt="면">
					</div>
					<div class="category-name">
						면
					</div>
				</div>

				<div class="store-category" id="category-dairy">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/shopping/dairy.png" alt="유제품">
					</div>
					<div class="category-name">
						유제품
					</div>
				</div>
			</div>
			<!--카테고리 끝-->

			<!--가장 많이 판매된 상품 시작-->
			<div id="best-item-area" class="items-area">
				<!--제목부분-->
				<div id="best-item-top" class="title-top">
					<span class="items-title">가장 많이 판매되었어요</span>
					<span class="more" onclick="location.href='store/list'">더보기</span>
				</div>

				<!--가장 많이 판매된 상품 리스트-->
				<div id="best-items" class="items-container">
					<!--상품 시작-->
					
					<c:forEach var="a" begin="1" end="4">
						<div class="item" onclick="location.href='store/product?pno=${a}'">
							<div class="item-thumbnail-area">
								<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="상품1">
							</div>
							<div class="item-text-area">
								<div class="item-title">
									<div class="item-brand">성주</div>
									<div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
								</div>
								<div class="item-price">
									<div class="item-origin-price">50,000</div>
									<div>
										<span class="discount-percent">20%</span>
										<span class="discounted-price">16,900</span>
									</div>
								</div>
							</div>
						</div>				
					</c:forEach>				
					<!--상품 끝-->
				</div>

			</div>
			<!--가장 많이 판매된 상품 끝-->

			<!--새로 입고된 상품들 시작-->
			<div id="new-item-area" class="items-area">
				<!--제목부분-->
				<div id="new-item-title" class="title-top">
					<span class="items-title">새로 입고된 상품들이에요</span>
					<span class="more" onclick="location.href='store/list'">더보기</span>
				</div>

				<!--입고된 상품 리스트 시작-->
				<div id="new-items" class="items-container">
					<!--상품 시작-->
					<c:forEach var="b" begin="1" end="4">
						<div class="item" onclick="location.href='store/product?pno=${b}'">
							<div class="item-thumbnail-area">
								<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/shopping/newitem1.png" alt="상품1">
							</div>
							<div class="item-text-area">
								<div class="item-title">
									<div class="item-brand">성주</div>
									<div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
								</div>
								<div class="item-price">
									<div class="item-origin-price">50,000</div>
									<div>
										<span class="discount-percent">20%</span>
										<span class="discounted-price">16,900</span>
									</div>
								</div>
							</div>
						</div>
					
					</c:forEach>					
					<!--상품 끝-->
				</div>
			</div>
			<!--신제품 끝-->

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>