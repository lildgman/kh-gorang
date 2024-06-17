document.addEventListener("DOMContentLoaded", function () {
  // 전역 변수 초기화
  const contextPath = getContextPath();
  const recipeNo = getParameterPno();

  // 파라미터값으로 뿌려주고 남은 정보창 채우기
  inputProductInfo(recipeNo, contextPath);

  // 이벤트 핸들러 등록
  fileInputClick();
  // displaySelectedImage();
  setRatingStar();
});


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


// ==========================================  화면 동적 구성 위한 메소드 ============================
// ajaxGetProduct에서 가져온 product 객체 정보를 토대로 화면에 나타날 정보 입력하는 콜백 함수
function inputProductInfo(recipeNo, profileLocation){

  //리뷰 수, 리뷰 내용 가져오기
  // ajaxGetRecipeReviews({recipeNo}, (reviews)=>putRecipeReviewList(reviews, profileLocation));

  //상품 문의 가져오기
  // ajaxGetRecipeQnAs({recipeNo}, (qnas)=>putRecipeQnAList(recipeNo, qnas));
}


// =================================== ajax 함수 =========================

//ajax 통신으로 pno 넘겨주고 해당 레시피 번호 참조하는 리뷰들 호출
// function ajaxGetRecipeReviews(data, callback){
//   $.ajax({
//     url: "ajaxRecipeReview.re",
//     data: data,
//     success: function(result){
//       callback(result);
//     },
//     error: function(){
//       console.log("불러오기 실패")
//     }
//   });
// }

