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
	<!-- 헤더 시작-->
	<jsp:include page="../common/header.jsp" />
	<!-- 헤더 끝-->

	<div id="store-container">
		<!-- 베너 시작-->
		<div id="banner">
			<img class="banner-image" src="${contextPath }/resources/dummyImg/dim.png" alt="배너">
		</div>
		<!-- 베너 끝-->

		<!--카테고리 시작-->
		<div id="items">
			<div id="store-category-area">

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/vaget.png" alt="야채">
					</div>
					<div class="category-name">
						야채
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/fruit.png" alt="과일">
					</div>
					<div class="category-name">
						과일
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/fish.png" alt="육류">
					</div>
					<div class="category-name">
						육류
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/meat.png" alt="어류">
					</div>
					<div class="category-name">
						어류
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/bread.png" alt="빵">
					</div>
					<div class="category-name">
						빵
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/noodle.png" alt="면">
					</div>
					<div class="category-name">
						면
					</div>
				</div>

				<div class="store-category">
					<div class="category-image-area">
						<img class="category-image" src="${contextPath }/resources/dummyImg/dairy.png" alt="유제품">
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
					<span class="more">더보기</span>
				</div>

				<!--가장 많이 판매된 상품 리스트-->
				<div id="best-items" class="items-container">
					<!--상품 시작-->
					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="상품1">
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item2.png" alt="상품2">
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item3.png" alt="상품3">
						</div>
						<div class="item-text-area">
							<div class="item-title">
								<div class="item-brand">성주</div>
								<div class="item-name">풍부한 영양이 담긴 친환경 브로콜리 1입</div>
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item4.png" alt="상품1">
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
					<!--상품 끝-->
				</div>

			</div>
			<!--가장 많이 판매된 상품 끝-->

			<!--새로 입고된 상품들 시작-->
			<div id="new-item-area" class="items-area">
				<!--제목부분-->
				<div id="new-item-title" class="title-top">
					<span class="items-title">새로 입고된 상품들이에요</span>
					<span class="more">더보기</span>
				</div>

				<!--입고된 상품 리스트 시작-->
				<div id="new-items" class="items-container">
					<!--상품 시작-->
					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/newitem1.png" alt="상품1">
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/newitem2.png" alt="상품2">
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/newitem3.png" alt="상품3">
						</div>
						<div class="item-text-area">
							<div class="item-title">
								<div class="item-brand">성주</div>
								<div class="item-name">풍부한 영양이 담긴 친환경 브로콜리 1입</div>
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

					<div class="item">
						<div class="item-thumbnail-area">
							<img class="item-thumbnail" src="${contextPath }/resources/dummyImg/newitem4.png" alt="상품1">
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
					<!--상품 끝-->
				</div>
			</div>
			<!--신제품 끝-->

		</div>
	</div>
</body>

</html>