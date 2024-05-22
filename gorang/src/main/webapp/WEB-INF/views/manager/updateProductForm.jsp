<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- summernote -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/customsummernote.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/customsummernote.css">


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

            <div id="search-product-result-table">
                <div>총 <span>2</span>개 상품</div>
                <div class="option-table-container">
                    <table class="option-table">
                        <thead>
                            <tr>
                                <td align="center" class="checkbox-td">삭제</td>
                                <td align="center" class="checkbox-td">대표옵션</td>
                                <td align="center" class="option-name-td">옵션명1</td>
                                <td align="center" class="option-quantitiy">재고</td>
                                <td align="center" class="option-price">정상가</td>
                                <td align="center">판매가</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="option-tr">
                                <td align="center">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td align="center">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td align="center">
                                    <input type="text" id="">
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right">
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right">
                                </td>
                                <td align="center">
                                    <input type="number" class="txt-align-right">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>