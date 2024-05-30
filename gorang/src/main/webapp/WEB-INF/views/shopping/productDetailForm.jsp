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
    <!-- 사이드바 -->
	<jsp:include page="../common/sidebar.jsp" />
        <!-- 상품 간략 정보-->
        <div id="productInfo-area">
            <div id="product-img-container">
                <img class="product-thumbnail" src="${contextPath }/resources/dummyImg/shopping/item1.png" alt="">
            </div>

            <div id="product-Information">
                <div id="product_brand">
                    <span>브랜드명</span>
                </div>
                <div id="product_name_area">
                    <span id="product_name">상품명</span>
                    <span id="zzim">
                        <i class="fa-regular fa-heart fa-xl"></i>
                    </span>
                </div>
                <div id="product_grade_area">
                    <span id="product_grade">평점</span>
                    <div>
                        <span id="product_review_quantity">리뷰수</span><span class="review_quantity">개 상품평</span>
                    </div>
                </div>
                <div >
                    <span id="product_origin_price">가격</span><span class="won">원</span>
                </div>
                <div id="product_discount_price">
                    <span id="product_discount_percent">할인율</span>
                    <div>
                        <span id="product_discounted_price">할인된 가격</span><span style="font-size: 30px; font-weight: bold;">원</span>   
                    </div>
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
                        <form action="order.po">
                            <div class="product-opts">
                                <span>상품 선택</span>
                                <select name="" id="product-opts-select">
                                    <option value="">상품을 선택해주세요</option>
                                </select>
                            </div>
                            <div id="product_quantity_area">
                                <div>
                                    수량 선택
                                </div>
                                <div class="product_amount_price">
                                    <div id="pamount_btn">
                                        <div class="pbtn minus_quantity">-</div>
                                        <input class="pbtn quantity pbtn-quantity" type="text" value="1"></input>
                                        <div class="pbtn plus_quantity">+</div>
                                    </div>
                                </div>
                            </div>
                            <div id="price-area">
                                <div style="font-weight: bold; font-size: 20px;">총금액</div>
                                <div style="font-weight: bold; font-size: 25px; color: #1E90FF;">
                                    <span class="product-price">24,000</span>원
                                </div>
                            </div>
                            <div class="product_buy_btn_container">
                                <button class="myBtn btn_cart" >장바구니 담기</button>
                                <button class="myBtn btn_buy" onclick="moveToPage('${contextPath }/order')">구매하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 상품 정보-->
        <div id="productContent_area">
            <div id="area_left">

                <!-- 상품네비 -->
                <nav id="product_info_nav">
                    <div id="product_description_div" class="nav_div" onclick="scrollToDiv('#product_description_area')">상품설명</div>
                    <div id="detail_description_div" class="nav_div" onclick="scrollToDiv('#product_detail_description')">상세설명</div>
                    <div id="product_review_div" class="nav_div" onclick="scrollToDiv('#product_review_area')">후기</div>
                    <div id="product_qna_div" class="nav_div" onclick="scrollToDiv('#product_qna_area')">문의</div>
                </nav>

                <!-- 상품 설명 -->
                <div id="product_description_area">
                    <div id="product_description_picture">
                        <img id="product_description_img"
                            src="${contextPath }/resources/dummyImg/shopping/product_description.png" alt="상품사진">
                    </div>

                    <div id="product_description_p">
                        <p>경북 성주는 풍부한 일조량, 물 빠짐이 좋은 미사질 토양을 지녀 참외를 재배하기에 최적의 조건을 갖춘 곳인데요. 참외가 참 신선하고 맛이 좋다 싶으면 역시나 성주에서
                            온 참외이곤 하지요.
                            컬리는 과실이 통통하게 잘 여문 향긋한 성주 참외를 온 가족이 함께 즐길 수 있는 양으로 담아 준비했어요.
                            시원한 냉장고 혹은 찬물에 잠시 두었다가 꺼내 먹으면, 참외의 달콤한 향이 더욱 선명하게 느껴질 거예요.
                            아삭아삭한 식감, 함뿍 배어 나오는 달큰한 과즙을 그대로 음미해 보세요.</p>
                    </div>

                    <div id="product_detail_description">
                        <img id="product_detail_img"
                            src="${contextPath }/resources/dummyImg/shopping/product_detail.png" alt="">
                    </div>
                </div>

                <!-- 상품 후기 -->
                <div id="product_review_area">
                    <div class="description_title">상품 후기</div>
                    <div class="product_review">
                        <div class="review_writer_area">
                            <div class="review_writer_pic_container">
                                <img class="review_writer_pic" src=""
                                    alt="">
                            </div>
                            <div class="review_writer_id_rate">
                                <div class="review_writer_id">user01</div>
                                <div class="review_rate">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                </div>
                            </div>
                        </div>
                        <div class="review_product_name">성주 참외 꿀참외 1.5kg</div>
                        <div class="review_img_container">
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${contextPath }/resources/dummyImg/shopping/dog.jpeg"></img>
                        </div>
                        <div class="review_content">
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
                        <button id="btn_qna" class="btn btn-primary"
                            style="background-color: #1E90FF; width: 123px; height: 53px; font-size: 20px;" data-toggle="modal" data-target="#qna_Modal">문의하기</button>
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
                                        <span class="span_q_a">A</span><span>정해진 소비기한은 없지만 2~3일 내로 섭취하는 것을
                                            권장드립니다.</span>
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
                <div id="product-buy-container">
                    <div class="pname">
                        성주 참외 꿀참외 1.5kg
                    </div>
                    <div class="product_quantity_price">
                        <div id="pamount_btn">
                            <div class="pbtn minus_quantity">-</div>
                            <input class="pbtn quantity pbtn-quantity" value="1"></input>
                            <div class="pbtn plus_quantity">+</div>
                        </div>
                        <div id="price">
                            <span class="product-price">24,000</span>원
                        </div>
                    </div>
                    <div class="product_buy_btn_container">
                        <button class="btn_cart mini_btn " >장바구니</button>
                        <button class="btn_buy mini_btn" onclick="moveToPage('${contextPath }/order')" >구매하기</button>
                    </div>
                </div>
                
            </div>
        </div>

        <!-- 문의하기 modal -->
        <div class="modal fade" id="qna_Modal">
            <div class="modal-dialog">
                <div class="modal-content" style="height: 600px;">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 style="font-size: 16px; margin-bottom: 0px;">상품 문의하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" style="height: 100%;">
                        <div id="modal-qna-content">
                            <div id="product_name_container">
                                <div id="qna_product_name_header">
                                    상품명
                                </div>
                                <div id="qna_product_name">
                                    상품이름
                                </div>
                            </div>

                            <div id="product_pic_container">
                                <div style="font-size: 14px; font-weight: bold;">
                                    사진 첨부(선택)
                                </div>
                                <div style="font-size: 12px;">
                                    사진을 첨부해주세요.(최대 1장)
                                </div>
                                <div id="qna_pic_container">

                                </div>
                                <div id="add_qna_product_pic">
                                    <div id="pic_svg_container">
                                        <svg width="21" height="16" viewBox="0 0 21 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19.6059 0C20.1059 0 20.5059 0.4 20.5059 0.9V15.1C20.5059 15.6 20.1059 16 19.6059 16H1.40586C1.16716 16 0.938246 15.9052 0.769463 15.7364C0.600681 15.5676 0.505859 15.3387 0.505859 15.1V0.9C0.505859 0.4 0.905859 0 1.40586 0H19.6059ZM18.6959 1.8H2.30586V12.65L7.84586 6.38C7.96586 6.21 8.22586 6.21 8.36586 6.38L11.4659 9.92C11.5259 9.98 11.5459 10.06 11.5259 10.12L11.1259 11.96C11.1059 12.1 11.2759 12.19 11.3559 12.08L14.5159 8.65C14.5664 8.59992 14.6347 8.57183 14.7059 8.57183C14.777 8.57183 14.8453 8.59992 14.8959 8.65L18.6859 12.77V1.8H18.6959ZM15.3259 6.6C14.9394 6.60004 14.5685 6.44791 14.2934 6.17654C14.0183 5.90517 13.8611 5.53639 13.8559 5.15C13.8559 4.34 14.5159 3.69 15.3259 3.69C16.1359 3.69 16.8059 4.34 16.8059 5.15C16.8059 5.95 16.1459 6.6 15.3259 6.6Z" fill="#1E90FF"/>
                                            </svg>
                                    </div>
                                    <span style="color:#1E90FF; font-size: 14px;">사진 첨부하기</span>
                                    <input type="file" id="file-input" accept="image/*">

                                </div>
                            </div>

                            <div id="product_qna_content_container">
                                <div style="font-size: 14px; font-weight: bold;">
                                    문의내용
                                </div>
                                <div id="product_qna_content_textarea">
                                    <textarea name="" id="product_qna_content" placeholder="문의 내용을 입력하세요."></textarea>
                                </div>
                            </div>

                            <div id="product_qna_enroll_btn_container">
                                <button id="product_qna_enroll_btn" onclick="enrollQna()">완료</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
    <script src="${contextPath }/resources/js/shopping/productDetail.js"></script>
</body>
</html>