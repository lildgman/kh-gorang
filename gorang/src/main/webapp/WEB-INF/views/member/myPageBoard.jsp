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
 <script src="${pageContext.request.contextPath}/resources/js/member/myPageBoard/myRecipeBoard.js"></script>
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
                <div>최신순</div>
                <div>조회순</div>
                <div>좋아요순</div>
            </div>

            <div id="myPage-board-list-area">
                <!-- <div class="myPage-board-list-line"> -->

                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                        </div>
                        <div class="myPage-board-content">
                            레시피 게시글 제목 입력합니다. ^0^
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="">
                        </div>
                        <div class="myPage-board-content">
                            주부의 국보급 샌드위치
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="">
                        </div>
                        <div class="myPage-board-content">
                            집가는데 강도한테 뜯긴 베이글
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>

                <!-- </div> -->

                <!-- <div class="myPage-board-list-line"> -->
                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="">
                        </div>
                        <div class="myPage-board-content">
                            젠장 또 베이글이야 난 오늘도 숭배를 해..
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="">
                        </div>
                        <div class="myPage-board-content">
                            브에이그으을
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="myPage-board-list-block">
                        <div class="myPage-board-img">
                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="">
                        </div>
                        <div class="myPage-board-content">
                            베이글은 김치에 싸서 드세요
                            <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                            <div class="myPage-board-content-bottom">
                                <div class="myPage-board-chuchun">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                </div>
                                <div class="myPage-board-edit">
                                    2024.01.01 수정 / <span style="color: #1e90ff;">삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- </div> -->
            </div>
            <!-- 페이징 바 -->
            <div id="pagination-area">
                <div id="pagination">
                    <a href="#">&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                    <a href="#">8</a>
                    <a href="#">9</a>
                    <a href="#">10</a>
                    <a href="#">&gt;</a>
                </div>
            </div>
        </div>

    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>