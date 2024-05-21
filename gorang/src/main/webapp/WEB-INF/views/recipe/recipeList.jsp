<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- css -->
        <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />
        <main id="recipe-list">
            <div id="recipeListContents">
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div class="recipe-content-box">
                            <div class="recipe-content-item">
                                <div id="recipeContentImg">
                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                </div>
                                <div id="recipeContentInfoBox">
                                    <div id="recipeContentTitle"><span>녹즙 그만먹을래요</span></div>
                                    <div id="recipeContentWriter">
                                        <div id="recipeContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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