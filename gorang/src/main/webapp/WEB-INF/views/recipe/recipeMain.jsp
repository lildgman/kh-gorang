<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeMain.css">
</head>
<body>
	<main id="recipe-main">
		<jsp:include page="../common/header.jsp" />

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
					<span>더보기</span>
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
		</div>

		<jsp:include page="../common/footer.jsp" />
	</main>
</html>