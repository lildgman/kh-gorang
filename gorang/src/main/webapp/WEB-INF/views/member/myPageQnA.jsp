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
        <div id="left-body-area">
            <div id ="user-info">
                <div id="user-profile-area">
                    <div id="user-profile">
                        <img src="${contextPath}/resources/images/member-img/120X120.png" alt="화원 프로필">
                    </div>
                    <div id="user-profile-pencil">
                        <img src="${contextPath}/resources/images/member-img/Icon_Edit.png" ale="프로필 사진 버튼">
                    </div>
                </div>
                <div id="user-nickgrade-area">
                    <a href="">닉네임 자리</a> <img src="${contextPath}/resources/images//member-img/Vector 340.png" alt=">" id="bector">
                    <br>
                    <div id="user-follow">
                        <div id="user-follower"><a href="">팔로워 0</a></div> | 
                        <div id="user-following"><a href="">팔로잉 0</a></div>
                    </div>
                    <div id="user-grade">
                        브론즈등급
                    </div>
                </div>
                <div id="user-profile-area-line">
                    <hr>  
                </div>
                <div id="user-profile-area-bottom">
                    <div id="user-scrape">
                        <a href="">스크랩</a><br><div class="zero">0</div>
                    </div>
                    <div id="user-like">
                        <a href="">좋아요</a><br><div class="zero">0</div>
                    </div>
                    <div id="user-alarm">
                        <a href="">알림</a><br><div class="zero">0</div>
                    </div>
                  
                </div>
            </div>
            <div id="user-menu">
                <ul id="left-user-menu-list">
                    <li><a  href="" style="color: #1e90ff;">모두 보기</a></li>
                    <li style="font-size: 18px;  font-weight: bold;" id="myboard">나의 게시글
                       <ul id="myboard-list">
                            <li><a  href="" class="myboard-list-in">나의 레시피 게시글</a></li>
                            <li><a  href="" class="myboard-list-in">나의 자유 게시글</a></li>
                        </ul>
                    </li>
                    <li><a  href="">댓글 & 후기</a></li>
                    <li><a  href="">문의</a></li>
                    <li><a  href="">나의 냉장고</a></li>
                    <li><a  href="">구매내역</a></li>
                    <li><a  href="">스크랩</a></li>
                    <li><a  href="">좋아요</a></li>
                    <li><a  href="">정보 수정</a></li>
                </ul>
            </div>
        </div>

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
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>