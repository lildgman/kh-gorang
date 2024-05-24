<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myRecipeBoard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
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
                        레시피 게시글
                    </div>
                    <div id="myPage-sort">
                        <div>최신순</div>
                        <div>조회순</div>
                        <div>좋아요순</div>
                    </div>

                    <div id="myPage-board-list-area">
                     

                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>


                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>


                     
                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="myPage-board-list-block">
                                <div class="myPage-board-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/Rectangle 59.png" alt="사진">
                                </div>
                                <div class="myPage-board-content">
                                    레시피 게시글 제목 입력합니다. ^0^
                                    <br> <span>조회수 : 12 </span> <span>댓글 : 3</span>
                                    <div class="myPage-board-content-bottom">
                                        <div class="myPage-board-chuchun">
                                            <img src="${pageContext.request.contextPath}/resources/images/member-img/Facebook_Thumb_icon.svg.png" alt="">추천 15
                                        </div>
                                        <div class="myPage-board-edit">
                                            2024.01.01 수정 / <span id="deleteBtn" onclick="deleteRecipeBoard(this)">삭제</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
        
                    </div>
                     <!-- 상품 리스트 끝 -->

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