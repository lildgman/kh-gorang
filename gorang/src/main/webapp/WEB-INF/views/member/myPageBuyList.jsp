<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myPageBuyList.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    
     
    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <div id="left-body-area">
            <div id ="user-info">
                <div id="user-profile-area">
                    <div id="user-profile">
                        <img src="${contextPath}/resources/images/member-img/120X120.png" alt="화원 프로필">
                    </div>
                    <div id="user-profile-pencil">
                        <img src="${contextPath}/resources/images/member-img/Icon_Edit.png" ale="프로필 사진 버튼">
                    </div>
                </div>
                <div id="user-nickgrade-area">
                    <a href="">닉네임 자리</a> <img src="${contextPath}/resources/images//member-img/Vector 340.png" alt=">" id="bector">
                    <br>
                    <div id="user-follow">
                        <div id="user-follower"><a href="">팔로워 0</a></div> | 
                        <div id="user-following"><a href="">팔로잉 0</a></div>
                    </div>
                    <div id="user-grade">
                        브론즈등급
                    </div>
                </div>
                <div id="user-profile-area-line">
                    <hr>  
                </div>
                <div id="user-profile-area-bottom">
                    <div id="user-scrape">
                        <a href="">스크랩</a><br><div class="zero">0</div>
                    </div>
                    <div id="user-like">
                        <a href="">좋아요</a><br><div class="zero">0</div>
                    </div>
                    <div id="user-alarm">
                        <a href="">알림</a><br><div class="zero">0</div>
                    </div>
                  
                </div>
            </div>
            <div id="user-menu">
                <ul id="left-user-menu-list">
                    <li><a  href="" style="color: #1e90ff;">모두 보기</a></li>
                    <li style="font-size: 18px;  font-weight: bold;" id="myboard">나의 게시글
                       <ul id="myboard-list">
                            <li><a  href="" class="myboard-list-in">나의 레시피 게시글</a></li>
                            <li><a  href="" class="myboard-list-in">나의 자유 게시글</a></li>
                        </ul>
                    </li>
                    <li><a  href="">댓글 & 후기</a></li>
                    <li><a  href="">문의</a></li>
                    <li><a  href="">나의 냉장고</a></li>
                    <li><a  href="">구매내역</a></li>
                    <li><a  href="">스크랩</a></li>
                    <li><a  href="">좋아요</a></li>
                    <li><a  href="">정보 수정</a></li>
                </ul>
            </div>
        </div>

        <!-- 우측 메인영역 -->
        <div id="right-body-area">
            <div id="myPage-buy-list-top">
                구매내역
            </div>
            <div id="myPage-buy-list-bottom">
                <table>
                    <thead>
                        <tr>
                            <td colspan="2" id="head-name">상품</td>
                            <td id="head-amount">수량</td>
                            <td id="head-price">결재금액</td>
                            <td id="head-buyDate">결재일자</td>
                            <td colspan="2" id="head-status">상태</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span>배송중</span><br>
                                <span class="status-font">도착 예정일<br>2024.01.02</span> 
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <button class="tbody-td-btn-cancle" onclick="showSweetConfirm()">주문 취소</button>
                            </td>
                        </tr>

                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span>배송중</span><br>
                                <span class="status-font">도착 예정일<br>2024.01.02</span> 
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <button class="tbody-td-btn-cancle">주문 취소</button>
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 과일 참외외참싱싱한 과일 참외외 </span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>

                        
                        <tr class="tbody-buy-list-block">
                            <td class="tbody-td-img"><img src="${contextPath}/resources/images//member-img/Rectangle 18311 (2).png" alt="">
                            </td>
                            <td class="tbody-td-name">
                                <span class="product-no">주문번호 No.12</span><br>
                                <span class="product-brand-name">[오늘 농장] 싱싱한 과일 참외</span>
                            </td>
                            <td class="tbody-td-amount">5</td>
                            <td class="tbody-td-price">12,600원</td>
                            <td class="tbody-td-buyDate">2024.12.31</td>
                            <td class="tbody-td-status">
                                <span style="color:#068E3D;">배송 완료</span><br>
                                <!-- <span class="status-font">도착 예정일<br>2024.01.02</span>  -->
                            </td>
                            <td class="tbody-td-btn">
                                <button class="tbody-td-btn-qna">문의 하기</button>
                                <button class="tbody-td-btn-write">후기 쓰기</button>
                                <!-- <button class="tbody-td-btn-cancle">주문 취소</button> -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                function showSweetConfirm() {
                    Swal.fire({
                        title: '주문 취소하시겠습니까?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: '확인',
                        cancelButtonText: '취소'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire(
                                '주문 취소',
                                '주문이 취소되었습니다.',
                                'success'
                            );
                            // 탈퇴 처리 코드 여기에 추가
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            Swal.fire(
                                '취소됨',
                                '주문이 취소되지 않았습니다.',
                                'error'
                            );
                        }
                    });
                }
            </script>
</body>
</html>