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
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
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
                    <div id="contentDetail"><span>오늘 밥 머에영?</span></div>
                    <div id="contentService">
                        <div id="tagWrapper">
                            <div id="contentTag"><span>#일상</span></div>
                            <div id="contentTag"><span>#질문</span></div>
                        </div>
                        <div id="contentBtnWrapper">
                            <div id="contentLike"></div>
                            <div id="contentReport"></div>
                        </div>
                        
                    </div>
                    
                </div>
                <div id="boardMainReturnWrap"></div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>