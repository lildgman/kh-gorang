<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <!-- css -->
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeList.css">

            <!--js-->
            <!-- jQuery library -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

            <!-- font awesome kit -->
            <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <!-- recipeMain
            <script src="${pageContext.request.contextPath}/resources/js/recipe/recipeList.js"></script> -->

        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            
            <main id="recipe-list">
           
               <!-- 사이드바 -->
				<jsp:include page="../common/sidebar.jsp" />
				
                <div id="recipeListContents">
                    <div id="BoardTagBox">
                        <div id="BoardTagBoxTop">
                            <div id="SpanBox">
                                <span>인기 태그</span>
                            </div>
                        </div>
                        <div id="BoardTagBoxBottom">
                            <div id="PapularTagBox">
                                <div id="PapularTags">
                                    <span>#한식</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#중식</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#일식</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#양식</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#디저트</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#기타</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="recipeCountSpan">
                        <span>총 10,000개의 레시피</span>
                    </div>
                    <div id="recipeContents">
                        <div id="recipeSortings">
                            <div id="recipeSortingsBox">
                                <div id="recipeSortingsLatest">최신순</div>
                                <div id="recipeSortingsNums">조회수순</div>
                                <div id="recupeSortingsScrap">스크랩순</div>
                            </div>
                        </div>
                        <div id="recipeContentsBox">
                            <c:forEach var="a" begin="1" end="4">
                                <div class="recipe-content-box" onclick="location.href='detail.re?rno=${a}'">
                                    <div class="recipe-content-item">
                                        <div id="recipeContentImg">
                                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail${a}.png">
                                        </div>
                                        <div id="recipeContentInfoBox">
                                            <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                            <div id="recipeContentWriter">
                                                <div id="recipeContentWriterImg"><img
                                                        src="${pageContext.request.contextPath}/resources/uploadfile/boardMainContentUserProfile/user1.png">
                                                </div>
                                                <span>abcdefg</span>
                                            </div>
                                            <div id="recipeContentBoardInfo">
                                                <div id="recipeBoardInfoScrap">스크랩
                                                    <span>18</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="recipeBoardPageBarBox">
                            <div id="pagingArea">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item"><a class="page-link" href="#">7</a></li>
                                        <li class="page-item"><a class="page-link" href="#">8</a></li>
                                        <li class="page-item"><a class="page-link" href="#">9</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>