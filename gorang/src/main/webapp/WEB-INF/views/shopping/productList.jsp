<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${contextPath }/resources/css/shopping/storeList.css">
</head>

<body>
    <!-- 헤더 시작-->
    <jsp:include page="../common/header.jsp" />
    <!-- 헤더 끝-->

    <!-- 컨텐츠 시작 -->
    <div id="productList-container">
        <!-- 카테고리 시작 -->
        <div id="category-area">
            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/vaget.png" alt="야채">
                </div>
                <div class="category-name">
                    야채
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/fruit.png" alt="과일">
                </div>
                <div class="category-name">
                    과일
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/fish.png" alt="육류">
                </div>
                <div class="category-name">
                    육류
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/meat.png" alt="어류">
                </div>
                <div class="category-name">
                    어류
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/bread.png" alt="빵">
                </div>
                <div class="category-name">
                    빵
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/noodle.png" alt="면">
                </div>
                <div class="category-name">
                    면
                </div>
            </div>

            <div class="store-category">
                <div class="category-image-area">
                    <img class="category-image" src="${contextPath }/resources/dummyImg/dairy.png" alt="유제품">
                </div>
                <div class="category-name">
                    유제품
                </div>
            </div>
        </div>
        <!-- 카테고리 끝 -->

        <!-- 상품 리스트 시작 -->
        <div id="productList-area" style="margin-top: 40px;">
            <!-- 정렬 방식 -->
            <div id="product-order-area">
                <div id="product-order">
                    <span class="order">최신순</span> |
                    <span class="order">조회수순</span> |
                    <span class="order">스크랩순</span>
                </div>
            </div>

            <!--상품 리스트 시작-->
            <div id="product-list">

                <!-- 상품 -->
                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item2.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item3.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item4.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item2.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item3.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item4.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item2.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item3.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item4.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item2.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item3.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="item-thumbnail-area">
                        <img class="item-thumbnail" src="${contextPath }/resources/dummyImg/item4.png" alt="상품1">
                    </div>
                    <div class="item-text-area">
                        <div class="item-title">
                            <div class="item-brand">성주</div>
                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                        </div>
                        <div class="item-price">
                            <div class="item-origin-price">50,000</div>
                            <div>
                                <span class="discount-percent">20%</span>
                                <span class="discounted-price">16,900</span>
                            </div>
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


    <!-- 컨텐츠 끝 -->
</body>
</html>