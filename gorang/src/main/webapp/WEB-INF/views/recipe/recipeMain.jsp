<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeMain.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<main id="recipe-main">
		<!-- 사이드바 -->
		<jsp:include page="../common/sidebar.jsp" />
		
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
	<!--recipeMain-->
	<script src="${pageContext.request.contextPath}/resources/js/recipe/recipeMain.js"></script>
</html>