// 레시피  qna 가져오는 ajax
function ajaxGetRecipeQnAs(data, callback){
  $.ajax({
    url: "ajaxRecipeQnA.re",
    data: data,
    success: function(result){
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}



/** QNA 모달 내 유저, 상품 정보 기입하는 함수 */
function fillQnaModal(){
  const qnaModal = document.querySelector("#qna_Modal");
  resetImage(qnaModal);
  // 모달 내 참조 상품 번호 입력
  // qnaModal.querySelector("input[name='refProductNo']").value = trEl.querySelector(".buyList-input-productNo").value;
  // 모달 내 상품명, 상품 옵션번호, 옵션명
  // qnaModal.querySelector(".qna_product_name").innerHTML = trEl.querySelector(".product-name").innerHTML;
  // qnaModal.querySelector(".qna_pdopt_name > option").value = trEl.querySelector(".buyList-input-pdOptNo").value;
  // qnaModal.querySelector(".qna_pdopt_name > option").innerHTML = trEl.querySelector(".product-opt-name").innerHTML;
  console.log(qnaModal);
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
  // 모달 내 참조 상품 번호 입력
  // reviewModal.querySelector("input[name='refProductNo']").value = trEl.querySelector(".buyList-input-productNo").value;
  // 모달 내 상품명, 상품 옵션번호, 옵션명
  // reviewModal.querySelector(".qna_product_name").innerHTML = trEl.querySelector(".product-name").innerHTML;
  // reviewModal.querySelector(".qna_pdopt_name > option").value = trEl.querySelector(".buyList-input-pdOptNo").value;
  // reviewModal.querySelector(".qna_pdopt_name > option").innerHTML = trEl.querySelector(".product-opt-name").innerHTML;

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
//   function putRecipeReviewList(reviews, contextPath){
//     const productReviewArea = document.querySelector("#product_review_area");
    
 




//     let ratingAvg = (ratingSum / reviews.length).toFixed(1);
//     document.querySelector("#product_grade").innerHTML = ratingAvg;

//     const reviewPagenationAreaDiv = document.createElement('div');
//     reviewPagenationAreaDiv.setAttribute("id", "review_pagination_area");
//     reviewPagenationAreaDiv.innerHTML = `<div id="review_pagination">
//                                             <a href="#">&lt;</a>
//                                             <a href="#">1</a>
//                                             <a href="#">2</a>
//                                             <a href="#">&gt;</a>
//                                          </div>`
//     productReviewArea.appendChild(reviewPagenationAreaDiv);
// }

// ============================= QNA 관련 메소드 ====================================
  // 문의 구축하는 메소드
function putProductQnAList(pno, qnas){

  // 상품 문의 모달
    // 문의하기 버튼
    const qnaModalBtn = document.querySelector("#qna_top > button");
    // 문의하기 버튼 클릭 시 상품 문의 모달 내용 채우는 메소드 발동
    qnaModalBtn.addEventListener("click", function(){
      ajaxGetProductOpts({pno},(opts)=>inquireQuestion(opts));
    })

  // 문의 내용
    const qnaContentTbody = document.querySelector('#qna_content > tbody');

    let qnaStatus = "답변대기";

    for(let qna of qnas){
      // 답변글일 경우 노출안시킴
      if(qna.qnaAnswerType === 2){
        continue;
      }
      //tr 생성
      const qnaContentTableTr = document.createElement('tr');
      qnaContentTableTr.setAttribute("class", "qna_content_tr")
      qnaContentTbody.appendChild(qnaContentTableTr);
      //qna 제목 td 생성
      const qnaTitle = document.createElement('td');
      qnaContentTableTr.appendChild(qnaTitle);
      qnaTitle.setAttribute("class", "qna_title");
      qnaTitle.innerHTML = qna.qnaContent;
      //qna 작성자, 작성일 td 생성
      qnaContentTableTr.innerHTML += `<td class="qna_writer">${qna.writerNickname}</td>`
      qnaContentTableTr.innerHTML += `<td class="qna_create_date">${qna.qnaCreateDate}</td>`

      if(qna.answerNo != 0){
        qnaStatus = "답변완료"
      }
       //답변 여부 보여주는 부분
       qnaContentTableTr.innerHTML += `<td class="qna_status">${qnaStatus}</td>`

      //qna
      //qna 내용 생성
      const qnaQuestionTr = document.createElement('tr');
      qnaQuestionTr.setAttribute("class", "qna_content_tr_display_none");
      qnaQuestionTr.setAttribute("style", "border: none");
      qnaContentTbody.appendChild(qnaQuestionTr);
      // 질문 상세
      const qnaContentQuestionTd = document.createElement('td');
      qnaQuestionTr.appendChild(qnaContentQuestionTd);
      qnaContentQuestionTd.setAttribute("style", "text-align: left");
      qnaContentQuestionTd.setAttribute("colspan", "4");
      qnaContentQuestionTd.innerHTML = `<span>질문</span> <br>
                                        <img src="/gorang/resources/uploadfile/qna/product-qna/${qna.qnaPhoto}">
                                        <p>${qna.qnaContent}</p>`

      //만약 답변이 있다면 생성
      if(qna.answerNo != 0){
        // 답변 상세
        const qnaContentAnswerTd = document.createElement('td');
        qnaQuestionTr.appendChild(qnaContentAnswerTd);
        qnaContentAnswerTd.setAttribute("style", "text-align: left");
        qnaContentAnswerTd.setAttribute("colspan", "4");
        qnaContentAnswerTd.innerHTML = `${qna.answerContent} <br> ${qna.answerCreateDate}`;
      }
    
      //답변 여부 초기화
      qnaStatus = "답변대기";
    }

     // 이벤트 핸들러 등록
  $(".qna_content_tr").click(function() {
    // 현재 보이는 상세 내용 숨기기
    $(".qna_content_tr_display").removeClass("qna_content_tr_display").addClass("qna_content_tr_display_none");

    // 클릭된 요소의 다음 요소(상세 내용) 보이게 하기
    $(this).next().removeClass("qna_content_tr_display_none").addClass("qna_content_tr_display");
  });
      //페이지 처리!!!!!!!!!!!!!!!!!!!!!!!
}

 // 문의하기 모달창 구축하는 메소드
function inquireQuestion(opts){
  console.log(opts);
  // 옵션명 보여줄 셀렉트
  const optnameSelect = document.querySelector("#qna_product_name");
  // 상품 옵션 불러와서 넣기
  for(let opt of opts){
     const optnames = document.createElement('option');
     optnameSelect.appendChild(optnames);
     optnames.setAttribute('value', opt.detailOptionNo);
     optnames.innerHTML = opt.detailOptionName;
  }
}


function showQ(element){
  let parent =element.closest(".qna-blocks");
  console.log(parent);
  let showDiv = parent.querySelector("#answer_area");
  if(showDiv.style.display==="none"){
    showDiv.style.display="block";
  }else{
    showDiv.style.display="none";
  }
}