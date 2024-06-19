document.addEventListener("DOMContentLoaded", function () {
  // 전역 변수 초기화
  const contextPath = getContextPath();
  const recipeNo = getParameterPno();

  // 파라미터값으로 뿌려주고 남은 정보창 채우기
  inputProductInfo(recipeNo, contextPath);

  // 이벤트 핸들러 등록
  fileInputClick();

  setRatingStar();
});

const recipeNo = getParameterPno();
//페이지의 URL 에서 쿼리 파라미터 값 추출
function getParameterPno() {
  let query = window.location.search;
  let param = new URLSearchParams(query);
  let recipeNo = param.get('recipeNo');
  return recipeNo;
}

function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

/** ajax로 받아온 pi 객체를 이용해 페이지네이션 업데이트 해주는 메소드 */
function updatePagination(ev, pi) {
  const pagination = ev.querySelector(".pagination");
  pagination.innerHTML = "";

  if (pi.currentPage > 1) {
      const prevLink = document.createElement('a');
      prevLink.setAttribute('data-value', pi.currentPage - 1);
      prevLink.innerHTML = '&lt;';
      pagination.appendChild(prevLink);
  }

  for (let p = pi.startPage; p <= pi.endPage; p++) {
      const pageLink = document.createElement('a');
      pageLink.setAttribute('data-value', p);
      pageLink.innerHTML = p;
      if(p == parseInt(pi.currentPage)){
          pageLink.innerHTML = `<strong>${p}</strong>`
      }
      pagination.appendChild(pageLink)
  }

  if (pi.currentPage < pi.maxPage) {
      const nextLink = document.createElement('a');
      nextLink.setAttribute('data-value', pi.currentPage + 1);
      nextLink.innerHTML = '&gt;';
      pagination.appendChild(nextLink);
  }

   // 새로 생성된 링크에 이벤트 리스너 추가
   switch(ev){
    case document.querySelector("#pagination-area"):
        setPaginationEventListeners();
        break;
    case document.querySelector("#ingre-modal-pagination"):
        setIngreModalPaginationEventListeners();
        break;
    case document.querySelector("#modal-recipe-pagination"):
        setRecipeModalPaginationEventListeners();
}     
}

// 문의 사진 첨부

function fileInputClick() {
  const addQnaPicture = document.querySelector('#add_qna_product_pic');
  const fileInput = document.querySelector('#file-input');

  addQnaPicture.addEventListener('click', function(){
    fileInput.click();
  });
}


document.addEventListener("DOMContentLoaded", function(){


  // 문의하기 버튼 클릭 이벤트
  const qnaButton = document.querySelector("#btn_qna");
  qnaButton.addEventListener("click", function(){
    console.log("체크됨");
     fillQnaModal();
  });

  // 후기작성 버튼 클릭 이벤트
  const reviewButtons = document.querySelector(".tbody-td-btn-write");
  reviewButtons.addEventListener("click", function(){   
    console.log("체크됨리뷰");
          fullReviewModal();
          setRatingStar();
      });
      
});


 /** 냉장고 페이지바 a 태그에 클릭 이벤트 넣어주는 메소드 */
 function setPaginationEventListeners(paginationArea) {
  paginationArea.querySelectorAll(".pagination a").forEach(function(ev){
      ev.addEventListener("click", function(el){
          let cpage = el.currentTarget.getAttribute('data-value');
          switch(paginationArea){
            case document.querySelector("#review-pagination-area"):
              ajaxGetProductReviews({pno: pno , cpage: cpage});
                break;
            case document.querySelector("#qna-pagination-area"):
              ajaxGetProductQnAs({pno: pno ,cpage: cpage});
                break;
        }    
      });
  });
}


// ==========================================  화면 동적 구성 위한 메소드 ============================
// ajaxGetProduct에서 가져온 product 객체 정보를 토대로 화면에 나타날 정보 입력하는 콜백 함수
function inputProductInfo(recipeNo, profileLocation){
  console.log("실행됨");
  ajaxGetRecipeReviews({recipeNo: recipeNo, cpage: 1}, (res)=> putRecipeReviewList(res, profileLocation));

  ajaxGetRecipeQnAs({recipeNo: recipeNo, cpage: 1}, (res)=>putRecipeQnAList( res));
}

