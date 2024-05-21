<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>


            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/member/myPageWithDraw.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="myPage-With-Draw">
                <div id="withDrawContent">
                    <div id="withDrawWrap">
                        <div id="withDrawSpan"><span>회원탈퇴</span></div>
                        <hr style="width: 100%; border: 2px #000 solid; opacity: unset;">
                        <div id="requirePwd">
                            <span>*비밀번호 확인</span>
                            <span>안전한 개인정보 보호를 위해 비밀번호를 입력해주세요.</span>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>