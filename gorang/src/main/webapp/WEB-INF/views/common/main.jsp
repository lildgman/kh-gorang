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
    <link rel="stylesheet" href="${contextPath }/resources/css/common/main.css">
	<script src="${pageContext.request.contextPath}/resources/js/common/main.js"></script>
    
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="../common/header.jsp" />
    
    
    <div id="main-container">
        <!-- 배너 -->
        <div id="main-banner-area">
            <div class="main-banner" data-type="recipe" data-no="5" onclick="moveDetailPage(this)">
                <img class="main-banner-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(3).jpg" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                                    떠오르고 있는 <br>
                                    신흥 밥도둑
                    </div>
                    <div class="sub-comment">창녕갈릭 삼치 조림</div>
                </div>
            </div>

            <div class="main-banner" data-type="recipe" data-no="16" onclick="moveDetailPage(this)">
                <img class="main-banner-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBanner.png" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                        집에서도 즐기는<br>
                                   레스토랑 스테이크
                    </div>
                    <div class="sub-comment">블루베리 소스 스테이크</div>
                </div>
            </div>

            <div class="main-banner" data-type="recipe" data-no="1" onclick="moveDetailPage(this)">
                <img class="main-banner-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(1).jpg" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                                    크레이프와 카라멜의<br>
                                    환상적인 조합
                    </div>
                    <div class="sub-comment">솔티드 딸바 크레페</div>
                </div>
            </div>

        	
        </div>

        <!-- 금주의 리스트 -->
        <div id="main-content-area">
            <!-- 금주의 레시피 -->
            <div id="weekly-best-recipe-container"  class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 레시피</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/list.re">더보기</a></span>
                </div>
    
                <div class="weekly-best-list">
                <!-- 레시피 리스트 -->
                    <div class="weekly-recipe">
                        <div class="weekly-item-img-container" data-type="recipe" data-no="4" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(4).jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_1">돈까스를 넣고 잘 말아준 인기만점 김밥!</div>
                            <div class="info_2">돈까스 김밥</div>
                        </div>
                    </div>

                    <div class="weekly-recipe">
                        <div class="weekly-item-img-container" data-type="recipe" data-no="2" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(2).jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_1">통삼겹살과 차슈양념이면 충분해요.</div>
                            <div class="info_2">차슈덮밥</div>
                        </div>
                    </div>

                    <div class="weekly-recipe">
                        <div class="weekly-item-img-container" data-type="recipe" data-no="" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(3).jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_1">밥도둑 생선 조림 레시피를 소개합니다.</div>
                            <div class="info_2">창녕갈릭 삼치 조림</div>
                        </div>
                    </div>

                    <div class="weekly-recipe">
                        <div class="weekly-item-img-container" data-type="recipe" data-no="1" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/recipe/recipemain/recipeBoardImg(1).jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_1">크레이프와 솔티드 카라멜의 단짠 조합!</div>
                            <div class="info_2">솔티드 딸바 크레페</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 금주의 베스트 상품 -->
            <div id="weekly-best-product-container" class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 베스트 상품</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/list.po">더보기</a></span>
                </div>

                <!-- 상품 리스트 -->
                <div class="weekly-best-list">     
                    <div class="weekly-product">
                        <div class="weekly-item-img-container" data-type="product" data-no="2" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/product/productimg/과일1.jpeg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_title">
                                <div class="product-brand">고랭지</div>
                                <div class="product-name">고랭지 부사 사과 1.3kg(4~5입)</div>
                            </div>
                            <div class="info_price">
                                <div class="product-origin-price">24,900원</div>
                                <div class="product-sale-info">
                                    <span class="product-discount-percent">5%</span>
                                    <span class="product-saled-price">22,900원</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="weekly-product">
                        <div class="weekly-item-img-container" data-type="product" data-no="48" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/product/productimg/육류11.jpeg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_title">
                                <div class="product-brand">조인</div>
                                <div class="product-name">[조인] 동물복지 유정 구운란 20구</div>
                            </div>
                            <div class="info_price">
                                <div class="product-origin-price">13,500원</div>
                                <div class="product-sale-info">
                                    <span class="product-discount-percent">18%</span>
                                    <span class="product-saled-price">12,250원</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="weekly-product">
                        <div class="weekly-item-img-container" data-type="product" data-no="71" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/product/productimg/빵8.jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_title">
                                <div class="product-brand">사층빵집</div>
                                <div class="product-name">[사층빵집] 마카롱 10종 (택1)</div>
                            </div>
                            <div class="info_price">
                                <div class="product-origin-price">6,500원</div>
                                <div class="product-sale-info">
                                    <span class="product-discount-percent">5%</span>
                                    <span class="product-saled-price">6,175원</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="weekly-product">
                        <div class="weekly-item-img-container" data-type="product" data-no="86" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/product/productimg/유제품4.jpg" alt="">
                        </div>
                        <div class="weekly-item-info-container">
                            <div class="info_title">
                                <div class="product-brand">Fage</div>
                                <div class="product-name">[Fage] 파예 플레이버 요거트 150g 3종 (택1)</div>
                            </div>
                            <div class="info_price">
                                <div class="product-origin-price">6,400원</div>
                                <div class="product-sale-info">
                                    <span class="product-discount-percent">14%</span>
                                    <span class="product-saled-price">5,500원</span>
                                </div>
                            </div>
                        </div>
                    </div>                                     
                </div>
            </div>

            <!-- 금주의 노하우 -->
            <div id="weekly-best-board-container" class="weekly-best-list-container">
                <div class="list-top">
                    <span class="list-title">금주의 노하우</span>
                    <span class="show-more-span"><a href="${pageContext.request.contextPath}/main.bo?category=노하우">더보기</a></span>
                </div>

                <!-- 노하우 리스트 -->
                <div class="weekly-best-list flex-gap-20 fl-jc-sb">
                    <div class="weekly-board flex-gap-16px">
                        <div class="board-img-container" data-type="board" data-no="10" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/board/boardMainContentFile/boardThumbnail_10.jpg" alt="">
                        </div>
                        <div class="board-title-container">
                            <div>먹다 남은 캔식품 보관법</div>
                        </div>
                    </div>

                    <div class="weekly-board flex-gap-16px">
                        <div class="board-img-container" data-type="board" data-no="9" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/board/boardMainContentFile/boardThumbnail_9.jpg" alt="">
                        </div>
                        <div class="board-title-container">
                            <div>저만의 생선 손질 방법</div>
                        </div>
                    </div>

                    <div class="weekly-board flex-gap-16px">
                        <div class="board-img-container" data-type="board" data-no="7" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/board/boardMainContentFile/boardThumbnail_7.jpg" alt="">
                        </div>
                        <div class="board-title-container">
                            <div>요리하고 남은 식재료 처리 방법</div>
                        </div>
                    </div>

                    <div class="weekly-board flex-gap-16px">
                        <div class="board-img-container" data-type="board" data-no="2" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/board/boardMainContentFile/boardThumbnail_2.jpg" alt="">
                        </div>
                        <div class="board-title-container">
                            <div>저만의 식재료를 잘 고르는 노하우!</div>
                        </div>
                    </div>

                    <!-- <div class="weekly-board flex-gap-16px">
                        <div class="board-img-container" data-type="board" data-no="2" onclick="moveDetailPage(this)">
                            <img class="weekly-item-img" src="${contextPath}/resources/uploadfile/board/boardMainContentFile/2024052819230192378.jpeg" alt="">
                        </div>
                        <div class="board-title-container">
                            <div>두번째 게시글입니다 여러분 반가워요</div>
                        </div>
                    </div> -->
                    
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>