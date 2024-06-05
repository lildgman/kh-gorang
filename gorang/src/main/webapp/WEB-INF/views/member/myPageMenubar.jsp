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
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageMenubar.css">
</head>
<body>
     <!-- 왼쪽 프로필 메뉴바영역 -->
     <div id="left-body-area">
        <div id ="user-info">
            <div id="user-profile-area">
                <div id="user-profile">
                    <img src="${contextPath}/resources/images/member-img/${loginUser.profile}" alt="화원 프로필">
                </div>
                <div id="user-profile-pencil">
                    <img src="${contextPath}/resources/images/member-img/Icon_Edit.png" alt="프로필 사진 버튼">
                </div>
            </div>
            <div id="user-nickgrade-area">
                <a href="${contextPath}/myPageInfoEdit.me">${loginUser.nickname }</a> <img src="${contextPath}/resources/images//member-img/Vector 340.png" alt=">" id="bector">
                <br>
                <div id="user-follow">
                    <div id="user-follower"><a href="">팔로워 ${followerCount }</a></div> | 
                    <div id="user-following"><a href="">팔로잉 ${followingCount }</a></div>
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
                    <a href="">스크랩</a><br><div class="zero">${totalScrapCount }</div>
                </div>
                <div id="user-like">
                    <a href="">좋아요</a><br><div class="zero">${totalLikeCount }</div>
                </div>
                <div id="user-alarm">
                    <a href="">알림</a><br><div class="zero">0</div>
                </div>
              
            </div>
        </div>
        <div id="user-menu">
            <ul id="left-user-menu-list">
                <li><a  href="${contextPath}/main.me">모두 보기</a></li>
                <li style="font-size: 18px;  font-weight: bold;" id="myboard">나의 게시글
                   <ul id="myboard-list">
                        <li><a  href="${contextPath}/recipe.me" class="myboard-list-in">나의 레시피 게시글</a></li>
                        <li><a  href="${contextPath}/board.me" class="myboard-list-in">나의 자유 게시글</a></li>
                    </ul>
                </li>
                <li><a  href="${contextPath}/review.me">댓글 & 후기</a></li>
                <li><a  href="${contextPath}/qna.me">문의</a></li>
                <li><a  href="${contextPath}/myRefrigerator.me">나의 냉장고</a></li>
                <li><a  href="${contextPath}/buyList.me">구매내역</a></li>
                <li style="font-size: 18px;  font-weight: bold;" id="user-scrap">스크랩
                    <ul id="myscrap-list">
                        <li><a  href="${contextPath}/scrapRecipe.me" class="myboard-list-in">레시피</a></li>
                        <li><a  href="${contextPath}/scrapBoard.me" class="myboard-list-in">게시글</a></li>
                        <li><a  href="${contextPath}/scrapProduct.me" class="myboard-list-in">상품</a></li>
                    </ul>
                </li>
                <li style="font-size: 18px;  font-weight: bold;" id="user-like">좋아요
                    <ul id="mylike-list">
                        <li><a  href="${contextPath}/likeRecipe.me" class="myboard-list-in">레시피</a></li>
                        <li><a  href="${contextPath}/likeBoard.me" class="myboard-list-in">게시글</a></li>
                    </ul>
                </li>
                <li><a  href="${contextPath}/edit.me">정보 수정</a></li>
            </ul>
        </div>
    </div>
</body>
</html>