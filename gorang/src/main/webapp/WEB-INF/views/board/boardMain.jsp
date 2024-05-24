<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/board/boardMain.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="board-main">
                <div id="CommonBoardContents">
                    <div id="BoardTagBox">
                        <div id="BoardTagBoxTop">
                            <div id="SpanBox">
                                <span>인기 태그</span>
                            </div>
                        </div>
                        <div id="BoardTagBoxBottom">
                            <div id="PapularTagBox">
                                <div id="PapularTags">
                                    <span>#일상</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#질문</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#노하우</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#꿀팁</span>
                                </div>
                                <div id="PapularTags">
                                    <span>#보관법</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="BoardContents">
                        <div id="BoardSortings">
                            <div id="BoardSortingsBox">
                                <div id="SortingsLatest">최신순</div>
                                <div id="SortingsNums">조회수순</div>
                                <div id="SortingsScrap">스크랩순</div>
                            </div>
                        </div>
                        <div class="commonContainer">
                            <c:forEach begin="1" end="16">
                                <div class="common-item">
                                    <div class="common-content-item">
                                        <div id="commonContentImg">
                                            <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                        </div>
                                        <div id="commonContentInfoBox">
                                            <div id="commonContentTitle"><span>CSS 텍스트 양이 어느정도가 적당할지를 고민중</span></div>
                                            <div id="commonContentWriter">
                                                <div id="commonContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
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
                        <div id="BoardPageBarBox">
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