function putRecipeReviewList(res, contextPath) {
  const reviews = res.reviews;
  console.log("리뷰 ajax 실행됨");
  if (reviews.length > 0) {
      let drawReviewList = document.querySelector("#recipe_review_area");  
      reviews.forEach(rv => {
          let stars = '';
          for (let i = 1; i <= rv.rating; i++) {
              stars += '<i class="fa-solid fa-star" style="color: #FFD43B;" aria-hidden="true"></i>';
          }

          let reviewHTML = `
              <div class="product_review_item">
                  <div id="review_writer_area">
                      <div id="review_writer_pic_container">
                          <img id="review_writer_pic"
                              src="${contextPath}/resources/uploadfile/memberProfile/${rv.writerProfile}" alt="">
                      </div>
                      <div id="review_writer_id_rate">
                          <div id="review_writer_id"><span class="userName">
                              ${rv.writerNickname}
                          </span> <span class="commentDates">  
                                  ${rv.reviewCreateDate}
                                  <!-- |
                                  <span class="updateComments"> 수정</span> |
                                  <span class="deleteComents">삭제</span> </span></div> -->
                                  </span></div>
                          <div class="star_rating">
                              ${stars}
                          </div>
                      </div>
                  </div>
                  ${rv.reviewPhoto ? `
                  <div id="review_img_container">
                      <img class="review_img" src="${contextPath}/resources/uploadfile/recipe/recipeReview/${rv.reviewPhoto}"></img>
                  </div>` : ''}
                  <div id="review_content">
                      ${rv.reviewContent}
                  </div>
              </div>
          `;

          drawReviewList.innerHTML += reviewHTML;
      });
  }
  const reviewPaginationArea = document.querySelector("#review-pagination-area");
  updatePagination(reviewPaginationArea, res.pi);
}




function putRecipeQnAList( res) {
  const qnas = res.qnaList;

  if (qnas.length > 0) {
      const qnaContentTbody = document.querySelector('#qna_content > tbody');
      let qnaContentHtml = '';

      qnas.forEach(qna => {
          if (qna.qnaAnswerType == 1) {
              qnaContentHtml += `
                  <tr class="${qna.answerNo != 0 ? 'qna-area-hover' : 'qna-area'}" onclick="showQ(this)" data-answerno="${qna.answerNo}">                                           
                      <td class="qna_title" style="text-align: left;">${qna.qnaContent}</td>
                      <td class="qna_writer">${qna.writerNickname}</td>
                      <td class="qna_create_date">${qna.qnaCreateDate}</td>
                      <td class="qna_status">${qna.answerNo != 0 ? '답변 완료' : '답변 대기'}</td>
                  </tr>
              `;

              if (qna.answerNo != 0) {
                  qnaContentHtml += `
                      <tr class="answer_area" style="display: none;">
                          <td colspan="4" style="text-align: left;">
                              <div id="qna_q">
                                  <span class="span_q_a">Q</span><span>${qna.qnaContent}</span>
                                  <div id="review_img_container">
                                      ${qna.qnaPhoto ? `<img class="review_img" src="/gorang/resources/uploadfile/recipe/recipeQna/${qna.qnaPhoto}" alt="">` : ''}
                                  </div>
                              </div>
                              <div id="qna_a">
                                  <span class="span_q_a">A</span>
                                  <span>${qna.answerContent}</span>
                              </div>
                              <div id="qna_a_date">${qna.answerCreateDate}</div>                                            
                          </td>
                      </tr>
                  `;
              }
          }
        });
        qnaContentTbody.innerHTML += qnaContentHtml;

  }
  const qnaPaginationArea = document.querySelector("#qna-pagination-area");
  updatePagination(qnaPaginationArea, res.pi);
}

