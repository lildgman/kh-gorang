document.addEventListener("DOMContentLoaded", function () {
  // 전역 변수 초기화
  const contextPath = getContextPath();
  const pno = getParameterPno();
  const profileLocation = contextPath + "/resources/uploadfile/memberProfile/";

  // 파라미터값으로 뿌려주고 남은 정보창 채우기
  inputProductInfo(pno, profileLocation);

  // 이벤트 핸들러 등록
  clickZzim();
  addProductToCart();
  clickBuyButton();
  fileInputClick();
  displaySelectedImage();
});

// ======================== 유틸리티 함수 ===========================
// contextPath 저장
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

//페이지의 URL 에서 쿼리 파라미터 값 추출
function getParameterPno() {
  let query = window.location.search;
  let param = new URLSearchParams(query);
  let pno = param.get('pno');
  return pno;
}

// =================================== ajax 함수 =========================

//ajax 통신으로 pno 넘겨주고 해당 상품 번호 참조하는 리뷰들 호출
  function ajaxGetProductReviews(data, callback){
  $.ajax({
    url: "ajaxReview.po",
    data: data,
    success: function(result){
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

// 상품  qna 가져오는 ajax
function ajaxGetProductQnAs(data, callback){
  $.ajax({
    url: "ajaxQnA.po",
    data: data,
    success: function(result){
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

// 상품 옵션 가져오는 ajax
function ajaxGetProductOpts(data, callback){
  $.ajax({
    url: "ajaxOpt.po",
    data: data,
    success: function(result){
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

function ajaxPutPdoptInCart(data){
  $.ajax({
    url: "ajaxInsertCart.po",
    data: data,
    method: "POST",
    success: function(res){
      console.log(res);
      alert("장바구니에 추가되었습니다.");
    },
    error: function(){
      console.log("장바구니 입력 실패");
    }
  })
}

// ==========================================  화면 동적 구성 위한 메소드 ============================
// ajaxGetProduct에서 가져온 product 객체 정보를 토대로 화면에 나타날 정보 입력하는 콜백 함수
function inputProductInfo(pno, profileLocation){

  // 상품 선택 div 부분 높이 구하기
  document.getElementById("product-opt-form-wrapper").style.height = document.getElementById("productContent_area").offsetHeight + 300 +"px";

  //상품 총금액, 장바구니 및 구매하기 버튼 부분
  const productPriceBtnWrapper = document.querySelector("#product-price-btn-wrapper");
  productPriceBtnWrapper.style.display = "none";

  // 상품 선택하기
  ajaxGetProductOpts({pno}, (opts)=>putProductOptsForOrder(opts));

  
  //리뷰 수, 리뷰 내용 가져오기 미완!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 결제 페이지 먼저 구축
  ajaxGetProductReviews({pno}, (reviews)=>putProductReviewList(reviews, profileLocation));

  //상품 문의 가져오기
  ajaxGetProductQnAs({pno}, (qnas)=>putProductQnAList(pno, qnas));
}

// =========================== 제품 옵션 및 수량 조절 메소드 ======================
function putProductOptsForOrder(opts){
  //드롭다운 구현
  const pdoptLiST = document.querySelector(".product-opts-list");
  pdoptLiST.innerHTML = ""; // 기존 옵션 초기화

  //드롭박스에 옵션값 넣기
  for(let opt of opts){
    //옵션 부분
    const pdoptSelectOpt = document.createElement('li');
    pdoptSelectOpt.setAttribute("class", "product-opt-select-options")
    pdoptLiST.appendChild(pdoptSelectOpt);

    //옵션명
    const pdoptSelectOptName = document.createElement('span');
    pdoptSelectOptName.setAttribute("class", "product-opt-select-name");
    pdoptSelectOpt.appendChild(pdoptSelectOptName);
    pdoptSelectOptName.innerHTML = opt.detailOptionName; 

    //옵션 가격
    const pdoptSelectOptPrice = document.createElement('span');
    pdoptSelectOptPrice.setAttribute("class", "product-opt-select-price");
    pdoptSelectOpt.appendChild(pdoptSelectOptPrice);
    pdoptSelectOptPrice.innerHTML = opt.detailOptionSaledPrice.toLocaleString();

    //옵션 번호 hidden
    const pdoptSelectOptNo = document.createElement('input');
    pdoptSelectOptNo.setAttribute("type", "hidden");
    pdoptSelectOptNo.setAttribute("class", "product-opt-select-no")
    pdoptSelectOpt.appendChild(pdoptSelectOptNo);
    pdoptSelectOptNo.value = opt.detailOptionNo;
  }
  
  //드롭박스 구현
  $(".product-opt-select").on("click", function (e) {
    e.preventDefault();
    const $optsList = $(".product-opts-list");
    if (!$optsList.hasClass("active")) {
      $optsList.addClass("active");
      $optsList.children("li").slideDown(300);
    } else {
      $optsList.removeClass("active");
      $optsList.children("li").slideUp(300);
    }
  });


  //드롭박스 li요소 클릭 시 하단에 수량 조절하는 부분 생성
  $(".product-opts-list").on("click", ".product-opt-select-options", function (ev) {
    
    // 상품 선택 항목에서 보여지는 부분
    const selectedOption = $(this);
    const selectedOptionNo = selectedOption.find(".product-opt-select-no").val();
    const selectedOptionName = selectedOption.find(".product-opt-select-name").text();
    const selectedOptionPrice = selectedOption.find(".product-opt-select-price").text();
    //parseFloat?

    if (!isOptionAlreadySelected(selectedOptionName)) {
      createQuantityAdjustment(selectedOptionNo, selectedOptionName, selectedOptionPrice);
    }
  });

  // 선택한 옵션이 이미 존재하는지 확인하는 함수
  function isOptionAlreadySelected(optionName) {
    let isOptionAlreadySelected = false;
    $(".product_quantity_content .pname").each(function () {
      if ($(this).text() === optionName) {
        isOptionAlreadySelected = true;
        return false; // each 루프 종료
      }
    });
    return isOptionAlreadySelected;
  }

 // 옵션별 수량 조절 부분 생성하는 메소드
  function createQuantityAdjustment(optionNo, optionName, optionPrice){ 

    // 수량 조절 부분 생성
    const pdQuantityContent = document.createElement('div');
    pdQuantityContent.setAttribute("class", "product_quantity_content");

    // 상품옵션명
    const selectedProductName = document.createElement('div');
    selectedProductName.setAttribute("class", "pname");
    selectedProductName.innerHTML = optionName; // 첫번째 span 의 innerHTML
    pdQuantityContent.appendChild(selectedProductName);

    // 옵션 번호 hidden
    const pdoptSelectOptNo = document.createElement('input');
    pdoptSelectOptNo.setAttribute("type", "hidden");
    pdoptSelectOptNo.setAttribute("class", "product-opt-select-no");
    pdoptSelectOptNo.value = optionNo;
    pdQuantityContent.appendChild(pdoptSelectOptNo);

    // 옵션 수량 조절
    const pdAmountPrice = document.createElement('div');
    pdAmountPrice.setAttribute("class", "product_amount_price");
    pdQuantityContent.appendChild(pdAmountPrice);
    const pamountBtn = document.createElement('div');
    pamountBtn.setAttribute("id", "pamount_btn");
    pdAmountPrice.appendChild(pamountBtn);

    //마이너스 버튼
    const pbtnMinusQuantity = document.createElement('div');
    pbtnMinusQuantity.setAttribute("class", "pbtn minus_quantity");
    pamountBtn.appendChild(pbtnMinusQuantity);
    pbtnMinusQuantity.innerHTML = "-";

    //수량 보여주는 input 요소
    const pbtnQuantity = document.createElement('input');
    pbtnQuantity.setAttribute("class", "pbtn quantity pbtn-quantity");
    pbtnQuantity.setAttribute("type", "text");
    pbtnQuantity.value = "1";
    pamountBtn.appendChild(pbtnQuantity);

    // 플러스 버튼
    const pbtnPlusQuantity = document.createElement('div');
    pbtnPlusQuantity.setAttribute("class", "pbtn plus_quantity");
    pamountBtn.appendChild(pbtnPlusQuantity);
    pbtnPlusQuantity.innerHTML = "+";

    // 가격 보여주는 부분
    const productPriceView = document.createElement('div');
    productPriceView.setAttribute("class", "product-price-view");
    pdAmountPrice.appendChild(productPriceView);

    // 정상가
    const productBasicPrice = document.createElement('span');
    productPriceView.appendChild(productBasicPrice);
    productBasicPrice.setAttribute("class", "product-price-basicPrice");
    productBasicPrice.innerHTML = optionPrice; // 두번째 span 의 innerHTML부분

    // 할인가
    const productDiscountedPrice = document.createElement('span');
    productPriceView.appendChild(productDiscountedPrice);
    productDiscountedPrice.setAttribute("class", "product-price-discountedPrice");

    //삭제버튼
    const selectedOptDelete = document.createElement('div');
    productPriceView.appendChild(selectedOptDelete);
    selectedOptDelete.setAttribute("class", "product-quantity-delete");
    // 폰트 어썸 부분
    const xMark = document.createElement('i');
    selectedOptDelete.appendChild(xMark);
    xMark.setAttribute("class", "fa-solid fa-xmark");

    document.querySelector("#product_quantity_area").appendChild(pdQuantityContent);

    updateTotalPrice();

  }

  // 삭제 버튼 클릭 이벤트 추가
  $("#product_quantity_area").on("click", ".product-quantity-delete", function () {
    $(this).closest(".product_quantity_content").remove();
    updateTotalPrice();
  });

   // 수량 조절 버튼 이벤트 추가
   $("#product_quantity_area").on("click", ".minus_quantity, .plus_quantity", function () {
    const $quantityInput = $(this).siblings(".pbtn-quantity");
    let quantity = parseInt($quantityInput.val());

    if ($(this).hasClass("minus_quantity") && quantity > 1) {
      quantity -= 1;
    } else if ($(this).hasClass("plus_quantity")) {
      quantity += 1;
    }

    $quantityInput.val(quantity);
    updateTotalPrice();
  });

  // 총금액 산출하는 함수
  function calculateTotalPrice() {
    let caltotalPrice = 0;
    $(".product_quantity_content").each(function () {
      const quantity = parseInt($(this).find(".pbtn-quantity").val());
      const price = parseFloat($(this).find(".product-price-basicPrice").text().replace("$", "").replace(",", ""));
      caltotalPrice += quantity * price;
    });
    return caltotalPrice;
  }

  // 총금액 업데이트 함수
  function updateTotalPrice() {
    const totalPrice = calculateTotalPrice();
    document.querySelector(".product-price").innerHTML = totalPrice.toLocaleString();
    if (totalPrice > 0) {
      $("#product-price-btn-wrapper").show();
    } else {
      $("#product-price-btn-wrapper").hide();
    }
  }

}

// DOM 이 완전히 로드되지 않은 상태에서 이벤트 리스너 발생하여 document.querySelector("#product-buy-btn") 를 찾지 못하는 상황 발생
// 따라서 "DOMContentLoaded" 이벤트 리스너를 추가
document.addEventListener("DOMContentLoaded", function(){

  // 장바구니 버튼 클릭 이벤트
  document.querySelector(".btn_cart").addEventListener("click", function (){
    const selectedOptsForCart = [];

    // 각 옵션번호, 수량을 가져와서 JSON 형태로 저장
    document.querySelectorAll(".product_quantity_content").forEach(function(ev){
      const selectedOptNo = ev.querySelector(".product-opt-select-no").value;
      const selectedOptQnt = ev.querySelector(".pbtn-quantity").value;

      selectedOptsForCart.push({
        pdOptNo: selectedOptNo,
        pdOptQuantity: selectedOptQnt
      });
    });

    //Json 문자열로 변환
    selectedOptsForCartJson = JSON.stringify(selectedOptsForCart);

    ajaxPutPdoptInCart(selectedOptsForCartJson);

  })
  
  // JSON 형식으로 보내기 위한 구매하기 버튼 클릭 이벤트
  document.querySelector("#product-buy-btn").addEventListener("click", function(){
    // array 변수 선언
    const selectedOpts = [];
    
    // 각 옵션번호, 수량을 가져와서 JSON 형태로 저장
    document.querySelectorAll(".product_quantity_content").forEach(function(ev){
      const selectedOptNo = ev.querySelector(".product-opt-select-no").value;
      const selectedOptName = ev.querySelector(".pname").innerHTML;
      const selectedOptQnt = ev.querySelector(".pbtn-quantity").value;
      const selectedOptPrice = ev.querySelector(".product-price-basicPrice").innerHTML.replace(/,/g, "");
      const selectedPno = document.querySelector("#product-no").value;
      const productBrand = document.querySelector("#input-productBrand").value;
      const productName = document.querySelector("#input-productName").value;
      const mainImg = document.querySelector("#input-mainImg").value;
      const shipmentType = document.querySelector("#input-shipmentType").value;

      selectedOpts.push({
          detailOptionNo: selectedOptNo,
          detailOptionName: selectedOptName,
          detailOptionQuantity: selectedOptQnt,
          detailOptionSaledPrice: selectedOptPrice,
          productNo: selectedPno,
          productBrand: productBrand,
          productName: productName,
          mainImg: mainImg,
          productShipment: shipmentType
    });
    });

    //Json 문자열로 변환
    selectedOptsJson = JSON.stringify(selectedOpts);

    //hidden input 에 json 넣기
    document.querySelector("input[name='selectedOptList']").value = selectedOptsJson;

    //제출
    document.querySelector("#product-opt-form").submit();
  });
})




//=========================== review 관련 메소드 ========================================

  // 리뷰 부분 구성하는 요소들 구축하는 메소드
  // 리뷰를 위해서는 상품 번호를 바로 참조하는 것이 아니라 유저가 구매한 상품 옵션을 통해 상품 번호를 가져와야함
  // 옵션명이 필요함!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function putProductReviewList(reviews, profileLocation){
    const productReviewArea = document.querySelector("#product_review_area");
    // 리뷰수
    document.querySelector("#product_review_quantity").innerHTML = reviews.length;
    // 평점 평균 변수
    let ratingSum = 0;
    for(let review of reviews){

      ratingSum += review.rating;
      //리뷰 내용 담을 div
      const productReview = document.createElement('div');
      productReview.setAttribute("class", "product_review");
      productReviewArea.appendChild(productReview);
      //작성자 정보 담은 div
      const reviewWriterArea = document.createElement('div');
      reviewWriterArea.setAttribute("class", "review_writer_area");
      productReview.appendChild(reviewWriterArea);
      // 작성자 프로필 사진 영역
      const writerPicContainer = document.createElement('div');
      writerPicContainer.setAttribute("class", "review_writer_pic_container");
      reviewWriterArea.appendChild(writerPicContainer);
      // 작성자 프로필 이미지
      const writerPic = document.createElement('img');
      writerPic.setAttribute("class", "review_writer_pic");
      writerPicContainer.appendChild(writerPic);
      writerPic.src = profileLocation + review.writerProfile;
      // 작성자 id, 평점 영역
      const reviewWriterIdRate = document.createElement('div');
      reviewWriterIdRate.setAttribute("class", "review_writer_id_rate");
      reviewWriterArea.appendChild(reviewWriterIdRate);
      // 작성자 아이디
      const reviewWriterId = document.createElement('div');
      reviewWriterId.setAttribute("class", "review_writer_id");
      reviewWriterIdRate.appendChild(reviewWriterId);
      reviewWriterId.innerHTML = review.writerNickname;
      // 작성자 평점
      const reviewRate = document.createElement('div');
      reviewRate.setAttribute("class", "review_rate");

      const reviewRateStar = document.createElement('i');
      reviewRateStar.setAttribute("class", "fa-solid fa-star");
      reviewRateStar.setAttribute("style", "color: #FFD43B;");
      // 리뷰의 평점만큼 반복문 돌려서 별 모양 표시
      for(let i = 0; i < review.rating; i++){
        reviewRate.appendChild(reviewRateStar);
      }

      const reviewProductName = document.createElement('div');
      reviewProductName.setAttribute("class", "review_product_name");
      productReview.appendChild(reviewProductName);
      // 유저가 구입한 상품의 옵션명을 가져와야함
      reviewProductName.innerHTML;

      const reviewContent = document.createElement('div');
      reviewContent.setAttribute("class", "review_content");
    }
    // 상품 평점 평균
    let ratingAvg = (ratingSum / reviews.length).toFixed(1);
    document.querySelector("#product_grade").innerHTML = ratingAvg;
}

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
      qnaContentQuestionTd.innerHTML = qna.qnaContent;

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


// ============================ 이벤트 처리 메소드 ======================

//찜버튼 눌렀을 때 발생하는 이벤트
function clickZzim() {

  let zzimStatus = false;

  const zzim = document.querySelector("#zzim");
  zzim.addEventListener("click", function () {

    if (!zzimStatus) {
      zzim.innerHTML = `<i class="fa-solid fa-heart fa-xl" style="color: #ff0000;"></i>`;
      zzimStatus = true;
    } else {
      zzim.innerHTML = `<i class="fa-regular fa-heart fa-xl"></i>`;
      zzimStatus = false;
    }
  })
}

// 문의 사진 첨부

function fileInputClick() {
  const addQnaPicture = document.querySelector('#add_qna_product_pic');
  const fileInput = document.querySelector('#file-input');

  addQnaPicture.addEventListener('click', function(){
    fileInput.click();
  });
}

function displaySelectedImage() {
  const fileInput = document.querySelector('#file-input');
  let mainImgContainer = document.querySelector('#qna_pic_container');

  fileInput.addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (ev) {
        mainImgContainer.innerHTML = `<img id="qna-img" src="${ev.target.result}" alt="Selected Image">`;
      };
      reader.readAsDataURL(file);
      console.log(mainImgContainer.style.display);
      mainImgContainer.style.display = 'block';
    }
  });
}


// ======================== 네비게이션 및 페이지 이동 =========================

// nav 눌렀을 때 발생하는 함수
function scrollToDiv(div) {
  const divOffsetTop = document.querySelector(div).offsetTop;
  window.scrollTo(0, divOffsetTop - 225);
}

