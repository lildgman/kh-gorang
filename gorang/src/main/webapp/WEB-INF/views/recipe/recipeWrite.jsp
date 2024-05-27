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
<link rel="stylesheet" href="${contextPath}/resources/css/recipe/recipeWrite.css">
<script src="${contextPath}/resources/js/recipe/recipeWrite.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
       <!-- 헤더 -->
       <jsp:include page="../common/header.jsp" />

       <form  action="${contextPath}/insert.bo" method="post">
           
        <div id="head-btn-area">
            <button id="save-recipe">임시 저장</button>
            <button type="submit"  id="register-rcipe" onclick="enrollRecipeBtn()">등록 하기</button>
        </div>
            
        <!-- 레시피 작성 전체영역 -->
       <div id="recipe-write-all-area">
        <!-- 썸네일 추가영역 -->
            <div id="recipe-write-imgupload-area" onclick="choiceThumnailImg()">
                <img id="thumnailImg" src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camerg.png" alt="" >
                <img id="thumnailImg-real" src="" alt="" >
                <input type="file" name="recipeMainPhoto" id="" onchange="changeThumnailImg(this)">
                <div id="recipe-write-img-middle-text">Upload recipe photo</div>
                <div id="recipe-write-img-bottom-text">Show others your finished dish</div>
            </div>



            <!-- 제목,소개,동영상, 태그, 카테고리 -->
            <div id="recipe-write-title-area">
                <input type="text" placeholder="레시피 제목을 입력해주세요." name="recipeTitle">
            </div>

            <div id="recipe-introduce-area">
                <textarea name="recipeContent" id="" maxlength="500" placeholder="여러분의 요리를 소개시켜주세요" ></textarea>
            </div>

            <div id="recipe-yotube-area">
                <textarea name="recipeVideo" id="" maxlength="500" placeholder="동영상이 있다면 주소를 작성해주세요(Youtube 만 가능)" ></textarea>
            </div>

            <div id="recipe-tage-area">
                <input type="text" placeholder="태그를 넣어주세요 예)#얼큰 #찌개 #건강식"  name="recipeTag">
            </div>

            <div id="recipe-category-area">
                <div id="ctg-div">카테고리</div>
                <div class="selectbox-areas" > 
                    <select name="cookKind" id="" class="mySelect" > 
                        <option value="" disabled selected hidden>종류</option>
                        <option value="한식">한식</option>
                        <option value="중식">중식</option>
                        <option value="일식">일식</option>
                        <option value="양식">양식</option>
                        <option value="디저트">디저트</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="selectbox-areas"> 
                    <select name="cookLevel" id="" class="mySelect" > 
                        <option value="" disabled selected hidden>난이도</option>
                        <option value="한식">상</option>
                        <option value="중식">중</option>
                        <option value="일식">하</option>
                
                    </select>
                </div>
                <div class="selectbox-areas"> 
                    <select name="cookTime" id="" class="mySelect"> 
                        <option value="" disabled selected hidden>시간</option>
                        <option value="5분 이내">5분 이내</option>
                        <option value="10분 이내">10분 이내</option>
                        <option value="15분 이내">15분 이내</option>
                        <option value="30분 이내">30분 이내</option>
                        <option value="1시간 이내">1시간 이내</option>
                        <option value="2시간 이내타">2시간 이내</option>
                        <option value="2시간 이상">2시간 이상</option>
                    </select>
                </div>
                <div class="selectbox-areas"> 
                    <select name="cookAmount" id="" class="mySelect"> 
                        <option value="" disabled selected hidden>인원</option>
                        <option value="1인분">1인분</option>
                        <option value="2인분">2인분</option>
                        <option value="3인분">3인분</option>
                        <option value="4인분">4인분</option>
                        <option value="5인분">5인분</option>
                        <option value="6인분">6인분</option>
                        <option value="6인분 이상">6인분 이상</option>
                    </select>
                </div>
            </div>

            <script>
                const selectElement = document.querySelector(".mySelect");
            
                selectElement.addEventListener("change", function() {
                    if (this.value === "") {
                        this.selectedIndex = -1; // 플레이스홀더를 선택하지 못하도록 함
                    }
                });
            </script>

            <!-- 재료정보 영역 -->
            <div id="recipe-ingredient-info-area">
                <div id="recipe-ingredient-info-area-title">
                    <span id="ingredient-info-span-top">재료 정보</span><br>
                    <span id="ingredient-info-span-bottom">※ 식재료,양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.</span>
                </div>
                
                <div id="recipe-ingredient-info-blocks">
                    <div class="recipe-ingredient-info-top">
                        <div class="location-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
                        <div class="ingre-div-block" >
                            <input type="text" placeholder="분류 예)식재료">
                        </div>
                        <div class="delete-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteIngreBlock(this)"></div>
                    </div>
                    <div class="recipe-ingredient-info-bottom">
                        <div class="recipe-smaill-block">
                            <div class="location-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
                            <div class="igre-name-block"><input type="text" placeholder="재료명 예)돼지고기"></div>
                            <div class="igre-amount-block"><input type="text" placeholder="수량"></div>
                            <div class="igre-unit-block"><input type="text" placeholder="단위"></div>
                            <div class="delete-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteSmaillBlock(this)"></div>
                            <button type="button">태그 +</button>
                        </div>

                        <div class="add-igre-btn">                     
                            <img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/plus.png" alt="" onclick="addBundle(this)">
                            <button type="button" onclick="addBundle(this)">묶음 추가</button>
                        </div>
                    </div>
                 
                </div>
                <div id="add-div-btn">
                    <button type="button" onclick="addUnit(this)">+ 분류 추가</button>
                </div>
            </div>

            <!-- 조리 순서 영역 -->
            <div id="cooking-order-area">
                <div id="cooking-order-area-title">조리순서</div>
                <div id="cooking-order-blocks">
                    <div class="cooking-order-block">
                        <div class="cooking-order-block-top">
                            <div class="cook-order-number-img">1</div>
                            <div class="cook-order-write-content"><input type="text" placeholder="예) 소고기는 기름을 떼어내고 적당한 크기로 썰어주세요"></div>
                            <div class="cook-order-hambugerbar"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/SVG.png" alt=""></div>
                        </div>
                        <div class="cooking-order-block-bottom">
                            <div class="cooking-order-block-bottom-img" onclick="cookIngOrderImg(this)">
                                <img class ="cookingImg" src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
                                <img class="cookingImg-real" src="" alt="" >
                                <input type="file"  id="fileInput"  onchange="changeCookIngOrderImg(this)">
                            </div>
                            <div class="cooking-order-block-bottom-tips">
                                <div class="cooking-order-block-bottom-tip">
                                    <input type="text" placeholder="팁 예) 볶는 시간은 최소로 합니다">
                                    <button type="button" class="add-tip"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/plus (2).png" alt="" onclick="addTip(this)"></button>
                                    <button type="button" class="delte-tip"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Icon.png" alt=""  onclick="deleteTip(this)"></button>
                                </div>
                            </div>
                        </div>
                        <div id="recipe-order-delete-btn-area">
                            <button type="button" id="order-delete-btn" onclick="deleteCookingOrder(this)">삭제</button>
                        </div>
                    </div>
                </div>
                <div id="add-order-btn">
                    <button type="button" onclick="addCookingOrder(this)">+ 순서 추가</button>
                </div>
            </div>
            
            <!-- 완성사진영역 -->
            <div id="complete-food-img-area">
                <div id="complete-food-img-title">완성사진</div>
                <div id="complete-food-img-blocks" >
                    <div class="complete-food-img-block"  onclick="completeImg(this)">
                        <img class="completeImg" src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
                        <img class="completeImg-real" src="" alt="" >
                        <input type="file" name="" id="" onchange="changecompleteImg(this)">
                    </div>
                    <div class="complete-food-img-block"  onclick="completeImg(this)">
                        <img class="completeImg"  src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
                        <img class="completeImg-real" src="" alt="" >
                        <input type="file" name="" id="" onchange="changecompleteImg(this)">
                    </div>
                    <div class="complete-food-img-block"  onclick="completeImg(this)">
                        <img class="completeImg" src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
                        <img class="completeImg-real" src="" alt="" >
                        <input type="file" name="" id="" onchange="changecompleteImg(this)">
                    </div>
                    <div class="complete-food-img-block"  onclick="completeImg(this)">
                        <img class="completeImg" src="${contextPath}/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
                        <img class="completeImg-real" src="" alt="" >
                        <input type="file" name="" id="" onchange="changecompleteImg(this)">
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>