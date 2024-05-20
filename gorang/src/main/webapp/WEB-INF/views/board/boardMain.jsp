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
                        <div id="BoardContentsBox">
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg1.png">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>녹즙 그만먹을래요</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-05-17</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg2.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>강아지 귀엽죠</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg3.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>난 유령</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg4.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>내 사진모음</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg5.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이1</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg6.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이2</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg7.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이3</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg8.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이4</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg9.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이5</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg10.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>고양이6</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg11.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>안데스산맥</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg12.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>록키산맥</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg13.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>스위스 융프라우 여름</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg14.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>마테호른</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg15.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>휴양지</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
                            <div class="content-box">
                                <div class="content-item">
                                    <div id="ContentImg">
                                        <img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentFile/boardImg16.jpg">
                                    </div>
                                    <div id="ContentInfoBox">
                                        <div id="ContentTitle"><span>햄스터</span></div>
                                        <div id="ContentWriter">
                                            <div id="ContentWriterImg"><img src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png"></div>
                                            <span>abcdefg</span>
                                        </div>
                                        <div id="ContentBoardInfo">
                                            <div id="BoardInfoScrap">스크랩
                                                <span>18</span>
                                            </div>
                                            <div id="BoardInfoView">조회수
                                                <span>32</span>
                                            </div>
                                            <div id="BoardInfoRec">추천수
                                                <span>12</span>
                                            </div>
                                        </div>
                                        <div id="ContentUploadDate"><span>2024-04-03</span></div>
                                    </div>
                                </div>
                                <!-- 나머지 15개의 컨텐츠 아이템도 동일한 구조로 추가 -->
                            </div>
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