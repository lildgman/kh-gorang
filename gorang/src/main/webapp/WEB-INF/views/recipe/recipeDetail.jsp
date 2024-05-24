<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- css -->
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/sidebar.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/recipeDetail.css">
            <!-- slick-->
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!--js-->
            <!-- jQuery library -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

            <!-- font awesome kit -->
            <script src="https://kit.fontawesome.com/68309de260.js" crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

            <!--slick-->
            <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

            <!--sidebar-->
            <script src="${pageContext.request.contextPath}/resources/js/common/sidebar.js"></script>
    
    </head>

    <body>
        <!-- 헤더 -->
        <jsp:include page="../common/header.jsp" />

        <!-- 사이드 최근본 내역 -->
        <div id="sidebar">
			<div id="recently-seen-div">
                <div class="recently-seen-div-button-box slick-prev">
                    <svg width="16" height="10" viewBox="0 0 16 10" fill="none" xmlns="http://www.w3.org/2000/svg">
						<rect x="2.31445" y="7.46094" width="7.72042" height="1.54408" transform="rotate(-45 2.31445 7.46094)" fill="#D9D9D9"/>
						<rect width="7.72042" height="1.54408" transform="matrix(-0.707107 -0.707107 -0.707107 0.707107 13.416 7.46094)" fill="#D9D9D9"/>
					</svg>
                </div>
				<div id="recently-seen-container">
					<span>최근 본 레시피</span>
					<div id="recently-seen-list">
						<!-- 최근 본 아이템 목록 추가-->
					</div>
				</div>
                <div class="recently-seen-div-button-box slick-next">
                <svg width="16" height="10" viewBox="0 0 16 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="7.72042" height="1.54408" transform="matrix(0.707107 0.707107 0.707107 -0.707107 2.31445 2.53906)" fill="#D9D9D9"/>
                    <rect x="13.6855" y="2.53906" width="7.72042" height="1.54408" transform="rotate(135 13.6855 2.53906)" fill="#D9D9D9"/>
                </svg>
                </div>
			</div>
		</div>

        <!--레시피 글 썸네일영역 -->
        <div id="recipe-thumnail-area">
            <div id="recipe-thumnail-food-img">
                <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/image 4.png" alt="">
            </div>
            <div id="recipe-thumnail-user-img-area">
                <div id="recipe-thumnail-user-img">
                    <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/Ellipse 174.png"
                        alt="">
                </div>
                <div id="recipe-thumnail-user-nickname">
                    유저 닉네임
                </div>
            </div>
            <div id="recipe-thumnail-views-count">
                <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/🦆 icon _eye_.png"
                    alt=""><span> 613,127</span>
            </div>
        </div>

        <!-- 레시피 내용 전체 -->
        <div id="recipe-content-total-area">

            <!-- 레시피 제목,태그,내용, 정보 전체영역 -->
            <div id="recipe-total-first-area">

                <div id="recipe-title-top">
                    레시피 제목
                </div>
                <div id="recipe-total-bottom-area">
                    <div id="recipe-total-first-left">

                        <div id="recipe-tage">
                            <div class="tag-content">#태그1</div>
                            <div class="tag-content">#태그2</div>
                            <div class="tag-content">#태그3</div>
                            <div class="tag-content">#태그4</div>
                            <div class="tag-content">#태그5</div>
                        </div>

                        <div id="recipe-content">
                            이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.
                            이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.
                            이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.
                            이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.
                            이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.이곳에는 레시피에 대한 소개가 들어갑니다.
                        </div>
                    </div>
                    <!-- 레시피 카테고리 정보영역 -->
                    <div id="recipe-total-first-right">
                        <div id="recipe-category-top">
                            <div class="recipe-category">
                                <div class="recipe-smaill-top">난이도</div>
                                <div class="recipe-smaill-bottom">상</div>
                            </div>
                            <div class="recipe-category">
                                <div class="recipe-smaill-top">조리시간</div>
                                <div class="recipe-smaill-bottom">10분</div>
                            </div>
                            <div class="recipe-category">
                                <div class="recipe-smaill-top">인원</div>
                                <div class="recipe-smaill-bottom">1인분</div>
                            </div>
                        </div>

                        <div id="recipe-nutt-info-area">
                            <div id="nutt-info-area">
                                <div id="bugerbarimg">
                                    <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/Vector.png"
                                        alt="">
                                </div>
                                <div id="nutt-info-text">영양정보 알아보기</div>
                                <div id="downimg">
                                    <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/icon bottom_.png"
                                        alt="" id="show-div">
                                </div>
                            </div>
                        </div>

                        <div id="recipe-icon">
                            <div class="icon-block">공유 <br> 아이콘</div>
                            <div class="icon-block">URL <br> 아이콘</div>
                            <div class="icon-block">스크랩 <br> 아이콘</div>
                        </div>

                        <div id="recipe-nutrition-info-list-area">
                            <div id="recipe-nutrition-info-header">
                                <div>레시피 영양정보</div>
                                <div>
                                    <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/X.png" id="close-div" alt="">
                                </div>
                            </div>
                            <div id="recipe-nutrition-info-bottom">
                                <table>
                                    <tr>
                                        <td>총 칼로리(kcal)</td>
                                        <td class="second-td">763</td>
                                    </tr>
                                    <tr>
                                        <td>탄수화물(g)</td>
                                        <td class="second-td">150</td>
                                    </tr>
                                    <tr>
                                        <td>단백질(g)</td>
                                        <td class="second-td">24</td>
                                    </tr>
                                    <tr>
                                        <td>지방(g)</td>
                                        <td class="second-td">40</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        // JavaScript 코드
                        document.addEventListener("DOMContentLoaded", function() {
                            // show-div를 클릭했을 때
                            document.getElementById("show-div").addEventListener("click", function() {
                                document.getElementById("recipe-nutrition-info-list-area").style.display = "block"; // 영역 보이기
                            });
                    
                            // close-div를 클릭했을 때
                            document.getElementById("close-div").addEventListener("click", function() {
                                document.getElementById("recipe-nutrition-info-list-area").style.display = "none"; // 영역 숨기기
                            });
                        });
                    </script>
                </div>
            </div>
            <!-- id태그영역 -->
            <div id="menubar-id-area">
                <div class="menubar-id"> <a href="#igre-total-area">재료</a></div>
                <div class="menubar-id"> <a href="#cooking-order-total-area">조리 순서</a></div>
                <div class="menubar-id"> <a href="#review">후기</a></div>
                <div class="menubar-id"> <a href="#qna">문의</a></div>
                <div class="menubar-id"> <a href="#">연관 상품</a></div>
            </div>

            <!-- 재료 영역 -->
            <div id="igre-total-area">
                <div id="igre-head-title-area">재료</div>
                <div class="igre-type-area">
                    <div class="igre-type-area-left">
                        <table>
                            <thead>
                                <tr class="tr-igre-title">
                                    <td colspan="2">[식재료]</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>돼지고기 앞다리살</td>
                                    <td>300g</td>
                                </tr>
                                <tr>
                                    <td>배추김치</td>
                                    <td>1개</td>
                                </tr>
                                <tr>
                                    <td>청양고추</td>
                                    <td>20g</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="igre-type-area-right">
                        <table>
                            <thead>
                                <tr class="tr-igre-title">
                                    <td colspan="2">[양념재료]</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>간장</td>
                                    <td>2스푼</td>
                                </tr>
                                <tr>
                                    <td>참기름</td>
                                    <td>1스푼</td>
                                </tr>
                                <tr>
                                    <td>고추가루</td>
                                    <td>10g</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div> <!-- igre-type-area영역에서  igre-type-area-right로 끝나면 다시
                        igre-type-area영역을 생성해서 left, right생성을 만드는 것을 반복 (2열 종대)-->
                


            <!-- 조리 순서 -->
            <div id="cooking-order-total-area">
                <div id="cooking-order-title">
                    조리순서
                </div>
                <div id="cooking-order-blocks">
                    <div class="cook-order-block">
                        <div class="cooking-order-step-title">
                            STEP1
                        </div>
                        <div class="cooking-order-step-image">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder1.jpg"
                                alt="">
                        </div>
                        <div class="cooking-order-step-content">
                            마트에서 판매하는 묵이라면 따뜻한 물에 데쳐서 사용해야 부들부들 탱글한 묵을 맛볼 수있어요.
                            묵은 아이들이 먹기 좋은 크기로 깍뚝썰어줍니다
                        </div>
                        <div class="cooking-order-step-tip">
                            TIP : 칼질 주의! 오뚜기 묵으로 드시면 더욱 맛있답니다~
                        </div>
                    </div>

                    <div class="cook-order-block">
                        <div class="cooking-order-step-title">
                            STEP2
                        </div>
                        <div class="cooking-order-step-image">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder2.jpg"
                                alt="">
                        </div>
                        <div class="cooking-order-step-content"> 볼에 도토리묵과 다진 대파를 넣고 간을 해줄께요.
                        </div>
                        <div class="cooking-order-step-tip">
                            TIP : 대파의 두께는 얇게 써는걸 추천할게요
                        </div>
                    </div>

                    <div class="cook-order-block">
                        <div class="cooking-order-step-title">
                            STEP3
                        </div>
                        <div class="cooking-order-step-image">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder3.jpg"
                                alt="">
                        </div>
                        <div class="cooking-order-step-content">
                            부셔둔 김가루를 넣어준 후 잘 비벼주시면 아이반찬 탱글탱글 고소한 도토리묵김무침이 완성됩니다. 맛있게 드세요.
                        </div>
                        <div class="cooking-order-step-tip">
                            TIP : 숟가락으로 살살 섞어주셔야 묵이 망가지지않고 맛있게 양념이 벤답니다 ^-^ b
                        </div>
                    </div>
                </div>
            </div>

            <!-- 완성 사진 영역 -->
            <div id="review"></div>
            <div id="complete-cook-image-area">
                <span>요리 완성</span>
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder3.jpg"
                                class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder3.jpg"
                                class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/cookorder3.jpg"
                                class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>


            
                <!-- 상품 후기 -->
                <div id="product_review_area">
                    <div class="description_title">상품 후기</div>
                    <div id="product_review">
                        <div id="review_writer_area">
                            <div id="review_writer_pic_container">
                                <img id="review_writer_pic" src="${pageContext.request.contextPath}/resources/dummyImg/shopping/dog.jpeg"
                                    alt="">
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
                            <img class="review_img" src="${pageContext.request.contextPath}/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${pageContext.request.contextPath}/resources/dummyImg/shopping/dog.jpeg"></img>
                            <img class="review_img" src="${pageContext.request.contextPath}/resources/dummyImg/shopping/dog.jpeg"></img>
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

            </div>
        </div>

        <!-- 문의하기 modal -->
        <div class="modal fade" id="qna_Modal">
            <div class="modal-dialog">
                <div class="modal-content" style="height: 510px;">

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
                                <div id="qna_product_pic">
                                    <div id="pic_svg_container">
                                        <svg width="21" height="16" viewBox="0 0 21 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19.6059 0C20.1059 0 20.5059 0.4 20.5059 0.9V15.1C20.5059 15.6 20.1059 16 19.6059 16H1.40586C1.16716 16 0.938246 15.9052 0.769463 15.7364C0.600681 15.5676 0.505859 15.3387 0.505859 15.1V0.9C0.505859 0.4 0.905859 0 1.40586 0H19.6059ZM18.6959 1.8H2.30586V12.65L7.84586 6.38C7.96586 6.21 8.22586 6.21 8.36586 6.38L11.4659 9.92C11.5259 9.98 11.5459 10.06 11.5259 10.12L11.1259 11.96C11.1059 12.1 11.2759 12.19 11.3559 12.08L14.5159 8.65C14.5664 8.59992 14.6347 8.57183 14.7059 8.57183C14.777 8.57183 14.8453 8.59992 14.8959 8.65L18.6859 12.77V1.8H18.6959ZM15.3259 6.6C14.9394 6.60004 14.5685 6.44791 14.2934 6.17654C14.0183 5.90517 13.8611 5.53639 13.8559 5.15C13.8559 4.34 14.5159 3.69 15.3259 3.69C16.1359 3.69 16.8059 4.34 16.8059 5.15C16.8059 5.95 16.1459 6.6 15.3259 6.6Z" fill="#1E90FF"/>
                                            </svg>
                                    </div>
                                    <span style="color:#1E90FF; font-size: 14px;">사진 첨부하기</span>
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

                            <div id="produt_qna_enroll_btn_container">
                                <button id="produt_qna_enroll_btn">완료</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- 연관 상품 영역  -->
        <div id="relation-product-total-area">
            <div id="relation-product-head">
                연관 상품
            </div>
            <div id="relation-product-list">
                <div class="relation-product-list-block">
                    <div class="relation-product-image">
                        <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/pig(2).png" alt="">
                    </div>
                    <div class="relation-product-brand">성주</div>
                    <div class="relation-product-title">당도선별 성주 꿀참외 1.5kg(4~7입)</div>
                    <div class="relation-product-ps-size"><span class="relation-product-sale">20%</span> <span class="relation-product-price">16,900</span></div>
                </div>

                <div class="relation-product-list-block">
                    <div class="relation-product-image">
                        <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/pig(2).png" alt="">
                    </div>
                    <div class="relation-product-brand">성주</div>
                    <div class="relation-product-title">당도선별 성주 꿀참외1.5kg(4~7입)</div>
                    <div class="relation-product-ps-size"><span class="relation-product-sale">20%</span> <span class="relation-product-price">16,900</span></div>
                </div>

                <div class="relation-product-list-block">
                    <div class="relation-product-image">
                        <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/pig(2).png" alt="">
                    </div>
                    <div class="relation-product-brand">성주</div>
                    <div class="relation-product-title">당도선별 성주 꿀참외 1.5kg(4~7입)</div>
                    <div class="relation-product-ps-size"><span class="relation-product-sale">20%</span> <span class="relation-product-price">16,900</span></div>
                </div>

                <div class="relation-product-list-block">
                    <div class="relation-product-image">
                        <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/pig(2).png" alt="">
                    </div>
                    <div class="relation-product-brand">성주</div>
                    <div class="relation-product-title">당도선별 성주 꿀참외 1.5kg(4~7입)</div>
                    <div class="relation-product-ps-size"><span class="relation-product-sale">20%</span> <span class="relation-product-price">16,900</span></div>
                </div>

                <div class="relation-product-list-block">
                    <div class="relation-product-image">
                        <img src="${pageContext.request.contextPath}/resources/dummyImg/recipe/recipeDetail/pig(2).png" alt="">
                    </div>
                    <div class="relation-product-brand">성주</div>
                    <div class="relation-product-title">당도선별 성주 꿀참외 1.5kg(4~7입)</div>
                    <div class="relation-product-ps-size"><span class="relation-product-sale">20%</span> <span class="relation-product-price">16,900</span></div>
                </div>
            </div>

            <div id="goto-list-area">
                <button id="goto-list-btn">목록으로</button>
            </div>
        </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

    </html>