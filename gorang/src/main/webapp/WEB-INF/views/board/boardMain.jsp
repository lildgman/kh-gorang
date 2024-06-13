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
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
            <script src="${contextPath}/resources/js/board/boardMain.js"></script>
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="board-main">
                <div id="CommonBoardContents">
                    <div id="BoardTagBox">
                        <div id="BoardTagBoxTop">
                            <div class="SpanBox">
                                <span>인기 태그</span>
                            </div>
                        </div>
                        <div id="BoardTagBoxBottom">
                            <div id="PapularTagBox">
                                <div id="PapularTags">
                                    <a id="TagDaily" href="${pageContext.request.contextPath}/main.bo?category=all">#전체</a>
                                </div>
                                <div id="PapularTags">
                                    <a id="TagDaily" href="${pageContext.request.contextPath}/main.bo?category=일상">#일상</a>
                                </div>
                                <div id="PapularTags">
                                    <a id="TagQuestion" href="${pageContext.request.contextPath}/main.bo?category=질문">#질문</a>
                                </div>
                                <div id="PapularTags">
                                    <a id="TagKnowHow" href="${pageContext.request.contextPath}/main.bo?category=노하우">#노하우</a>
                                </div>
                                <div id="PapularTags">
                                    <a id="TagTip" href="${pageContext.request.contextPath}/main.bo?category=꿀팁">#꿀팁</a>
                                </div>
                                <div id="PapularTags">
                                    <a id="TagMethod" href="${pageContext.request.contextPath}/main.bo?category=보관법">#보관법</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="BoardContents">
                        <div id="BoardSortings">
                            <div id="BoardSortingsBox">
                                <a id="SortingsLatest" href="${pageContext.request.contextPath}/main.bo?category=${category}&sort=latest">최신순</a>
                                <a id="SortingsViews" href="${pageContext.request.contextPath}/main.bo?category=${category}&sort=view">조회수순</a>
                                <a id="SortingsScrap" href="${pageContext.request.contextPath}/main.bo?category=${category}&sort=scrap">스크랩순</a>
                            </div>
                        </div>
                        <div class="commonContainer">
                            <c:forEach var="board" items="${boardList}">
                                <div class="common-item" data-board-no="${board.boardNo}">
                                    <div class="common-content-item">
                                        <div id="boardThumbnail">
                                            <img src="${pageContext.request.contextPath}/resources/uploadfile/board/boardMainContentFile/${board.boardThumbnail}" alt="썸네일">
                                        </div>
                                        <div id="commonContentInfoBox">
                                            <div id="boardTitle"><span>${board.boardTitle}</span></div>
                                            <div id="commonContentWriter">
                                                <div id="commonContentWriterImg">
                                                    <img src="<%= request.getContextPath() %>/resources/uploadfile/memberProfile/${board.boardWriterProfileImg}">
                                                </div>
                                                <span>${board.boardWriterNickname}</span>
                                            </div>
                                            <div id="commonContentBoardInfo">
                                                <div id="commonBoardInfoScrap">스크랩 <span>${board.scrapCount}</span></div>
                                                <div id="boardCount">조회수 <span>${board.viewCount}</span></div>
                                                <div id="commonBoardInfoRec">추천수 <span>${board.likeCount}</span></div>
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
                                        <c:choose>
                                            <c:when test="${pi.currentPage eq 1}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#">Previous</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="main.bo?cpage=${pi.currentPage - 1}&category=${category}&sort=${sort}&content=${content}">Previous</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                        
                                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="main.bo?cpage=${p}&category=${category}&sort=${sort}&content=${content}">${p}</a>
                                            </li>
                                        </c:forEach>
                        
                                        <c:choose>
                                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="main.bo?cpage=${pi.currentPage + 1}&category=${category}&sort=${sort}&content=${content}">Next</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
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