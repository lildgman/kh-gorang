<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myRecipeBoard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    </head>
    <body>

        <%@ include file="../common/header.jsp" %>
            <div id="body-area">
                <!-- 왼쪽 프로필 메뉴바영역 -->
                <div id="left-body-area">
                    <div id="user-info">
                        <div id="user-profile-area">
                            <div id="user-profile">
                                <img src="${pageContext.request.contextPath}/resources/images/member-img/120X120.png" alt="화원 프로필">
                            </div>
                            <div id="user-profile-pencil">
                                <img src="${pageContext.request.contextPath}/resources/images/member-img/Icon_Edit.png" ale="프로필 사진 버튼">
                            </div>
                        </div>
                        <div id="user-nickgrade-area">
                            <a href="">닉네임 자리</a> <img src="${pageContext.request.contextPath}/resources/images//member-img/Vector 340.png"
                                alt=">" id="bector">
                            <br>
                            <div id="user-follow">
                                <div id="user-follower"><a href="">팔로워 0</a></div> |
                                <div id="user-following"><a href="">팔로잉 0</a></div>
                            </div>
                            <div id="user-grade">
                                브론즈등급
                            </div>
                        </div>
                        <div id="user-profile-area-line">
                            <hr>
                        </div>
                        <div id="user-profile-area-bottom">
                            <div id="user-scrape">
                                <a href="">스크랩</a><br>
                                <div class="zero">0</div>
                            </div>
                            <div id="user-like">
                                <a href="">좋아요</a><br>
                                <div class="zero">0</div>
                            </div>
                            <div id="user-alarm">
                                <a href="">알림</a><br>
                                <div class="zero">0</div>
                            </div>

                        </div>
                    </div>
                    <div id="user-menu">
                        <ul id="left-user-menu-list">
                            <li><a href="">모두 보기</a></li>
                            <li style="font-size: 18px;  font-weight: bold;" id="myboard">나의 게시글
                                <ul id="myboard-list">
                                    <li><a href="" class="myboard-list-in" style="color: #1e90ff;">나의 레시피 게시글</a></li>
                                    <li><a href="" class="myboard-list-in">나의 자유 게시글</a></li>
                                </ul>
                            </li>
                            <li><a href="">댓글 & 후기</a></li>
                            <li><a href="">문의</a></li>
                            <li><a href="">나의 냉장고</a></li>
                            <li><a href="">구매내역</a></li>
                            <li><a href="">스크랩</a></li>
                            <li><a href="">좋아요</a></li>
                            <li><a href="">정보 수정</a></li>
                        </ul>
                    </div>
                </div>

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
                        <div class="myPage-board-list-line">

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

                        </div>

                        <div class="myPage-board-list-line">
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
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="../common/footer.jsp"%>
    </body>
    </html>