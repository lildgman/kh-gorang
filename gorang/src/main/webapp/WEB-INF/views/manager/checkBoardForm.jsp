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
<link rel="stylesheet" href="${contextPath}/resources/css/manager/checkBoardForm.css">
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="../common/header.jsp" />
    <div id="main-container">

        <!-- 왼쪽 div -->
        <div id="left-container">
            <div id="product-management-list" class="management-list">
                <div class="title">
                    상품 관리
                </div>
                <div class="list">
                    <div id="enroll-product">상품 등록</div>
                    <div id="find-update-product" style="color: #1e90ff;">상품 조회/수정</div>
                </div>
            </div>

            <div id="board-management-list" class="management-list">
                <div class="title">
                    게시판 관리
                </div>
            </div>

            <div id="user-management-list" class="management-list">
                <div class="title">
                    회원 관리
                </div>
            </div>
        </div>

        <!-- 오른쪽 div -->
        <div id="right-container">
            <div id="right-title">게시판 관리</div>

            
            <!-- 서치바 -->
            <div class="searchbar-container">
                <div class="searchbar">
                    <div class="search-input-container">
                        <div class="i-container">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>
                        <input id="search-category-input" class="search-input" type="text" placeholder="상품명 입력">
                    </div>
                    <div class="search-btn-container">
                        <button id="search-category-btn" class="search-btn" >검색</button>
                    </div>
                </div>
            </div>

            <!-- 게시글 목록 -->
            <div id="admin-board-list-area">
                <div id="admin-board-title">총 N개의 게시글</div>
                <div id="admin-board-list-blocks">
                    <table border="1">
                        <thead>
                            <tr id="admin-thead-tr">
                                <td class="thead-td1">선택</td>
                                <td class="thead-td2">게시글 ID</td>
                                <td class="thead-td3">종류</td>
                                <td class="thead-td4">게시글 명</td>
                                <td class="thead-td5">작성자</td>
                                <td class="thead-td6">작성일</td>
                                <td class="thead-td7">누적 신고 수</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="admin-tbody-tr">
                                <td class="tbody-checkbox"><input type="checkbox" name="" id=""></td>
                                <td style="color: #1e90ff;">1821515</td>
                                <td>레시피</td>
                                <td>개발은 참 즐거워</td>
                                <td>1821515</td>
                                <td>2024/01/01</td>
                                <td>1234</td>
                            </tr>

                            <tr class="admin-tbody-tr">
                                <td class="tbody-checkbox"><input type="checkbox" name="" id=""></td>
                                <td style="color: #1e90ff;">1823525</td>
                                <td>일반글</td>
                                <td>괴발개발</td>
                                <td>1821515</td>
                                <td>2024/01/01</td>
                                <td>123</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 페이징 바 영역(미정) -->
            <!-- <div></div> -->
            <!-- 숨기기 버튼 -->
            <div id="hidden-board-btn">
                <button>숨기기</button>
            </div>
        </div>
    </div>
</body>
</html>