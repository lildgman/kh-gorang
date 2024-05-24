<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/sidebar.css">

<!--js-->
<script src="${pageContext.request.contextPath}/resources/js/recipe/recipeMain.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/sidebar.js"></script>
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!--slick-->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main id="recipe-main">
		<!-- 사이드 최근본 내역 -->
        <div id="sidebar">
			<div id="recently-seen-div">
                <div class="recently-seen-div-button-box slick-prev">
                    <svg width="16" height="10" viewBox="0 0 16 10" fill="none" xmlns="http://www.w3.org/2000/svg">
						<rect x="2.31445" y="7.46094" width="7.72042" height="1.54408" transform="rotate(-45 2.31445 7.46094)" fill="#D9D9D9"/>
						<rect width="7.72042" height="1.54408" transform="matrix(-0.707107 -0.707107 -0.707107 0.707107 13.416 7.46094)" fill="#D9D9D9"/>
					</svg>
                </div>
				<div id="recently-seen-container">
					<span>최근 본 레시피</span>
					<div id="recently-seen-list">
						<!-- 최근 본 아이템 목록 추가-->
					</div>
				</div>
                <div class="recently-seen-div-button-box slick-next">
                <svg width="16" height="10" viewBox="0 0 16 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="7.72042" height="1.54408" transform="matrix(0.707107 0.707107 0.707107 -0.707107 2.31445 2.53906)" fill="#D9D9D9"/>
                    <rect x="13.6855" y="2.53906" width="7.72042" height="1.54408" transform="rotate(135 13.6855 2.53906)" fill="#D9D9D9"/>
                </svg>
                </div>
			</div>
		</div>
		<div id="recipe-main-contents">
			<div id="recommend-box">
				<div class="recipe-main-box-title">
					<span>오늘은 이 메뉴 어떠세요?</span>
				</div>
				<div id="recommend-box-recipe">
					<div id="recommend-box-recipe-thumbnail">
						<img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/recommendRecipeThumbnail.png" alt="">
					</div>
					<div id="recommend-box-textbox">
						<span>연어월남쌈</span>
						<span>누구나 자신만의 쌈을 만들어 즐길 수 있어 여러 날에 잘 어울리는 레시피</span>
					</div>
				</div>
			</div>
			<div id="recipe-main-new">
				<div class="recipe-main-box-title">
					<span>새로운 레시피들이에요</span>
					<span onclick="goRecipeList()">더보기</span>
				</div>
				<div class="recipe-main-listBox">
					<div class="recipe-main-listBox-grid">
						<div style="height: 292px;">
							<img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail1.png" alt="">
						</div>
						<div class="recipe-main-listBox-grid-textBox">
							<span>해독주스로 딱인</span>
							<span>ABC주스</span>
						</div>
					</div>
					<div class="recipe-main-listBox-grid">
						<div style="height: 292px;">
							<img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail2.png" alt="">
						</div>
						<div class="recipe-main-listBox-grid-textBox">
							<span>이탈리아의 여름을 담은</span>
							<span>콜드 파스타</span>
						</div>
					</div>
					<div class="recipe-main-listBox-grid">
						<div style="height: 292px;">
							<img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail3.png" alt="">
						</div>
						<div class="recipe-main-listBox-grid-textBox">
							<span>야외에서 즐기는</span>
							<span>돼지 바비큐</span>
						</div>
					</div>
					<div class="recipe-main-listBox-grid">
						<div style="height: 292px;">
							<img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail4.png" alt="">
						</div>
						<div class="recipe-main-listBox-grid-textBox">
							<span>신선한 맛</span>
							<span>아보카도 오픈 샌드위치</span>
						</div>
					</div>
				</div>

			</div>
			<div id="recipe-main-shopping">
				<div class="recipe-main-box-title">
					<span>재료가 모자라지 않으신가요?</span>
					<span onclick="goShoppingList()">더보기</span>
				</div>
				<div id="recipe-main-shopping-list">
					<div class="recipe-main-shopping-list-product">
						<div style="height: 292px;"><img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/productThumbnail1.png" alt=""></div>
						<div class="recipe-main-shopping-list-product-textBox">
							<div class="recipe-main-shopping-list-product-textBox-title">
								<span>성주</span>
								<span>당도선별 성주 꿀참외 1.5kg (4~7입)</span>
							</div>
							<div class="recipe-main-shopping-list-product-textBox-price">
								<span> <del>2,620,000</del> </span>
								<div class="recipe-main-shopping-list-product-textBox-price-box">
									<div class="recipe-main-shopping-list-product-textBox-price-box-discount">
										<span class="recipe-main-discount">20%</span>
										<span>16,900</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="recipe-main-shopping-list-product">
						<div style="height: 292px;"><img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/productThumbnail2.png" alt=""></div>
						<div class="recipe-main-shopping-list-product-textBox">
							<div class="recipe-main-shopping-list-product-textBox-title">
								<span>성수동 분식</span>
								<span>콘치즈 김치볶음밥 (2개입)</span>
							</div>
							<div class="recipe-main-shopping-list-product-textBox-price">
								<span> <del>9,900</del> </span>
								<div class="recipe-main-shopping-list-product-textBox-price-box">
									<div class="recipe-main-shopping-list-product-textBox-price-box-discount">
										<span class="recipe-main-discount">12%</span>
										<span>8,712</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="recipe-main-shopping-list-product">
						<div style="height: 292px;"><img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/productThumbnail3.png" alt=""></div>
						<div class="recipe-main-shopping-list-product-textBox">
							<div class="recipe-main-shopping-list-product-textBox-title">
								<span>양양</span>
								<span>친환경 브로콜리 1개</span>
							</div>
							<div class="recipe-main-shopping-list-product-textBox-price">
								<div class="recipe-main-shopping-list-product-textBox-price-box">
									<div class="recipe-main-shopping-list-product-textBox-price-box-discount">
										<span>4,990</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="recipe-main-shopping-list-product">
						<div style="height: 292px;"><img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/productThumbnail4.png" alt=""></div>
						<div class="recipe-main-shopping-list-product-textBox">
							<div class="recipe-main-shopping-list-product-textBox-title">
								<span>제주도니</span>
								<span>제주 1등급 암퇘지 삼겹살 300g(냉장)</span>
							</div>
							<div class="recipe-main-shopping-list-product-textBox-price">
								<span> <del>15,800</del> </span>
								<div class="recipe-main-shopping-list-product-textBox-price-box">
									<div class="recipe-main-shopping-list-product-textBox-price-box-discount">
										<span class="recipe-main-discount">20%</span>
										<span>12,640</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</html>