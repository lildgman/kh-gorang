<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


	<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" href="${contextPath }/resources/css/shopping/storeMain.css">
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<div id="store-container">
		<div id="banner">
			<img class="banner-image" src="${contextPath }/resources/dummyImg/dim.png" alt="배너">
		</div>
		<div id="items">
			<div id="store-category-area">

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/vaget.png" alt="야채">
					</div>
					<div class="category-name">
						야채
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/fruit.png" alt="과일">
					</div>
					<div class="category-name">
						과일
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/fish.png" alt="육류">
					</div>
					<div class="category-name">
						육류
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/meat.png" alt="어류">
					</div>
					<div class="category-name">
						어류
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/bread.png" alt="빵">
					</div>
					<div class="category-name">
						빵
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/noodle.png" alt="면">
					</div>
					<div class="category-name">
						면
					</div>
				</div>

				<div class="store-category">
					<div class="category-image">
						<img src="${contextPath }/resources/dummyImg/dairy.png" alt="유제품">
					</div>
					<div class="category-name">
						유제품
					</div>
				</div>
			</div>

			<div id="best-item-area" class="items-area">
				<div id="best-item-top" class="title-top">
					<span class="items-title">가장 많이 판매되었어요</span>
					<span class="more">더보기</span>
				</div>
				<div id="best-items" class="items-container">

				</div>

			</div>
			<div id="new-item-area" class="items-area">
				<div id="new-item-title" class="title-top">
					<span class="items-title">새로 입고된 상품들이에요</span>
					<span class="more">더보기</span>
				</div>
				<div id="new-items" class="items-container">

				</div>
			</div>
		</div>

	</div>



</body>

</html>