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
    <link rel="stylesheet" href="${contextPath }/resources/css/member/myPageQnA.css">
    
</head>
<body>
    
    <%@ include file="../common/header.jsp"%>
    
     
    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <jsp:include page="myPageMenubar.jsp" />

        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <!-- 상품문의 영역 -->
            <div id="product-qna-container">
                <div class="container-top">
                    <span class="container-top-title">상품 문의</span>
                    <span class="container-top-more"><a href="">더보기</a></span>
                </div>
                <div id="product-area" class="content-area">
                    <div id="product-area-top">
                        <div class="content-area-title cl-6d">상품</div>
                        <div class="content-area-comment cl-6d">내용</div>
                        <div class="content-area-date cl-6d">작성일</div>
                        <div class="content-area-answer cl-6d">상태</div>
                    </div>

                    <div id="product-area-body" class="contents-area-body">
                        <div class="product-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #ed6666;">응답 대기</div>
                        </div>

                        <div class="product-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>

                        </div>

                        <div class="product-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>
                        </div>

                        <div class="product-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>
                        </div>

                        <div class="product-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>
                        </div>
                    </div>
                </div>
                 <!-- 페이징 바 -->
                 <div class="pagination-area">
                    <div class="pagination">
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

            <!-- 레시피 문의 영역 -->
            <div id="recipe-qna-container">
                <div class="container-top">
                    <span class="container-top-title">레시피 문의</span>
                    <span class="container-top-more"><a href="">더보기</a></span>
                </div>
                
                <div id="recipe-area" class="content-area">
                    <div id="recipe-area-top">
                        <div class="content-area-title cl-6d">레시피</div>
                        <div class="content-area-comment cl-6d">내용</div>
                        <div class="content-area-date cl-6d">작성일</div>
                        <div class="content-area-answer cl-6d">상태</div>

                    </div>

                    <div id="recipe-area-body" class="contents-area-body">
                        <div class="recipe-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #ed6666;">응답 대기</div>

                        </div>

                        <div class="recipe-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>

                        </div>

                        <div class="recipe-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>

                        </div>

                        <div class="recipe-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>

                        </div>

                        <div class="recipe-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                                <span>참외</span>

                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                            <div class="content-area-answer" style="color: #237805;">응답 완료</div>

                        </div>
                    </div>
                </div>
                <!-- 페이징 바 -->
                <div class="pagination-area">
                   <div class="pagination">
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
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>