// 레시피 REVIEW 가져오는 ajax
function ajaxGetRecipeReviews(data, callback){
  $.ajax({
    url: "ajaxRecipeReview.re",
    type: "POST",
    data,
    success: function(res){
      console.log(res);
      callback(res);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}


// 레시피  QNA 가져오는 ajax
function ajaxGetRecipeQnAs(data, callback){
  $.ajax({
    url: "ajaxQnA.re",
    type: "POST",
    data,
    success: function(res){
      console.log(res);
      callback(res);
    },
    error: (function(){
      console.log("불러오기 실패")
    })
  });
}


/** QNA 모달 내 유저, 상품 정보 기입하는 함수 */
function fillQnaModal(){
  const qnaModal = document.querySelector("#qna_Modal");
  resetImage(qnaModal);

  setupFileInput(qnaModal);
}

/** review 모달 내 유저, 상품 정보 기입하는 함수 */
function fullReviewModal(){
  // 후기 작성 버튼을 자손으로 둔 tr 요소 찾기
  // const trEl = ev.currentTarget.closest(".tbody-buy-list-block");
  const reviewModal = document.querySelector("#buyList-review_Modal");
  resetImage(reviewModal);
  console.log(reviewModal);
  resetRating();

  setupFileInput(reviewModal);
} 



/** 이미지 파일 첨부 및 이미지 미리 보기 함수 */
function setupFileInput(modalElement) {
  const addPicBtn = modalElement.querySelector('.add_qna_product_pic');
  const fileInput = modalElement.querySelector('.file-input');
  const mainImgContainer = modalElement.querySelector('.qna_pic_container');

  console.log(addPicBtn);

  // 파일 입력 변경 이벤트 핸들러 정의
  function handleFileInputChange(e) {
      const file = e.target.files[0];
      if (file) {
          const reader = new FileReader();
          reader.onload = function (ev) {
              mainImgContainer.innerHTML = `<img class="qna-img" src="${ev.target.result}" alt="Selected Image">`;
          };
          reader.readAsDataURL(file);
          mainImgContainer.style.display = 'block';
      }
  
  }

  function handleFileInputClick(){
      console.log("파일이 클릭됩니다.");
      fileInput.click();
  }

    // 파일 첨부 버튼 클릭 이벤트 핸들러 등록
  addPicBtn.addEventListener("click", function(){
    console.log("클릭");
    handleFileInputClick();
  });

  // 파일 입력 변경 이벤트 핸들러 등록 (한 번만 등록하도록 수정)
  if (!fileInput._fileInputHandlerAdded) {
      fileInput.addEventListener("change", handleFileInputChange);
      fileInput._fileInputHandlerAdded = true;
  }

  // 모달이 화면에 표시될 때 이벤트 핸들러 등록
  // 제이쿼리를 사용해야 인식!!!!
  // 모달창 사라질 때 이벤트 핸들러 제거(이벤트 핸들러 중첩 방지)
  $('.modal').on('hidden.bs.modal', function () {
      // 모달이 숨겨질 때 수행할 작업을 여기에 작성
      console.log('모달이 숨겨짐');
      // 예시: 모달 내용 초기화
      addPicBtn.removeEventListener("click", handleFileInputClick);
      fileInput.removeEventListener("change", handleFileInputChange);
      fileInput._fileInputHandlerAdded = false; // 이벤트 핸들러 등록 여부 초기화
  });
}

/** 별점 평가 시 별 색칠하고 평점 값 설정하는 함수 */
function setRatingStar(){
  const stars = document.querySelectorAll(".modal-review-rating-content .star");
  const ratingInput = document.querySelector("input[name='rating']");

  stars.forEach(star => {
      star.addEventListener("click", function() {
          // data-value 값 가져옴
          let value = parseInt(this.getAttribute("data-value"));
          // input 에 값 넣기
          ratingInput.value = value;
          // 별 색칠하기
          highlightStars(value);
      });
  });

  function highlightStars(value) {
      stars.forEach(star => {
          const starValue = parseInt(star.getAttribute("data-value"));
          if (starValue <= value) {
              star.querySelector("path").setAttribute("fill", "#FFD700");
          } else {
              star.querySelector("path").setAttribute("fill", "#DBDBDB");
          }
      });
  };

}

/** 별점 리셋 */
function resetRating() {
  const ratingInput = document.querySelector("input[name='rating']");
  ratingInput.value = 0;
  const stars = document.querySelectorAll(".modal-review-rating-content .star");
  stars.forEach(star => {
      star.querySelector("path").setAttribute("fill", "#DBDBDB"); // Gray color
  });
}

/** 이미지 초기화 */
function resetImage(modalElement) {
  const fileInput = modalElement.querySelector('.file-input');
  fileInput.value = "";
  const mainImgContainer = modalElement.querySelector('.qna_pic_container');
  mainImgContainer.innerHTML = "";
  mainImgContainer.style.display = 'none';
}



//=========================== review 관련 메소드 ========================================

  // 리뷰 부분 구성하는 요소들 구축하는 메소드
  // 리뷰를 위해서는 상품 번호를 바로 참조하는 것이 아니라 유저가 구매한 상품 옵션을 통해 상품 번호를 가져와야함
  // 옵션명이 필요함!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  function insertReviewRecipe() {
    let parent = document.getElementById("buyList-review_Modal");
    let refMemberNo = parent.querySelector('input[type="hidden"][name="refMemberNo"]').value;
    let refRecipeNo = parent.querySelector('input[type="hidden"][name="refRecipeNo"]').value;
    let rating = parent.querySelector('input[type="hidden"][name="rating"]').value;
    let reviewContent = parent.querySelector('textarea[name="reviewContent"]').value;
    let reviewPhotoElement = parent.querySelector('input[type="file"][name="reviewPhotoUpfile"]');

    let formData = new FormData();
    formData.append("refMemberNo", parseInt(refMemberNo));
    formData.append("refRecipeNo", parseInt(refRecipeNo));
    formData.append("rating", parseInt(rating));
    formData.append("reviewContent", reviewContent);
    
    if (reviewPhotoElement && reviewPhotoElement.files && reviewPhotoElement.files[0]) {
        formData.append("reviewPhoto", reviewPhotoElement.files[0]);
    }

    ajaxinsertReview(formData, function(reviewData) {
        console.log("리뷰 추가 성공:", reviewData);
        resetRating();
        document.querySelector('#review_description_title').innerHTML += `
          <div id="product_review">
              <div id="review_writer_area">
                  <div id="review_writer_pic_container">
                      <img id="review_writer_pic"
                          src="/gorang/resources/uploadfile/memberProfile/${reviewData.writerProfile}" alt="">
                  </div>
                  <div id="review_writer_id_rate">
                      <div id="review_writer_id"><span class="userName">
                          ${reviewData.writerNickname}
                      </span> <span class="commentDates">  
                              ${reviewData.reviewCreateDate}
                              <!-- |
                              <span class="updateComments"> 수정</span> |
                              <span class="deleteComents">삭제</span> </span></div> -->
                      <div class="star_rating">
                          ${Array(reviewData.rating).fill('<i class="fa-solid fa-star" style="color: #FFD43B;" aria-hidden="true"></i>').join('')}
                      </div>
                  </div>
              </div>
              ${reviewData.reviewPhoto ? `
              <div id="review_img_container">
                  <img class="review_img" src="/gorang/resources/uploadfile/recipe/recipeReview/${reviewData.reviewPhoto}"></img>
              </div>
              ` : ''}
              <div id="review_content">
                  ${reviewData.reviewContent}
              </div>
          </div>
        `;
      });
      
    
}

function ajaxinsertReview(data, callback) {
    $.ajax({
        url: "insertReview.re",
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
        success: function(reviewData) {
            callback(reviewData);
            location.reload();
        },
        error: function() {
            alert("후기 작성에 실패했습니다.")
        }
    });
}





function showQ(element) {
  var answerNo = element.getAttribute('data-answerno');
  if (answerNo != 0) {
      var answerArea = element.nextElementSibling; // 다음 sibling 요소인 answer_area를 가져옴
      var allAnswerAreas = document.querySelectorAll('.answer_area'); // 모든 answer_area 요소를 가져옴
      
      // 클릭한 qna-area에 해당하는 answer_area의 현재 display 상태를 체크
      var isCurrentlyVisible = (answerArea.style.display === 'block');
      
      // 모든 answer_area 요소를 숨김 처리
      allAnswerAreas.forEach(function(item) {
          item.style.display = 'none';
      });

      // 클릭한 qna-area에 해당하는 answer_area의 display 상태를 토글
      if (!isCurrentlyVisible) {
          answerArea.style.display = 'block';
      }
  }

}



function insertQnARecipe() {
  let parent = document.getElementById("qna_Modal");
  let writerNo = parent.querySelector('input[type="hidden"][name="writerNo"]').value;
  let refRecipeNo = parent.querySelector('input[type="hidden"][name="refRecipeNo"]').value;
  console.log(refRecipeNo);
  let qnaContent = parent.querySelector('textarea[name="qnaContent"]').value;
  let qnaPhotoElement = parent.querySelector('input[type="file"][name="qnaPhotoUpfile"]');

  let formData = new FormData();
  formData.append("writerNo", parseInt(writerNo));
  formData.append("refRecipeNo", parseInt(refRecipeNo));
  formData.append("qnaContent", qnaContent);
  if (qnaPhotoElement && qnaPhotoElement.files && qnaPhotoElement.files[0]) {
    formData.append("qnaPhoto", qnaPhotoElement.files[0]);
  }

  ajaxinsertQnA(formData, function(qnaData) {
    let html = '';

      if (qnaData.qnaAnswerType === 1) {
          if (qnaData.answerNo !== 0) { // 답변이 있는 경우
              html += `
              <div class="qna-blocks">
                  <input type="hidden" value="${qnaData.answerNo}">
                  <tr class="qna-area-hover" onclick="showQ(this)" data-answerno="${qnaData.answerNo}">                                           
                      <td class="qna_title" style="text-align: left;">${qnaData.qnaContent}</td>
                      <td class="qna_writer">${qnaData.writerNickname}</td>
                      <td class="qna_create_date">${qnaData.qnaCreateDate}</td>
                      <td class="qna_status">답변 완료</td>
                  </tr>                                                                                   
                  <tr class="answer_area" style="display: none;">
                      <td colspan="4" style="text-align: left;">
                          <div id="qna_q">
                              <span class="span_q_a">Q</span><span>${qnaData.qnaContent}</span>
                              <div id="review_img_container">
                                  <img class="review_img" src="/gorang/resources/uploadfile/recipe/recipeQna/${qnaData.qnaPhoto}" alt="">
                              </div>
                          </div>
                          <div id="qna_a">
                              <span class="span_q_a">A</span><span>${qnaData.answerContent}</span>
                          </div>
                          <div id="qna_a_date">${qnaData.answerCreateDate}</div>                                            
                      </td>
                  </tr>                                         
              </div>`;
          } else { // 답변이 없는 경우
              html += `
              <div class="qna-blocks">
                  <input type="hidden" value="${qnaData.qnaNo}">
                  <tr class="qna-area" onclick="showQ(this)" data-answerno="${qnaData.answerNo}">                                           
                      <td class="qna_title" style="text-align: left;">${qnaData.qnaContent}</td>
                      <td class="qna_writer">${qnaData.writerNickname}</td>
                      <td class="qna_create_date">${qnaData.qnaCreateDate}</td>
                      <td class="qna_status">답변 대기</td>
                  </tr>
              </div>`;
          }
          document.querySelector('#tbodyQnA').innerHTML += html;
      }
  });


  
}
function ajaxinsertQnA(data, callback) {
  $.ajax({
      url: "insertQnA.re",
      type: "POST",
      data: data,
      contentType: false,
      processData: false,
      success: function(qnaData) {
          callback(qnaData);
          location.reload();
      },
      error: function() {
          alert("문의 작성에 실패했습니다.");
      }
  });
}

// 상품 상세로 가기
function goRecipeList(){
  let productNo =element.querySelector("input[type='hidden']").value;
  window.location.href ='detail.po?pno='+productNo;
}


//스크랩 추가
function scrapGet(element){
  let memberNo =document.querySelector("input[name='loginMemberNo']").value;
  let recipeNo = document.querySelector("input[name='loginrecipeNo']").value;

  let data ={
    memberNo:parseInt(memberNo),
    recipeNo:parseInt(recipeNo)
  }
  if(element.style.color === "1e90ff"){ //스트랩 취소 할 때
    ajaxdeleteRecipeScrap(data,function(result){
      document.querySelector("#scrap_area").innerHTML=`
        <i class="fa-regular fa-bookmark" style="font-size: 45px;"  onclick="scrapGet(this)"></i> 
        <div id="scrap_value"><strong  class="icon-text-area">${result}</strong></div>
      `
    });

  }
  else { //스트랩 할 때
    ajaxaddRecipeScrap(data,function(result){
       document.querySelector("#scrap_area").innerHTML=`
       <i class="fa-solid fa-bookmark" style="color: #1e90ff; font-size: 45px;"  onclick="scrapGet(this)"></i>
        <div id="scrap_value"><strong  class="icon-text-area">${result}</strong></div>
       `
    })
  }
}

//레시피 스크랩 취소
function ajaxdeleteRecipeScrap(data,callback){
  $.ajax({
    url: "deleteRecipeScrap.re",
    type: "POST",
    data: data,
    success: function(result) {
        callback(result);       
    },
    error: function() {
        alert("문의 작성에 실패했습니다.");
    }
  })
}
//레시피 스크랩하기
function ajaxaddRecipeScrap(data,callback){
  $.ajax({
    url: "addRecipeScrap.re",
    type: "POST",
    data: data,
    success: function(result) {
        callback(result);
    },
    error: function() {
        alert("문의 작성에 실패했습니다.");
    }
  })
}