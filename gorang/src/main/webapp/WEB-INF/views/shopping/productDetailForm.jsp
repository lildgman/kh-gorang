<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" href="${contextPath }/resources/css/shopping/productDetail.css">
	
</head>
<body>
	<!-- 헤더 시작-->
    <jsp:include page="../common/header.jsp" />
    <!-- 헤더 끝-->

    <!-- 상품 상세페이지 -->
    <div id="product-detail-container">

        <!-- 상품 간략 정보-->
        <div id="productInfo-area">
            <div id="product-img-container">
                <img class="product-thumbnail" src="${contextPath }/resources/dummyImg/item1.png" alt="">
            </div>

            <div id="product-Information">
                <div id="product_brand">
                    성주
                </div>
                <div id="product_name_area">
                    <span id="product_name">성주 참외 꿀참외 1.5kg</span>
                    <span id="zzim">
                        <svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect width="22" height="21" fill="url(#pattern0_760_50865)"/>
                            <defs>
                            <pattern id="pattern0_760_50865" patternContentUnits="objectBoundingBox" width="1" height="1">
                            <use xlink:href="#image0_760_50865" transform="matrix(0.0149148 0 0 0.015625 0.0227273 0)"/>
                            </pattern>
                            <image id="image0_760_50865" width="64" height="64" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAAXNSR0IArs4c6QAABJFJREFUeF7tm03IVFUYx3+CgQvRdkqSrlwIkRsVF+HCxE2i4KJNIaWigqmLQMrwK43ADzATLPEjRA0CBUMSzFa5EGrjB0S4EjFslYqLxEDvf3ruy/HMnXfunTnn3Jn7vhde3vm4c8/5/87/Oec8z52ZwBg/Joxx/YwDGHdANQKTgFnA64AeT3U+/i/wN/AY+Ae4V+3SXc+O0naZEMgbnm3CFwLzgSnADKfbj4A/gL9M/M/AzT5BRG97NAB54/OApcDbnmBp16g/9ZyQM5EDLgC9gEjWdicA6sCCbPTWOMIlVqP8ELhjj2X3J8BrpvpVYCag/woTHQJxDjgD3O5q9P9DK1nbRQDU+beAtcAK67BEXwOum6BfgPsFYiRandf/JZkD3rTHAncF+Bb43eAVsUjetg9AHXgnm8S2WJxr1P8ELpudfysxgvkpgvCe/b1hL8oB+4AfCyDU0rYLQNbTqO0w8fmoHwcuVhDunqpVQvPHekBziZ4XQfDFx2pb7vvM3NjqpwtgbvZ8t9leHfgpi+VDmSOqjHonTnLAVmB5AQT1wXVdzLbVP7lPLmzNRzkAjcAG4Eub2a8CnwcSn0MpgnAM+A/40HFdSPB523LfF+ZGzUenge0KwxzAIuCAdeIGsLMP248WLT4EdUariPYToUfeD8V3TbTmppFQEAB39NWJb7K1/dMeY77Mx3wI+kxM8e6kvNGcrtdaLhAA7epkfW10fgU+Dmz9IiguhOeB55vRBsENhZYLBGCZjbpseBZ4v8wwBjhHENYBE7P84lQC6OryNGCTrQTKW74WgE/MASns73PTsji5w6YqAOO2S6i9VcAee+eYAJzPkpaVwK3sxV224YnR+KBcU3udw8AcaXcBaL3flm2DtQQ2+dA2fz+grPaqC0DCN1tK22QAyk+0zMv14wDGogPcZb/lgJO2FW1LFBoaB+6yf0kA9rrrou2ZG6q9JUspuoozSvVPCYA2Bvm6OJIkNJSAu+2/CxwUgLbtoZsvNwyEm/S1ln0B0O5IW1LlyC+lig0T7yd93yvc83RYBYmjVr9r4mToV7u061Xxp7UT1KEcWVmgaoFywQ82L4S+uVGXqTpWu9yS2GLgK0BZmoRreTzR542NugS77U63Ha5qHJr5X6p2uQA0F7hVkyZAkPgPgI+s6tRW7fLL4goF3QxZbWExzBB88Q8sC1TxZ+QoujHSBAhF4r8Djvi1h063xoYZQmnxssFoN0eHEUIl8d0A5MvjsMwJlcWXATAsEHoSXxbAoEPoWXwVAIMKoS/xVQEMGoS+xfcCYFAgBBHfK4C6IQQT3w+AuiAEFd8vgNQQgosPASAVhCjiQwGIDSGa+JAAYkGIKj40gNAQoouPASAUhCTiYwHoF0Iy8TEB9AohqfjYAKpCSC4+BYCyEGoRnwpANwjPvNK1qreFBUxdKPRR5hcjodosqjHqdwT6dlpet08qPqUDcog+BPerssnF1wGgKBz0Wi3i6wLgQ3glZcz78ZxyDvDbzn9RonuSbXdsQk083a5TJwD1LfVXZdt41A2g2wBFf38cQHTEA97AC4Fl2VcaoFLrAAAAAElFTkSuQmCC"/>
                            </defs>
                        </svg>                            
                    </span>
                </div>
                <div id="product_grade_area">
                    <span id="product_grade">4.5</span>
                    <span id="product_review_amount">30개 상품평</span>
                </div>
                <div id="product_origin_price">
                    30,000원
                </div>
                <div id="product_discount_price">
                    <span id="product_discount_percent">20%</span>
                    <span id="product_discounted_price">24,000원</span>
                </div>
                <div id="product_etc">
                    <table>
                        <tbody>
                            <tr>
                                <td>판매자</td>
                                <td>고랭</td>
                            </tr>
                            <tr>
                                <td>판매단위</td>
                                <td>1봉</td>
                            </tr>
                            <tr>
                                <td>중량/용량</td>
                                <td>1.5kg 내외</td>
                            </tr>
                            <tr>
                                <td>배송</td>
                                <td>무료배송</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="product_buy_info_area">

                </div>
            </div>
        </div>

        <!-- 상품 상세 정보-->
        <div id="productContent-area">

        </div>
    </div>
	

</body>
</html>