<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/common/main.css">
    
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />
    
    <div id="main-container">
        <div id="main-banner-area">
            <div class="main-banner">
                <img class="main-banner-img" src="${contextPath}/resources/dummyImg/common/main/banner1.png" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                        심플한 재료, 풍부한 맛<br>
                        진정한 집밥의 매력
                    </div>
                    <div class="sub-comment">편안함과 따뜻함을 담은 요리</div>
                </div>
            </div>
            <div class="main-banner">
                <img class="main-banner-img" src="${contextPath}/resources/dummyImg/common/main/banner2.png" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                        심플한 재료, 풍부한 맛<br>
                        진정한 집밥의 매력
                    </div>
                    <div class="sub-comment">편안함과 따뜻함을 담은 요리</div>
                </div>
            </div>
            <div class="main-banner">
                <img class="main-banner-img" src="${contextPath}/resources/dummyImg/common/main/banner3.png" alt="">
                <div class="main-banner-comment">
                    <div class="main-comment">
                        심플한 재료, 풍부한 맛<br>
                        진정한 집밥의 매력
                    </div>
                    <div class="sub-comment">편안함과 따뜻함을 담은 요리</div>
                </div>
            </div>
        </div>
        <div id="main-content-area">

        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>