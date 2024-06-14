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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="${contextPath}/resources/js/board/boardDetail.js"></script>
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <c:if test="${not empty msg }">
                <script>
                    alert("${msg }");
                </script>
                <c:remove var="msg" scope="session"/>
            </c:if>
            <main id="board-detail">
                <div id="boardDetailContents">
                    <div id="writerProfile">
                        <div id="profileImg"><img src="${contextPath}/resources/uploadfile/memberProfile/${board.memberThumbnail}"></div>
                        <div id="profileInfo">
                            <div id="profileId"><span>${board.memberNickname}</span></div>
                            <div id="boardCount">
                                <div id="viewCount">조회수<span>${board.boardViews}</span></div>
                                <div id="likeCount">좋아요<span>${board.boardVote}</span></div>
                            </div>
                            <div id="uploadDate"><span>${board.boardCreateDate}</span></div>
                        </div>
                    </div>
                    <div id="contentTitle">
                        <span>${board.boardTitle}</span>
                    </div>
                    <div id="contentDetail">
                    	<div id="contentDetailImg">
                            <img src="${pageContext.request.contextPath}/resources/uploadfile/board/boardMainContentFile/${board.boardThumbnail}"
                                alt="썸네일">
                        </div>
                        <div id="contentDetailWrite"><span>${board.boardContent}</span></div>
                        
                    </div>
                    <div id="contentService">
                        <div id="tagWrapper">
                            <div id="contentTag"><span>${board.boardTag}</span></div>
                        </div>
                        <div id="contentBtnWrapper">
                            <button id="contentLike">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill-rule="evenodd"
                                    clip-rule="evenodd">
                                    <path
                                        d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181" />
                                </svg>
                                <span>${board.boardVote}</span>
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
                        <div id="replyCount-area">댓글
                            <span id="reply-count">(${commentList.size()})</span>
                        </div>
                    </div>
                    <form action="insert.co" method="post">
                        <input type="hidden" name="boardNo" value="${board.boardNo}">
                        <input type="hidden" name="memberNo" value="${loginUser.memberNo}">
                        <div id="replyWriteWrap">
                            <div id="replyWriterInfo">
                            	<c:if test="${not empty loginUser }">
                            		<img
                                    src="<%= request.getContextPath() %>/resources/uploadfile/memberProfile/${loginUser.profile}">
                            	</c:if>
               
                            </div>
                            <c:choose>
                                <c:when test="${empty loginUser}">
                                    <textarea class="reply-input" rows="3" placeholder="로그인 후 이용 가능합니다." disabled
                                        style="background-color: transparent;"></textarea>
                                    <button class="reply-button" disabled>댓글 쓰기</button>
                                </c:when>
                                <c:otherwise>
                                    <textarea id="commentContent" rows="3" placeholder="댓글 내용을 적어주세요." name="commentContent"></textarea>
                                    <button class="reply-button" type="submit">댓글 쓰기</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </form>
                    <div id="ReplyArea">
                        <c:forEach var="comment" items="${commentList}">
                            <c:if test="${comment.refCommentNo == 0}">
                                <div class="userReplyWrap">
                                    <div class="userReplyWriterInfo">
                                        <div class="userReplyWriterImgWrap">
                                            <img src="<%= request.getContextPath() %>/resources/uploadfile/memberProfile/${comment.commentWriterImg}">
                                        </div>
                                        <div class="userReplyContentWrap">
                                            <div class="userReplyWriterDetail">
                                                <input type="hidden" name="" value="${comment.commentNo}" class="comment-no">
                                                <input type="hidden" name="boardNo" value="${board.boardNo}" class="board-no">
                                                <div class="userReplyWriterDetailId">${comment.commentWriter}</div>
                                                <div class="userReplyWriterDetailDate"><span>${comment.commentDate}</span></div>
                                                
                                                <c:if test="${not empty loginUser}">
                                                    <div class="add-reply-btn" onclick="addReply(this)">댓글 달기</div>
                                                    <c:if test="${loginUser.nickname eq comment.commentWriter}">
                                                        <div data-index="${status.index}" class="delete-reply-btn">
                                                            댓글 삭제
                                                        </div>    
                                                    </c:if>
                                                </c:if>
                                            </div>
                                            <div class="userReplyContent">
                                                <span>${comment.commentContent}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ReplyService">
                                        <div class="ReplyReport">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none"
                                                viewBox="0 0 24 24" stroke-width="1" stroke="currentColor" class="w-6 h-6">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M12 9v3.75m0-10.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.25-8.25-3.286Zm0 13.036h.008v.008H12v-.008Z" />
                                            </svg>
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                </div>

                                <c:forEach var="reply" items="${commentList}">
                                <c:if test="${reply.refCommentNo == comment.commentNo}">
                                    <div class="userReplyWrap nested-reply">
                                        <div class="userReplyWriterInfo">
                                            <div class="userReplyWriterImgWrap">
                                                <img src="<%= request.getContextPath() %>/resources/uploadfile/memberProfile/${reply.commentWriterImg}">
                                            </div>
                                            <div class="userReplyContentWrap">
                                                <div class="userReplyWriterDetail">
                                                    <!-- <input type="hidden" name="" value="${reply.commentNo}" class="comment-no">
                                                    <input type="hidden" name="boardNo" value="${board.boardNo}" class="board-no"> -->
                                                    <div class="userReplyWriterDetailId">${reply.commentWriter}</div>
                                                    <div class="userReplyWriterDetailDate"><span>${reply.commentDate}</span></div>
                                                    
                                                    <!-- <c:if test="${not empty loginUser}">
                                                        <div class="add-reply-btn" data-index="${replyStatus.index}" onclick="addReply(this)">댓글 달기</div>
                                                        <c:if test="${loginUser.nickname eq reply.commentWriter}">
                                                            <div data-index="${replyStatus.index}" class="delete-reply-btn">
                                                                댓글 삭제
                                                            </div>    
                                                        </c:if>
                                                    </c:if> -->
                                                </div>
                                                <div class="userReplyContent">
                                                    <span>${reply.commentContent}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ReplyService">
                                            <div class="ReplyReport">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none"
                                                    viewBox="0 0 24 24" stroke-width="1" stroke="currentColor" class="w-6 h-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M12 9v3.75m0-10.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.25-8.25-3.286Zm0 13.036h.008v.008H12v-.008Z" />
                                                </svg>
                                                <span>신고하기</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div id="boardMainReturnWrap">
                    <c:if test="${board.memberNo eq loginUser.memberNo}">
                        <div id="update-btn-area">
                            <button type="button"
                            onclick="moveLocation('${pageContext.request.contextPath}/update-form.bo?boardNo=${board.boardNo}')">수정하기</button>
                        </div>
                    </c:if>

                    <div id="ReturnBtnWrap">
                        <button type="button"
                            onclick="moveLocation('${pageContext.request.contextPath}/main.bo')">목록으로</button>
                    </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>