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
    <link rel="stylesheet" href="${contextPath }/resources/css/manager/enrollproduct.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/manager/commonManager.css">
    <script src="${contextPath }/resources/js/manager/enrollProductForm.js"></script>

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
                    <div id="enroll-product" style="color: #1e90ff;"
                        onclick="location.href='${contextPath }/enrollproduct.ma'">상품 등록</div>
                    <div id="find-update-product" onclick="location.href='${contextPath }/updateproduct.ma'">상품 조회/수정
                    </div>
                </div>
            </div>

            <div id="board-management-list" class="management-list" onclick="location.href='${contextPath }/boards.ma'">
                <div class="title">
                    게시판 관리
                </div>
            </div>

            <div id="user-management-list" class="management-list" onclick="location.href='${contextPath }/members.ma'">
                <div class="title">
                    회원 관리
                </div>
            </div>
        </div>

        <!-- 오른쪽 div -->
        <form action="insert.po" method="POST">

            <div id="right-container">
                <div id="right-title">상품 등록</div>

                <div id="category-container" class="enroll-div-container">
                    <div class="container-title">
                        <span>카테고리</span><span style="color: #d72020;">*</span>
                    </div>
                    <!-- searchbar -->
                    <div class="searchbar-container">
                        <div class="searchbar">
                            <div class="search-input-container">
                                <div class="i-container">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <input id="search-category-input" class="search-input" type="text"
                                    placeholder="카테고리명 입력" name="category" required>
                            </div>
                            <div class="search-btn-container">
                                <button id="search-category-btn" class="search-btn">검색</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 상품 정보 -->
                <div id="category-container" class="enroll-div-container">
                    <div class="container-title">
                        <span>상품 정보</span><span style="color: #d72020;">*</span>
                    </div>
                    <div id="search-product-name-container">
                        <div>상품명</div>
                        <!-- searchbar -->
                        <div class="searchbar-container">
                            <div class="searchbar">
                                <div class="search-input-container">
                                    <input id="search-product-name-input" class="search-input" type="text"
                                        placeholder="상품명 입력(브랜드명 + 제품명)" name="productName" required>
                                </div>
                                <div class="search-btn-container">
                                    <button id="search-product-name-btn" class="search-btn">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="search-product-name-container">
                        <div>브랜드명</div>
                        <div class="second-area">

                            <!-- searchbar -->
                            <div class="searchbar-container">
                                <div class="searchbar">
                                    <div class="search-input-container">
                                        <div class="i-container">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <input id="search-brand-input" class="search-input" type="text"
                                            placeholder="브랜드명 입력" required>
                                    </div>
                                    <div class="search-btn-container">
                                        <button id="search-brand-btn" class="search-btn">검색</button>
                                    </div>
                                </div>
                            </div>

                            <!-- add-btn -->
                            <div class="add-brand-btn-container">
                                <button class="add-brand-btn">브랜드 추가</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 대표 가격 정보 -->
                <div id="product-price-container" class="enroll-div-container">
                    <div class="container-title">
                        <span>대표 가격 정보</span><span style="color: #d72020;">*</span>
                    </div>
                    <div id="insert-product-price-area">
                        <div class="insert-product-price">
                            <div>정상가</div>
                            <div class="price-input-container">
                                <input id="origin-price" class="price-input" type="text"
                                    oninput="calculateDiscountPercent()" required>원
                            </div>
                        </div>

                        <div class="insert-product-price">
                            <div>판매가</div>
                            <div class="price-input-container">
                                <input id="saled-price" class="price-input" type="text"
                                    oninput="calculateDiscountPercent()" required>원
                            </div>
                        </div>
                        <div class="insert-product-price">
                            <div>할인율</div>
                            <div class="price-input-container">
                                <input id="discount-percent" class="price-input" type="text" required disabled>%
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 대표 가격 정보 -->
                <div id="product-price-container" class="enroll-div-container">
                    <div class="container-title">
                        <span>필수 구매옵션</span><span style="color: #d72020;">*</span>
                    </div>
                    <div class="btn-container">
                        <button id="add-option-btn" class="option-btn" onclick="addOption()">옵션 추가</button>
                        <button id="delete-selected-option-btn" class="option-btn" onclick="deleteSelectedOption()">선택
                            삭제</button>
                    </div>

                    <div class="option-table-container">
                        <table id="option-table">
                            <thead>
                                <tr>
                                    <td align="center" class="checkbox-td">삭제</td>
                                    <td align="center" class="checkbox-td">대표옵션</td>
                                    <td align="center" class="option-name-td">옵션명</td>
                                    <td align="center" class="option-quantitiy">재고</td>
                                    <td align="center" class="option-price">정상가</td>
                                    <td align="center">판매가</td>
                                </tr>
                            </thead>
                            <tbody id="option-table-tbody">
                                <tr class="option-tr">
                                    <td align="center">
                                        <input type="checkbox" name="" id="" class="deleteTrCheckBox">
                                    </td>
                                    <td align="center">
                                        <input type="checkbox" name="" id="">
                                    </td>
                                    <td align="center">
                                        <input type="text" id="detailOptionName">
                                    </td>
                                    <td align="center">
                                        <input type="number" class="txt-align-right" placeholder="개"
                                            id="detailOptionQuantity">
                                    </td>
                                    <td align="center">
                                        <input type="number" class="txt-align-right" placeholder="원"
                                            id="detailOptionOriginPrice">
                                    </td>
                                    <td align="center">
                                        <input type="number" class="txt-align-right" placeholder="원"
                                            id="detailOptionSaledPrice">
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

                <div class="enroll-div-container">
                    <div class="container-title">
                        <span>상품 이미지</span>
                    </div>

                    <div id="main-img-area">
                        <div id="main-img-container">
                            대표이미지
                        </div>
                        <div id="input-img-container">
                            <img src="${contextPath }/resources/dummyImg/manage/camera.png" alt="">
                        </div>
                    </div>
                    <input type="file" id="file-input" accept="image/*">
                </div>

                <div class="enroll-div-container">
                    <div class="container-title">
                        <span>상품 설명</span>
                    </div>

                    <div id="summernote-container">
                        <textarea class="summernote" name="editordata"></textarea>
                    </div>
                </div>

                <div class="enroll-div-container">
                    <div class="container-title">
                        <span>배송정보</span><span style="color: #d72020;">*</span>
                    </div>

                    <div class="shipping-method-area">
                        <div class="input-area">
                            <div class="shipping-method-title">배송방법</div>
                            <div>
                                <select name="shipping-method" id="shipping-method">
                                    <option value="">일반택배배송</option>
                                    <option value="">특급택배배송</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-area">
                            <div class="shipping-method-title">배송비</div>
                            <div>
                                <input type="number" id="shipping-fee">원
                            </div>
                        </div>
                        <div class="input-area">
                            <div class="shipping-method-title">배송기간</div>
                            <div>
                                <select name="" id="">
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                </select>일
                            </div>
                        </div>
                    </div>

                </div>


                <div class="enroll-div-container">
                    <button id="enroll-product-btn" type="submit" onclick="enrollProduct()">등록</button>
                </div>


            </div>
        </form>

    </div>

    <jsp:include page="../common/footer.jsp" />

    <script src="${contextPath }/resources/js/manager/enrollProductForm.js"></script>
</body>

</html>