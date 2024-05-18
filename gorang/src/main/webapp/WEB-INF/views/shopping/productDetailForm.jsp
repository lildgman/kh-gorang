<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- font awesome kit -->
    <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" href="${contextPath }/resources/css/default.css">
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
                <img class="product-thumbnail" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
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
                    <div id="product_buy_info">
                        <div id="product_name_amount">
                            <div id="pname">
                                성주 참외 꿀참외 1.5kg
                            </div>
                            <div id="product_amount_price">
                                <div id="pamount_btn">
                                    <div class="pbtn" id="minus_amount">-</div>
                                    <div class="pbtn" id="amount">1</div>
                                    <div class="pbtn" id="plus_amount">+</div>
                                </div>
                                <div id="price">
                                    25,000원
                                </div>
                            </div>
                        </div>
                        <div id="product_buy_btn_container">
                            <button class="btn" id="btn_cart">장바구니 담기</button>
                            <button class="btn btn-primary" id="btn_buy">구매하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 상품 정보-->
        <div id="productContent_area">
            <div id="area_left">

                <!-- 상품네비 -->
                <nav id="product_info_nav">
                    <div id="product_description_div" class="nav_div">상품설명</div>
                    <div id="detail_description_div" class="nav_div">상세설명</div>
                    <div id="product_review_div" class="nav_div">후기</div>
                    <div id="product_qna_div" class="nav_div">문의</div>
                </nav>

                <!-- 상품 설명 -->
                <div id="product_description_area">
                    <div id="product_description_picture">
                        <img id="product_description_img" src="${contextPath }/resources/dummyImg/shopping/product_description.png" alt="상품사진">
                    </div>

                    <div id="product_description_p">
                        <p>경북 성주는 풍부한 일조량, 물 빠짐이 좋은 미사질 토양을 지녀 참외를 재배하기에 최적의 조건을 갖춘 곳인데요. 참외가 참 신선하고 맛이 좋다 싶으면 역시나 성주에서 온 참외이곤 하지요. 
                            컬리는 과실이 통통하게 잘 여문 향긋한 성주 참외를 온 가족이 함께 즐길 수 있는 양으로 담아 준비했어요. 
                            시원한 냉장고 혹은 찬물에 잠시 두었다가 꺼내 먹으면, 참외의 달콤한 향이 더욱 선명하게 느껴질 거예요. 
                            아삭아삭한 식감, 함뿍 배어 나오는 달큰한 과즙을 그대로 음미해 보세요.</p>
                    </div>

                    <div id="product_detail_description">
                        <img id="product_detail_img" src="${contextPath }/resources/dummyImg/shopping/product_detail.png" alt="">
                    </div>
                </div>

                <!-- 상품 후기 -->
                <div id="product_review_area">
                    <div class="description_title">상품 후기</div>
                    <div id="product_review">
                        <div id="review_writer_area">
                            <div id="review_writer_pic_container">
                                <img id="review_writer_pic" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg" alt="">
                            </div>
                            <div id="review_writer_id_rate">
                                <div id="review_writer_id">user01</div>
                                <div id="review_rate">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                </div>
                            </div>
                        </div>
                        <div id="review_product_name">성주 참외 꿀참외 1.5kg</div>
                        <div id="review_img_container">
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                        </div>
                        <div id="review_content">
                            <p>너무 신선하고 달아서 다음에도 구매하려구요 <br>
                                짱짱굿!<br>
                                ㅎㅎㅎ<br>
                            </p>
                        </div>
                        
                    </div>
                    <!-- 상품리뷰 페이지네이션 -->
                    <div id="review_pagination_area">
                        <div id="review_pagination">
                            <a href="#">&lt;</a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">&gt;</a>
                        </div>
                    </div>
                </div>

                <!-- 상품 문의 -->
                <div id="product_qna_area">
                    <div id="qna_top">
                        <div class="description_title">상품 문의</div>
                        <button class="btn btn-primary" style="background-color: #1E90FF; width: 123px; height: 53px; font-size: 20px;">문의하기</button>
                    </div>

                    <table id="qna_content">
                        <thead>
                            <tr>
                                <td class="qna_title">제목</td>
                                <td class="qna_writer">작성자</td>
                                <td class="qna_create_date">작성일</td>
                                <td class="qna_status">답변상태</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="qna_title" style="text-align: left;">유통기한은 어느정도 인가요?</td>
                                <td class="qna_writer">작성자ID</td>
                                <td class="qna_create_date">2024-04-21</td>
                                <td class="qna_status">답변완료</td>
                            </tr>
                            <tr>
                                <td id="qna_answer" colspan="4" style="text-align: left;">
                                    <div id="qna_q">
                                        <span class="span_q_a">Q</span><span>유통기한은 어느정도 인가요?</span>
                                    </div>
                                    <div id="qna_a">
                                        <span class="span_q_a">A</span><span>정해진 소비기한은 없지만 2~3일 내로 섭취하는 것을 권장드립니다.</span>
                                    </div>
                                    <div id="qna_a_date">2024-04-22</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="qna_title" style="text-align: left;">유통기한은 어느정도 인가요?</td>
                                <td class="qna_writer">작성자ID</td>
                                <td class="qna_create_date">2024-04-21</td>
                                <td class="qna_status">답변완료</td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="qna_pagination_area" style="margin-top: 10px;">
                        <div id="qna_pagination">
                            <a href="#">&lt;</a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">&gt;</a>
                        </div>
                    </div>
                </div>
            </div>

            <div id="area_right">

            </div>
        </div>
    </div>
	

</body>
</html>