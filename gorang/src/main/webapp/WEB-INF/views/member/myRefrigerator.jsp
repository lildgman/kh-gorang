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
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myRefrigerator.css">
   
</head>
<body>
    <div class="header">
        <jsp:include page="../common/header.jsp"/>
    </div>
    <div id="body-area">
        <!-- 왼쪽 프로필 메뉴바영역 -->
        <div id="left-body-area">
            <div id="user-info">
                <div id="user-profile-area">
                    <div id="user-profile">
                        <img src="${pageContext.request.contextPath}/resources/images/member-img/120X120.png" alt="화원 프로필">
                    </div>
                    <div id="user-profile-pencil">
                        <img src="${pageContext.request.contextPath}/resources/images/member-img/Icon_Edit.png" ale="프로필 사진 버튼">
                    </div>
                </div>
                <div id="user-nickgrade-area">
                    <a href="">닉네임 자리</a> <img src="${pageContext.request.contextPath}/resources/images//member-img/Vector 340.png"
                        alt=">" id="bector">
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
                        <a href="">스크랩</a><br>
                        <div class="zero">0</div>
                    </div>
                    <div id="user-like">
                        <a href="">좋아요</a><br>
                        <div class="zero">0</div>
                    </div>
                    <div id="user-alarm">
                        <a href="">알림</a><br>
                        <div class="zero">0</div>
                    </div>

                </div>
            </div>
            <div id="user-menu">
                <ul id="left-user-menu-list">
                    <li><a href="">모두 보기</a></li>
                    <li style="font-size: 18px;  font-weight: bold;" id="myboard">나의 게시글
                        <ul id="myboard-list">
                            <li><a href="" class="myboard-list-in">나의 레시피 게시글</a></li>
                            <li><a href="" class="myboard-list-in">나의 자유 게시글</a></li>
                        </ul>
                    </li>
                    <li><a href="">댓글 & 후기</a></li>
                    <li><a href="">문의</a></li>
                    <li><a href="" class="myboard-list-in" style="color: #1e90ff;">나의 냉장고</a></li>
                    <li><a href="">구매내역</a></li>
                    <li><a href="">스크랩</a></li>
                    <li><a href="">좋아요</a></li>
                    <li><a href="">정보 수정</a></li>
                </ul>
            </div>
        </div>
              <!-- 우측 메인영역 -->
            <div id="right-body-area">
                <!-- 추천레시피 전체영역 -->
                <div id="recommend-recipe-area">
                    <!-- 추천레시피 제목영역 -->
                    <div id="right-recommend-recipe-title-area">
                        <div id = "recommend-recipe-texthead">
                            추천 레시피 
                        </div>

                        <div id="recommend-recipe-modal-btn">                            
                            <button id="viewModalBtn" onclick="viewModal()">
                                직접레시피 찾기
                            </button>
                            <!-- 모달 창 -->
                            <div id="myModal" class="modal">
                                <div id="modal-content-recipe-find">
                                    <div id="modal-title-header">
                                        레시피 찾기
                                    </div>

                                    <div id="modal-search-igre">
                                       <input id="input-igretext" placeholder=" 식품명 입력"></input> 
                                       <button>
                                        <img src="${pageContext.request.contextPath}/resources/images/member-img/search 3.png" alt="">
                                        </button>
                                    </div>
                                   
                                    <div id="list-igre-area">
                                        <button id="selectAll-btn">모두선택</button>
                                    </div>
                                   
                                    <div id="list-title">
                                        <span id="first-list-title" >식품명</span>
                                        <span id="second-list-title" >소비기한</span>
                                    </div>
                                    <div id="overflow-recipe-area">
                                        <c:forEach begin="1" end="30" varStatus="loop">
                                            <div class="row-igre-area">
                                                <input type="checkbox" name="" id="">
                                                <span>닭가슴살 블랙페퍼</span>
                                                <span>2024.08.05</span>
                                            </div>
                                        </c:forEach>      
                                    </div>

                                    <div id="modal-search-recipe-bottom">
                                        <button id="closeModalBtn" class="close">닫 기</button>
                                            <button id="completeModalBtn" class="complete">완 료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>

                        function viewModal(){
                            document.getElementById("myModal").style.display = "block";
                            // let h= document.querySelector(".header jsp");
                            // console.log(h);
                        }
                        // 모달 닫기 버튼을 클릭하면 모달 창을 숨김
                        document.getElementById("closeModalBtn").addEventListener("click", function() {
                        document.getElementById("myModal").style.display = "none";
                        });

                    
                    </script>


                    <!-- 추천레시피 이미지영역 -->
                    <div id="recommend-recipe-imgs">
                        <div class="recommend-recipe-best-img">
                            <img src="${contextPath}/resources/images/member-img/Img (1).png">
                        </div>
                        <div class="recommend-recipe-best-img">
                            <img src="${contextPath}/resources/images/member-img/Img.png">
                        </div>
                        <div class="recommend-recipe-best-img">
                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311.png">
                        </div>
                    </div>
                </div>

                <!-- 나의 냉장고 전체 영역 -->
                <div id="myRefrigerator-area">
                    <!-- 나의 냉장고 제목 -->
                    <div id="myRefrigerator-text-title-area">
                        <div id="myRefrigerator-texthead">
                            나의 냉장고
                        </div>
                        <div id="myRefrigerator-modal-btn">
                            <button id="viewModalBtn-two" onclick="viewModal2()">
                                + 추가하기
                            </button>

                             <!-- 모달 창 -->
                             <div id="myModal-two" class="modal-two">
                                <div id="modal-content-recipe-add">
                                    <div id="modal-title-recipe-header">
                                        식재료 추가하기
                                    </div>

                                    <div id="modal-search-igre2">
                                       <input id="input-igretext2" placeholder=" 식품명 입력"></input> 
                                       <button>
                                        <img src="${pageContext.request.contextPath}/resources/images/member-img/search 3.png" alt="">
                                        </button>
                                    </div>
                                   
                                    <div id="list-igre-area2">
                                        <button id="selectAll-btn2">모두선택</button>
                                        <button id="addAll-btn2">추 가</button>
                                    </div>
                                   
                                    <div id="list-title2">
                                        <span id="add-list-title1" >번호</span>
                                        <span id="add-list-title2" >식품명</span>
                                        <span id="add-list-title3" >100g당 칼로리</span>
                                        <span id="add-list-title4" >소비기한</span>
                                    </div>
                                    <div id="overflow-recipe-area2">
                                        <table>
                                           
                                                <c:forEach begin="1" end="30" varStatus="loop">
                                                    <tr>
                                                        <td><input type="checkbox" name="" id=""></td>
                                                        <td class="fixed-width1">1</td>
                                                        <td class="fixed-width2">닭가슴살 후추페퍼</td>
                                                        <td class="fixed-width3">100kcal</td>
                                                        <td class="fixed-width4">
                                                            <span>직접입력 : </span>
                                                            <input type="text">
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                         
                                        </table>
                                    </div>


                                    <div id="modal-search-recipe-bottom2">
                                        <button id="closeModalBtn2" class="close">닫 기</button>
                                    </div>
                                </div>
                            </div>

                            
                            <script>

                                function viewModal2(){
                                    document.getElementById("myModal-two").style.display = "block";
                                    // let h= document.querySelector(".header jsp");
                                    // console.log(h);
                                }
                                // 모달 닫기 버튼을 클릭하면 모달 창을 숨김
                                document.getElementById("closeModalBtn2").addEventListener("click", function() {
                                document.getElementById("myModal-two").style.display = "none";
                                });
           
                            </script>


                        </div>
                    </div>

                    <!-- 나의 냉장고 식재료내역 -->
                    <div id="myRefrigerator-igre-area">
                        <div id="myRefrigerator-igre-table-area">
                            <table>
                            <thead id ="myRefrigerator-tb">
                                    <tr>
                                        <td>상품</td>
                                        <td>신선도</td>
                                        <td>소비기한</td>
                                        <td>냉장고 입고날짜</td>
                                        <td>개수</td>    
                                    </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                        <td>
                                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (2).png" alt=""> 참외
                                        </td>
                                        <td class="flesh-area"><div class="flesh-status" style="background-color:#7ADC66 ;"></div> 신선</td>  <!--나중에 class id로 변경-->
                                        <td>2024.08.05</td>
                                        <td>2024.02.12</td>
                                        <td>5</td>
                                        <td>삭제</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (3).png" alt=""> 브로콜리
                                        </td>
                                        <td  class="flesh-area"><div class="flesh-status " style="background-color:#EE6677 ;"> </div>위험</td>
                                        <td>2024.05.10</td>
                                        <td>2024.03.12</td>
                                        <td>5</td>
                                        <td>삭제</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (4).png" alt=""> 제주 흑돼지 삼겹살
                                        </td>
                                        <td  class="flesh-area"><div class="flesh-status" style="background-color:#FFE188 ;"> </div>보통</td>
                                        <td>2024.05.31</td>
                                        <td>2024.04.10</td>
                                        <td>3</td>
                                        <td>삭제</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (5).png" alt=""> 당근
                                        </td>
                                        <td  class="flesh-area"><div class="flesh-status" style="background-color:#7ADC66 ;"> </div>신선</td>
                                        <td>2024.06.20</td>
                                        <td>2024.04.30</td>
                                        <td>2</td>
                                        <td>삭제</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${contextPath}/resources/images/member-img/Rectangle 18311 (6).png" alt=""> 바나나
                                        </td>
                                        <td  class="flesh-area"><div class="flesh-status" style="background-color:#7ADC66 ;"> </div>신선</td>
                                        <td>2024.06.02</td>
                                        <td>2024.05.01</td>
                                        <td>1</td>
                                        <td>삭제</td>
                                    </tr>
                            </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>