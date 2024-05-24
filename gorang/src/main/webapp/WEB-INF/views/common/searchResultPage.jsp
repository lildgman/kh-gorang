<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/common/searchResultPage.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="search-result">
                <div id="searchResultContents">
                    <div id="search-item-result">
                        <div id="search-item"><span>참외</span></div><span>의 검색결과</span>
                    </div>
                    <div id="search-item-shopping">
                        <div id="search-item-top">
                            <div id="search-item-shopping-span"><span>쇼핑</span>
                                <div id="shoppingCount"><span>15</span>개</div>
                            </div>
                            <div id="see-more-btn">
                                <input type="button" value="더보기">
                            </div>
                        </div>
                        <div class="container">
                            <c:forEach begin="1" end="4">
                                <div class="item">
                                    <div class="item-thumbnail-area">
                                        <img class="item-thumbnail"
                                            src="${contextPath }/resources/dummyImg/shopping//item1.png" alt="상품1">
                                    </div>
                                    <div class="item-text-area">
                                        <div class="item-title">
                                            <div class="item-brand">성주</div>
                                            <div class="item-name">당도선별 성주 꿀참외 1.5kg(4~7개입)</div>
                                        </div>
                                        <div class="item-price">
                                            <div class="item-origin-price">50,000 <span>원</span></div>
                                            <div>
                                                <span class="discount-percent">20%</span>
                                                <span class="discounted-price">16,900</span><span>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="search-item-recipe">
                        <div id="search-item-top">
                            <div id="search-item-recipe-span"><span>레시피</span>
                                <div id="recipeCount"><span>15</span>개</div>
                            </div>
                            <div id="see-more-btn">
                                <input type="button" value="더보기">
                            </div>
                        </div>
                        <div class="recipeContainer">
                            <c:forEach begin="1" end="8">
                                <div class="recipe-item">
                                    <div class="recipe-content-item">
                                        <div id="recipeContentImg">
                                            <img
                                                src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                        </div>
                                        <div id="recipeContentInfoBox">
                                            <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                            <div id="recipeContentWriter">
                                                <div id="recipeContentWriterImg"><img
                                                        src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png">
                                                </div>
                                                <span>abcdefg</span>
                                            </div>
                                            <div id="recipeContentBoardInfo">
                                                <div id="recipeBoardInfoScrap">스크랩 <span>18</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="search-item-common">
                        <div id="search-item-top">
                            <div id="search-item-common-span"><span>게시글</span>
                                <div id="commonCount"><span>15</span>개</div>
                            </div>
                            <div id="see-more-btn">
                                <input type="button" value="더보기">
                            </div>
                        </div>
                        <div class="commonContainer">
                            <c:forEach begin="1" end="8">
                                <div class="common-item">
                                    <div class="common-content-item">
                                        <div id="commonContentImg">
                                            <img
                                                src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                        </div>
                                        <div id="commonContentInfoBox">
                                            <div id="commonContentTitle"><span>CSS 텍스트 양이 어느정도가 적당할지를 고민중</span></div>
                                            <div id="commonContentWriter">
                                                <div id="commonContentWriterImg"><img
                                                        src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png">
                                                </div>
                                                <span>abcdefg</span>
                                            </div>
                                            <div id="commonContentBoardInfo">
                                                <div id="commonBoardInfoScrap">스크랩 <span>18</span></div>
                                                <div id="commonBoardInfoView">조회수
                                                    <span>32</span>
                                                </div>
                                                <div id="commonBoardInfoRec">추천수
                                                    <span>12</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>