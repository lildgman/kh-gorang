<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myPageBoard.css">
    <!-- js -->
    <script src="${pageContext.request.contextPath}/resources/js/member/myPageBoard.js"></script>
</head>

<body>
    <jsp:include page="../common/header.jsp" />

    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <jsp:include page="myPageMenubar.jsp" />

        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <div id="myPage-title">
                자유 게시글
            </div>
            <div id="myPage-sort">
                <div data-sort="recent" onclick="sortRecipe(this)">최신순</div>
				<div data-sort="view" onclick="sortRecipe(this)">조회순</div>
				<div data-sort="like" onclick="sortRecipe(this)">좋아요순</div>
            </div>

            <div id="myPage-board-list-area">
                <!-- <div class="myPage-board-list-line"> -->
                <c:choose>
                    <c:when test="${empty boardList }">
                        작성한 게시글이 없습니다.
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="boardDTO" items="${boardList }">
                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img" data-no="${boardDTO.board.boardNo}" onclick="movePage(this)">
                                    <img src="${contextPath}/resources/uploadfile/board/boardMainContentFile/${boardDTO.board.boardThumbnail}"
                                        alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    ${boardDTO.board.boardTitle }
                                    <br> <span>조회수 : ${boardDTO.board.boardViews } </span> <span>댓글 : ${boardDTO.commentCount }</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png"
                                                alt="">추천 ${boardDTO.likeCount }
                                        </div>
                                        <div class="myPage-board-edit">
                                            ${boardDTO.board.boardCreateDate } 수정 /<span id="deleteBtn"
                                                onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <!-- </div> -->
            </div>
            <!-- 페이징 바 -->
            <div id="pagination-area">
				<div id="pagination">

					<c:choose>
						<c:when test="${pi.currentPage ne 1 }">
							<a href="board.me?cpage=${pi.currentPage -1 }&sort=${sort}">&lt;</a>
						</c:when>
					</c:choose>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<a href="board.me?cpage=${p}&sort=${sort}">${p}</a>
					</c:forEach>

					<c:choose>
						<c:when test="${(pi.currentPage ne pi.maxPage) or (pi.maxPage eq 0) }">
							<a href="board.me?cpage=${pi.currentPage +1 }&sort=${sort}">&gt;</a>
						</c:when>
					</c:choose>
				</div>
			</div>
        </div>

    </div>
    <%@ include file="../common/footer.jsp" %>
</body>

</html>