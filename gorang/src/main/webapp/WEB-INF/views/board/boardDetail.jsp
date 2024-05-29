<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>


            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/board/boardDetail.css">
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="board-detail">
                <div id="boardDetailContents">
                    <div id="writerProfile">
                        <div id="profileImg"><img
                                src="<%= request.getContextPath() %>/resources/dummyImg/profileImg.png"></div>
                        <div id="profileInfo">
                            <div id="profileId"><span>유저 아이디</span></div>
                            <div id="boardCount">
                                <div id="viewCount">조회수<span>10</span></div>
                                <div id="likeCount">좋아요<span>10</span></div>
                            </div>
                            <div id="uploadDate"><span>2024-04-06</span></div>
                        </div>
                    </div>
                    <div id="contentTitle">
                        <span>게시글 제목</span>
                    </div>
                    <div id="contentDetail">
                        <div id="contentDetailWrite"><span>오늘 밥 머에영?</span></div>
                        <div id="contentDetailImg">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder1.jpg"
                            alt=""></div>
                    </div>
                    <div id="contentService">
                        <div id="tagWrapper">
                            <div id="contentTag"><span>#일상</span></div>
                            <div id="contentTag"><span>#질문</span></div>
                        </div>
                        <div id="contentBtnWrapper">
                            <button id="contentLike">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill-rule="evenodd"
                                    clip-rule="evenodd">
                                    <path
                                        d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181" />
                                </svg>
                                <span>10</span>
                            </button>
                            <button id="contentReport">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="none"
                                    viewBox="0 0 24 24" stroke-width="1" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M12 9v3.75m0-10.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.25-8.25-3.286Zm0 13.036h.008v.008H12v-.008Z" />
                                </svg>
                                <span>신고하기</span>
                            </button>
                            <!-- The Modal -->
                            <div id="myModal" class="modal">
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <br>
                                    <p>게시글 신고하기</p>
                                    <div class="modal-content-top">
                                        <span>신고 게시글</span>
                                        <br>
                                        <input type="text" class="contentTitleInput" placeholder="게시글 제목">
                                    </div>
                                    <div class="modal-content-body">
                                        <span>신고 사유</span>
                                        <br>
                                        <div class="reportReasonSelectBox">
                                            <div>
                                                <input type="checkbox" id="reason">
                                                <label for="reason">스팸/홍보 도배 게시글입니다.</label><br>
                                            </div>
                                            <div><input type="checkbox" id="reason">
                                                <label for="reason">음란물입니다.</label><br>
                                            </div>
                                            <div>
                                                <input type="checkbox" id="reason">
                                                <label for="reason">불법 정보를 포함하고 있습니다.</label><br>
                                            </div>

                                            <div><input type="checkbox" id="reason">
                                                <label for="reason">청소년에 유해한 내용을 포함하고 있습니다.</label><br>
                                            </div>
                                            <div><input type="checkbox" id="reason">
                                                <label for="reason">욕설/혐오/차별적 표현을 포함하고 있습니다.</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-content-bottom">
                                        <span>상세 내용</span>
                                        <br>
                                        <input type="text" class="contentReasonDetail" placeholder="상세 내용을 입력해주세요">
                                    </div>
                                    <div class="modal-content-reportBtn">
                                        <input type="button" value="신고하기">
                                    </div>
                                </div>
                            </div>

                            <script>
                                // Get the modal
                                var modal = document.getElementById("myModal");

                                // Get the button that opens the modal
                                var btn = document.getElementById("contentReport");

                                // Get the <span> element that closes the modal
                                var span = document.getElementsByClassName("close")[0];

                                // When the user clicks the button, open the modal 
                                btn.onclick = function () {
                                    modal.style.display = "block";
                                }

                                // When the user clicks on <span> (x), close the modal
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }

                                // When the user clicks anywhere outside of the modal, close it
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            </script>
                        </div>


                    </div>
                    <div id="replyCountWrap">
                        <div id="replyCount">댓글
                            <span>(2)</span>
                        </div>
                    </div>
                    <div id="replyWriteWrap">
                        <div id="replyWriterInfo">
                            <img
                                src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png">
                        </div>
                        <textarea class="reply-input" rows="3" placeholder="댓글 내용을 적어주세요"></textarea>
                        <button class="reply-button">댓글 쓰기</button>
                    </div>
                    <div id="ReplyArea">
                        <div id="userReplyWrap">
                            <div id="userReplyWriterInfo">
                                <div id="userReplyWriterImgWrap">
                                    <img
                                        src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png">
                                </div>
                                <div id="userReplyContentWrap">
                                    <div id="userReplyWriterDetail">
                                        <div id="userReplyWriterDetailId">유저아이디</div>
                                        <div id="userReplyWriterDetailDate"><span>2024-04-22</span></div>
                                    </div>
                                    <div id="userReplyContent">
                                        <span>오늘점심은 제육이에요 </span>
                                    </div>
                                </div>
                            </div>
                            <div id="ReplyService">
                                <div id="ReplyReport">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none"
                                        viewBox="0 0 24 24" stroke-width="1" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M12 9v3.75m0-10.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.25-8.25-3.286Zm0 13.036h.008v.008H12v-.008Z" />
                                    </svg>
                                    <span>신고하기</span>
                                </div>
                            </div>
                        </div>
                        <div id="userReplyWrap">
                            <div id="userReplyWriterInfo">
                                <div id="userReplyWriterImgWrap">
                                    <img
                                        src="<%= request.getContextPath() %>/resources/uploadfile/boardMainContentUserProfile/user1.png">
                                </div>
                                <div id="userReplyContentWrap">
                                    <div id="userReplyWriterDetail">
                                        <div id="userReplyWriterDetailId">유저아이디</div>
                                        <div id="userReplyWriterDetailDate"><span>2024-04-22</span></div>
                                    </div>
                                    <div id="userReplyContent">
                                        <span>오늘점심은 제육이에요 </span>
                                    </div>
                                </div>
                            </div>
                            <div id="ReplyService">
                                <div id="ReplyReport">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none"
                                        viewBox="0 0 24 24" stroke-width="1" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M12 9v3.75m0-10.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.25-8.25-3.286Zm0 13.036h.008v.008H12v-.008Z" />
                                    </svg>
                                    <span>신고하기</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="boardMainReturnWrap">
                    <div id="ReturnBtnWrap">
                        <button type="button" onclick="moveLocation('${pageContext.request.contextPath}/main.bo')">목록으로</button>
                    </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>