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
    <link rel="stylesheet" href="${contextPath }/resources/css/manager/updateProduct.css">
    <script src="${contextPath }/resources/js/manager/updateProductForm.js"></script>
    
     <!-- font awesome kit -->
     <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>
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
            
            <div id="right-title">상품 조회/수정</div>

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

            <!-- 상품 상태 -->
            <div class="show-product-status-area">
                <div class="product-status">
                    <div>전체</div>
                    <div class="quantity-div">2</div>
                </div>
                <div class="product-status">
                    <div>판매중</div>
                    <div class="quantity-div">2</div>
                </div>
                <div class="product-status">
                    <div>일시품절</div>
                    <div class="quantity-div">2</div>
                </div>
                <div class="product-status">
                    <div>판매정지</div>
                    <div class="quantity-div">2</div>
                </div>
            </div>

            <!-- 상품 검색결과 -->
            <div class="search-product-result-table">
                <div class="result-title">총 <span>2</span>개 상품</div>
                <div class="product-table-container">
                    <table class="product-table">
                        <thead>
                            <tr>
                                <td align="center" class="checkbox-td">선택</td>
                                <td align="center" class="product-id">상품 ID</td>
                                <td align="center" class="product-name-td">상품명</td>
                                <td align="center" class="product-status-td">판매상태</td>
                                <td align="center" class="product-saled-price">판매가</td>
                                <td align="center" class="product-origin-price">정상가</td>
                                <td align="center" class="product-category">카테고리</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="option-tr">
                                <td align="center">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td align="center">
                                    1821515
                                </td>
                                <td align="center">
                                    상품명1
                                </td>
                                <td align="center">
                                    <select name="" id="">
                                        <option value="">판매중</option>
                                        <option value="">일시품절</option>
                                    </select>
                                </td>
                                <td align="center">
                                    9,000
                                </td>
                                <td align="center">
                                    10,000
                                </td>
                                <td align="center">
                                    조미료 > 간장
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
                <div class="detail-search-btn-container">
                    <button id="detail-search-btn" class="myBtn">상세조회</button>
                </div>

            </div>

            <!-- 상품 옵션 -->
            <div class="search-product-result-table">
                <div class="result-title">상품 옵션</div>
                <div class="product-table-container">
                    <table class="product-table">
                        <thead>
                            <tr>
                                <td align="center" class="option-name-td">옵션명</td>
                                <td align="center" class="product-quantity-td">재고</td>
                                <td align="center" class="product-origin-price-td">정상가</td>
                                <td align="center" class="product-saled-price-td">판매가</td>

                            </tr>
                        </thead>
                        <tbody>
                            <tr class="option-tr">
                                <td align="center">
                                    <input type="text" >
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right" placeholder="개">
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right" placeholder="원">
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right" placeholder="원">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="update-btn-container">
                <button class="myBtn">수정하기</button>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>