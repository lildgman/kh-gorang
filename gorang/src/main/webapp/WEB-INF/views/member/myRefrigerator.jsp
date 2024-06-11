<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/member/myRefrigerator.css">

        </head>

        <body>
            <div class="header">
                <jsp:include page="../common/header.jsp" />
            </div>
            <div id="body-area">
                <!-- 왼쪽 프로필 메뉴바영역 -->
                <jsp:include page="myPageMenubar.jsp" />
                <!-- 우측 메인영역 -->
                <div id="right-body-area">
                    <!-- 추천레시피 전체영역 -->
                    <div id="recommend-recipe-area">
                        <!-- 추천레시피 제목영역 -->
                        <div id="right-recommend-recipe-title-area">
                            <div id="recommend-recipe-texthead">
                                추천 레시피
                            </div>
                            <div id="recommend-recipe-modal-btn">
                                <button id="viewModalBtn" onclick="viewModal()">
                                    직접레시피 찾기
                                </button>
                            </div>
                        </div>

                        <!-- 추천레시피 이미지영역 -->
                        <div id="recommend-recipe-imgs">
                            <div>
                                <span>레시피를 추천받아보세요!</span>
                            </div>
                            <!-- <div class="recommend-recipe-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img (1).png">
                    </div>
                    <div class="recommend-recipe-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img.png">
                    </div>
                    <div class="recommend-recipe-best-img">
                        <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                    </div> -->
                        </div>
                    </div>

                    <!-- 나의 냉장고 전체 영역 -->
                    <div id="myRefrigerator-area">
                        <!-- 나의 냉장고 제목 -->
                        <div id="myRefrigerator-text-title-area">
                            <div id="myRefrigerator-texthead">
                                나의 냉장고
                            </div>
                            <div id="myRefrigerator-modal-btn">
                                <button id="viewModalBtn-two">
                                    + 추가하기
                                </button>
                            </div>
                        </div>

                        <!-- 나의 냉장고 식재료내역 -->
                        <div id="myRefrigerator-igre-area">
                            <div id="myRefrigerator-igre-table-area">
                                <table>
                                    <thead id="myRefrigerator-tb">
                                        <tr class="myRefrigerator-tr">
                                            <td>상품</td>
                                            <td>신선도</td>
                                            <td>소비기한</td>
                                            <td>냉장고 입고일</td>
                                            <td>개수</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class=".tr-block">
                                            <td class="myRefrigerator-tr">
                                                <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (2).png"
                                                    alt=""> 참외
                                            </td>
                                            <td class="flesh-area">
                                                <div class="flesh-status" style="background-color:#7ADC66 ;"></div> 신선
                                            </td> <!--나중에 class id로 변경-->
                                            <td>2024.08.05</td>
                                            <td>2024.02.12</td>
                                            <td>5</td>
                                            <td class="myRefrigerator-last-td">삭제</td>
                                        </tr>
                                        <tr class=".tr-block">
                                            <td class="myRefrigerator-tr">
                                                <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (3).png"
                                                    alt=""> 브로콜리
                                            </td>
                                            <td class="flesh-area">
                                                <div class="flesh-status " style="background-color:#EE6677 ;"> </div>위험
                                            </td>
                                            <td>2024.05.10</td>
                                            <td>2024.03.12</td>
                                            <td>5</td>
                                            <td class="myRefrigerator-last-td ">삭제</td>
                                        </tr>
                                        <tr class=".tr-block">
                                            <td class="myRefrigerator-tr">
                                                <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (4).png"
                                                    alt=""> 제주 흑돼지 삼겹살
                                            </td>
                                            <td class="flesh-area">
                                                <div class="flesh-status" style="background-color:#FFE188 ;"> </div>보통
                                            </td>
                                            <td>2024.05.31</td>
                                            <td>2024.04.10</td>
                                            <td>3</td>
                                            <td class="myRefrigerator-last-td">삭제</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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

                    <!-- 모달 창 레시피 찾기 -->
                    <div id="myModal" class="modal">
                        <div id="modal-content-recipe-find">
                            <div id="modal-title-header">
                                레시피 찾기
                            </div>

                            <div id="modal-search-igre">
                                <input id="input-igretext" placeholder=" 식품명 입력"
                                    onkeypress="handleKeyPress(event)"></input>
                                <button onclick="findSearch()">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/search 3.png"
                                        alt="">
                                </button>
                            </div>

                            <div id="list-igre-area">
                                <button id="selectAll-btn" onclick="findSelectAll()">모두선택</button>
                            </div>

                            <div id="list-title">
                                <span id="first-list-title">식품명</span>
                                <span id="second-list-title">소비기한</span>
                            </div>
                            <div id="overflow-recipe-area">
                            </div>

                            <div id="modal-search-recipe-bottom">
                                <button id="closeModalBtn" class="close">닫 기</button>
                                <button id="completeModalBtn" class="complete">완 료</button>
                            </div>
                        </div>
                    </div>

                    <!-- 모달 창 식재료 추가 -->
                    <div id="myModal-two" class="modal-two">
                        <div id="modal-content-recipe-add">
                            <div id="modal-title-recipe-header">
                                식재료 추가하기
                            </div>

                            <div id="modal-search-igre2">
                                <div class="refri-input-wrapper">
                                    <input id="refri-input-foodName" class="refri-foodNutri-input" placeholder=" 식품명 입력"
                                        onkeypress="handleKeyPress2(event)">
                                    <input id="refri-input-maker" class="refri-foodNutri-input" placeholder="제조사명 입력"
                                        onkeypress="handleKeyPress2(event)">
                                </div>
                                <button id="find-nutri-btn">
                                    <img src="${pageContext.request.contextPath}/resources/images/member-img/search 3.png"
                                        alt="">
                                </button>
                            </div>

                            <div id="list-igre-area2">
                                <button id="selectAll-btn2" onclick="addSelectAll()">모두선택</button>
                                <button id="addAll-btn2">추 가</button>
                            </div>

                            <div id="overflow-recipe-area2">
                                <table id="overflow-table">
                                    <thead>
                                        <tr id="list-title2">
                                            <th style="width: 40px; height: 100%;"><input type="checkbox" id="modal-ingre-checkBox"></th>
                                            <th id="add-list-title1" style="width: 60px;">번호</th>
                                            <th id="add-list-title2" style="width: 200px;">식품명</th>
                                            <th style="width: 100px;">대분류</th>
                                            <th id="add-list-title3" style="width: 120px;">영양성분</th>
                                            <th id="add-list-title4" style="width: 220px;">소비기한</th>
                                        </tr>
                                    </thead>
                                    <tbody id="modal-ingre-tbody">

                                    </tbody>
                                </table>
                            </div>
                            <div id="modal-search-recipe-bottom2">
                                <button id="closeModalBtn2" class="close">닫 기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 영양성분표 모달 -->
                    <div class="modal fade nutrition-modal" id="nutritionModal" tabindex="-1" role="dialog"
                        aria-labelledby="nutritionModalLabel" aria-hidden="true">
                        <div class="modal-dialog nutrition-modal-container" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="nutritionModalLabel">영양정보</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="nutrition-table">
                                    </table>
                                    <p class="disclaimer">1일 영양성분 기준치에 대한 비율(%)은 2000kcal 기준이며, 개인의 필요 열량에 따라 다를
                                        수 있습니다.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../common/footer.jsp" />
            <!-- js -->
            <script src="${contextPath}/resources/js/member/myPageRefrigerator.js"></script>
        </body>

        </html>