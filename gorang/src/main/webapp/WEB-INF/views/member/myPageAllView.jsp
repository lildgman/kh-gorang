<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/member/MyPage-View.css">
    <script src="${contextPath}/resources/js/member/myPageAllView.js"></script>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />
    
     
    <div id="body-area">
        <!-- 좌측 마이페이지 영역 -->
        <jsp:include page="myPageMenubar.jsp" />
        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <div id="right-body-banner">

                <!-- 버튼 영역(레시피/게시판) -->
                <div id="banner-btn-area">
                    <button id="recipe-btn" class="cl-btn" onclick="recipeImg()">레시피</button>
                    <button id="board-btn" class="cl-btn" onclick="BoardImg()">게시판</button>
                </div>

                <!-- 배너 게시판 인기 이미지영역 -->
                <div id="banner-imgs">
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img (1).png">
                    </div>
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img.png">
                    </div>
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                    </div>
                </div>
                 <!-- 배너 레시피 인기 이미지영역 --> 
                <div id="banner-imgs-recipe">
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img.png">
                    </div>
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img.png">
                    </div>
                    <div class="banner-best-img">
                        <img src="${contextPath}/resources/images/member-img/Img.png">
                    </div>
                </div>

                <script>


                </script>

                <!-- 게시글 사진 더보기 영역(4개) -->
                <div  class="best-board-four">
                    <div class="best-board-text">
                      <span class="best-title"><b>게시글</b></span> <span class="more-vw"><a href="${contextPath}/myRecipeBoard.me">더보기</a></span>
                    </div>
                    <div class="best-board-img">
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                    </div>
                </div>

                <div  class="best-board-four">
                    <div  class="best-board-text">
                      <span class="best-title"><b>스크랩</b></span> <span class="more-vw"><a href="${contextPath}/myPageScrapRecipe.me">더보기</a></span>
                    </div>
                    <div class="best-board-img">
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                    </div>
                </div>


                <div  class="best-board-four">
                    <div  class="best-board-text">
                      <span class="best-title"><b>좋아요</b></span> <span class="more-vw"><a href="${contextPath}/myPageScrapRecipe.me">더보기</a></span>
                    </div>
                    <div class="best-board-img">
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                        <div class="best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>