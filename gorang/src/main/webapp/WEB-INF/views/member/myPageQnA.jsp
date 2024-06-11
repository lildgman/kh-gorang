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
	<link rel="stylesheet" href="${contextPath }/resources/css/member/myPageQnA.css">
	<script src="${pageContext.request.contextPath}/resources/js/member/myPageQna.js"></script>

</head>

<body>

	<%@ include file="../common/header.jsp" %>


		<div id="body-area">
			<!-- 왼쪽 프로필 메뉴바영역 -->
			<jsp:include page="myPageMenubar.jsp" />

			<!-- 우측 메인영역 -->
			<div id="right-body-area">
				<!-- 상품문의 영역 -->
				<div id="product-qna-container">
					<div class="container-top">
						<span class="container-top-title">상품 문의</span>
						<!-- <span class="container-top-more"><a href="">더보기</a></span> -->
					</div>
					<div id="product-area" class="content-area">
						<div id="product-area-top">
							<div class="content-area-title cl-6d">상품</div>
							<div class="content-area-comment cl-6d">내용</div>
							<div class="content-area-date cl-6d">작성일</div>
							<div class="content-area-answer cl-6d">상태</div>
						</div>

						<div id="product-area-body" class="contents-area-body">
							<c:choose>
								<c:when test="${empty productQnaList }">
									상품에 대한 QnA가 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="productQna" items="${productQnaList }">
										<div class="product-area-content" data-no="${productQna.productNo}" onclick="moveDetailPage(this)">
											<div class="content-area-title">
												<img class="content-img"
													src="${contextPath }/resources/uploadfile/product/productimg/${productQna.productImg}" alt="">
												<span>${productQna.productName }</span>
											</div>
											<div class="content-area-comment">${productQna.qnaContent }</div>
											<div class="content-area-date">${productQna.qnaCreateDate }</div>
											<c:if test="${productQna.status == 'Y' }">
												<div class="content-area-answer" style="color: #237805;">응답 완료</div>
											</c:if>
											<c:if test="${productQna.status == 'N' }">
												<div class="content-area-answer" style="color: #ed6666;">응답 대기</div>
											</c:if>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 페이징 바 -->
					<div class="pagination-area">
						<div id="pagination">
							<c:choose>
								<c:when test="${productQnaPi.listCount > 0}">
									<c:choose>
										<c:when test="${productQnaPi.currentPage gt 1}">
											<a href="qna.me?product_qna_cpage=${productQnaPi.currentPage - 1}">&lt;</a>
										</c:when>
									</c:choose>

									<c:forEach var="p" begin="${productQnaPi.startPage}" end="${productQnaPi.endPage}">
										<a href="qna.me?product_qna_cpage=${p}">${p}</a>
									</c:forEach>

									<c:choose>
										<c:when test="${productQnaPi.currentPage lt productQnaPi.maxPage}">
											<a href="qna.me?product_qna_cpage=${productQnaPi.currentPage + 1}">&gt;</a>
										</c:when>
									</c:choose>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>

				<!-- 레시피 문의 영역 -->
				<div id="recipe-qna-container">
					<div class="container-top">
						<span class="container-top-title">레시피 문의</span>
						<!-- <span class="container-top-more"><a href="">더보기</a></span> -->
					</div>

					<div id="recipe-area" class="content-area">
						<div id="recipe-area-top">
							<div class="content-area-title cl-6d">레시피</div>
							<div class="content-area-comment cl-6d">내용</div>
							<div class="content-area-date cl-6d">작성일</div>
							<div class="content-area-answer cl-6d">상태</div>

						</div>

						<div id="recipe-area-body" class="contents-area-body">

							<c:choose>
								<c:when test="${empty recipeQnaList}">
									레시피에 대한 QnA가 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="recipeQna" items="${recipeQnaList }">
										<div class="recipe-area-content">
											<div class="content-area-title">
												<img class="content-img"
													src="${contextPath }/resources/uploadfile/recipe/recipemain/${recipeQna.recipeMainImg}"
													alt="">
												<span>${recipeQna.recipeTitle }</span>
											</div>
											<div class="content-area-comment">${recipeQna.qnaContent }</div>
											<div class="content-area-date">${recipeQna.qnaCreateDate }</div>
											<c:if test="${recipeQna.status == 'Y' }">
												<div class="content-area-answer" style="color: #237805;">응답 완료</div>
											</c:if>
											<c:if test="${recipeQna.status == 'N' }">
												<div class="content-area-answer" style="color: #ed6666;">응답 대기</div>
											</c:if>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 페이징 바 -->
					<div class="pagination-area">
						<div id="pagination">
							<c:choose>
								<c:when test="${recipeQnaPi.listCount > 0}">
									<c:choose>
										<c:when test="${recipeQnaPi.currentPage gt 1}">
											<a href="qna.me?recipe_qna_cpage=${recipeQnaPi.currentPage - 1}">&lt;</a>
										</c:when>
									</c:choose>

									<c:forEach var="p" begin="${recipeQnaPi.startPage}" end="${recipeQnaPi.endPage}">
										<a href="qna.me?recipe_qna_cpage=${p}">${p}</a>
									</c:forEach>

									<c:choose>
										<c:when test="${recipeQnaPi.currentPage lt recipeQnaPi.maxPage}">
											<a href="qna.me?recipe_qna_cpage=${recipeQnaPi.currentPage + 1}">&gt;</a>
										</c:when>
									</c:choose>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />

</body>

</html>