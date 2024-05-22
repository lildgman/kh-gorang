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
    <link rel="stylesheet" href="${contextPath }/resources/css/member/myPageReplyReview.css">
    
</head>
<body>
    
    <%@ include file="../common/header.jsp"%>
    
     
    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <jsp:include page="myPageMenubar.jsp" />
        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <!-- 나의 댓글 영역 -->
            <div id="reply-container">
                <div class="container-top">
                    <span class="container-top-title">나의 댓글</span>
                    <span class="container-top-more"><a href="">더보기</a></span>
                </div>
                <div id="reply-area" class="content-area">
                    <div id="reply-area-top">
                        <div class="content-area-title cl-6d">게시글</div>
                        <div class="content-area-comment cl-6d">내용</div>
                        <div class="content-area-date cl-6d">작성일</div>
                    </div>

                    <div id="reply-area-body" class="contents-area-body">
                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 나의 후기 영역 -->
            <div id="review-container">
                <div class="container-top">
                    <span class="container-top-title">나의 후기</span>
                    <span class="container-top-more"><a href="">더보기</a></span>
                </div>
                
                <div id="reply-area" class="content-area">
                    <div id="reply-area-top">
                        <div class="content-area-title cl-6d">게시글</div>
                        <div class="content-area-comment cl-6d">내용</div>
                        <div class="content-area-date cl-6d">작성일</div>
                    </div>

                    <div id="reply-area-body" class="contents-area-body">
                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>

                        <div class="contents-area-content">
                            <div class="content-area-title">
                                <img class="content-img" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
                            </div>
                            <div class="content-area-comment">맛있겠네요!</div>
                            <div class="content-area-date">2024.02.12</div>
                        </div>
                    </div>
                    
                    

                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>