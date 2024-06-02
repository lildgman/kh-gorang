window.onload = function () {


  
  // productNo 담은 변수
  // product 객체 호출하는 ajax
  ajaxGetProduct({pno},(product)=>inputProductInfo(product, thumbnailLocation))
  
  clickZzim();

  addProductToCart();

  clickBuyButton();

  fileInputClick();

  displaySelectedImage();
}

//contextPath 담은 변수
const contextPath = getContextPath();

const pno =  getParameterPno()

// 상품 썸네일 저장 위치
const thumbnailLocation = contextPath + "/resources/uploadfile/product/productimg/";
// 프로필 사진 저장 위치
const profileLocation = contextPath + "/resources/uploadfile/memberProfile/";

// contextPath 저장
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

//페이지의 URL 에서 쿼리 파라미터 값 추출

function getParameterPno() {
  let query = window.location.search;
  let param = new URLSearchParams(query);
  let pno = param.get('pno');
  console.log(pno);
  return pno;
}


function ajaxGetProduct(data, callback){
  $.ajax({
    url: "ajaxDetail.po",
    data: data,
    success: function(result){
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

// ========================== 구매 관련 메소드 =====================
function putProductOptsForOrder(opts){
  //드롭다운 구현

  //select 요소 가져오기
  const pdoptLiST = document.querySelector(".product-opts-list");
  //셀렉트의 옵션값 넣기
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
    pdoptSelectOptPrice.innerHTML = opt.detailOptionSaledPrice;
  }
  

  //셀렉트 요소 change 시 하단에 수량 조절하는 부분 생성
  pdoptSelect.addEventListener("change", function(ev){
    const pdQuantityContent = document.createElement('div');
    pdQuantityContent.setAttribute("class", "product_quantity_content");
    document.querySelector("#product_quantity_area").appendChild(pdQuantityContent);

    // 상품옵션명
    const selectedProductName = document.createElement('div');
    selectedProductName.setAttribute("class", "pname");
    selectedProductName.innerHTML = ev.target.options[ev.target.selectedIndex].innerHTML;
    pdQuantityContent.appendChild(selectedProductName);

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
    productBasicPrice.innerHTML;
    
    // 할인가
    const productDiscountedPrice = document.createElement('span');
    productPriceView.appendChild(productDiscountedPrice);
    productDiscountedPrice.setAttribute("class", "product-price-discountedPrice");
    


    // minusProductQuantity();

    // plusProductQuantity();
  })

 


  
}


//=========================== review 관련 메소드 ========================================

  //ajax 통신으로 pno 넘겨주고 해당 상품 번호 참조하는 리뷰들 호출
  function ajaxGetProductReviews(data, callback){
  $.ajax({
    url: "ajaxReview.po",
    data: data,
    success: function(result){
      console.log(result);
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

  // 리뷰 부분 구성하는 요소들 구축하는 메소드
  // 리뷰를 위해서는 상품 번호를 바로 참조하는 것이 아니라 유저가 구매한 상품 옵션을 통해 상품 번호를 가져와야함
  // 옵션명이 필요함!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function putProductReviewList(reviews){
    
    console.log(reviews.length);

    const productReviewArea = document.querySelector("#product_review_area");
    
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
    let ratingAvg = ratingSum / reviews.length;
    document.querySelector("#product_review_quantity").innerHTML = ratingAvg;
}

// ============================= QNA 관련 메소드 ====================================
function ajaxGetProductQnAs(data, callback){
    $.ajax({
      url: "ajaxQnA.po",
      data: data,
      success: function(result){
        console.log(result);
        callback(result);
      },
      error: function(){
        console.log("불러오기 실패")
      }
    });
}
  // 문의 구축하는 메소드
function putProductQnAList(qnas){

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

// 상품 옵션 가져오는 ajax
function ajaxGetProductOpts(data, callback){
  $.ajax({
    url: "ajaxOpt.po",
    data: data,
    success: function(result){
      console.log(result);
      callback(result);
    },
    error: function(){
      console.log("불러오기 실패")
    }
  });
}

 // 문의하기 모달창 구축하는 메소드
function inquireQuestion(opts){
  console.log("test");
  // 옵션명 보여줄 셀렉트
  const inputForPno = document.createElement('input');
  inputForPno.setAttribute("type", "hidden");
  inputForPno.setAttribute("name", "refProductNo");
  inputForPno.setAttribute("value", pno);
  document.querySelector("#modal-qna-content").appendChild(inputForPno);
  const optnameSelect = document.querySelector("#qna_product_name");
  
  // 상품 옵션 불러와서 넣기
  for(let opt of opts){
     const optnames = document.createElement('option');
     optnameSelect.appendChild(optnames);
     optnames.setAttribute('value', opt.detailOptionNo);
     optnames.innerHTML = opt.detailOptionName;
  }
}



// ajaxGetProduct에서 가져온 product 객체 정보를 토대로 화면에 나타날 정보 입력하는 콜백 함수
function inputProductInfo(product, thumbnailLocation){
  console.log(product)

  // 썸네일
  document.querySelector("#product-img-container > img").src = thumbnailLocation + product.mainImg;

  //브랜드명
  document.querySelector("#product_brand > span").innerHTML = product.productBrand;

  //상품명
  document.querySelector("#product_name").innerHTML = product.productName;

  //가격
  document.querySelector("#product_origin_price").innerHTML = product.normalPrice;

  //할인율
  document.querySelector("#product_discount_percent").innerHTML = product.discountPercent;

  //할인된 가격
  document.querySelector("#product_discounted_price").innerHTML = product.salePrice;


  // 상품 선택하기(미구현)
  ajaxGetProductOpts({pno}, (opts)=>putProductOptsForOrder(opts));

  //리뷰 수, 리뷰 내용 가져오기 미완!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 결제 페이지 먼저 구축
  ajaxGetProductReviews({pno}, (reviews)=>putProductReviewList(reviews));

  //상품 문의 가져오기
  ajaxGetProductQnAs({pno}, (qnas)=>putProductQnAList(qnas));



}

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

// 수량 - 해주는 버튼
function minusProductQuantity() {

  let minusDivs = document.querySelectorAll(".minus_quantity");
  let productQuantityDivs = document.querySelectorAll(".quantity");


  minusDivs.forEach(function (minusDiv) {

    minusDiv.addEventListener("click", function (e) {
      e.preventDefault();
      productQuantityDivs.forEach(function (productQuantityDiv) {

        let intProductQuantity = parseInt(productQuantityDiv.value);

        if (intProductQuantity > 1) {
          quantity = intProductQuantity - 1;
          productQuantityDiv.value = quantity;
        }
      })
      console.log("minus : " + quantity);
      calculateTotalPrice(quantity);
    })
  })
}

// 수량 + 해주는 버튼
function plusProductQuantity() {
  let plusDivs = document.querySelectorAll(".plus_quantity");
  let productQuantityDivs = document.querySelectorAll(".pbtn-quantity");

  plusDivs.forEach(function (plusDiv) {
    plusDiv.addEventListener("click", function (e) {
      e.preventDefault();

      productQuantityDivs.forEach(function (productQuantityDiv) {

        let intProductQuantity = parseInt(productQuantityDiv.value);

        quantity = intProductQuantity + 1;

        productQuantityDiv.value = quantity;

      })
      console.log("plus :" + quantity);
      calculateTotalPrice(quantity);
    })
  })
}



function calculateTotalPrice(currentQuantity) {
  let productPrice = document.querySelector("#product_discounted_price").innerText.replace(/,/g, '');
  let productPriceSpans = document.querySelectorAll(".product-price");
  let totalPrice = (productPrice*currentQuantity).toLocaleString();


  productPriceSpans.forEach(function(productPriceSpan) {
    productPriceSpan.innerHTML = totalPrice;
  })
}

// 장바구니 눌렀을 때 발생하는 이벤트 함수
function addProductToCart() {
  const addProductToCartBtns = document.querySelectorAll(".btn_cart");

  addProductToCartBtns.forEach(function (addProductToCartBtn) {

    addProductToCartBtn.addEventListener("click", function () {

      alert("장바구니에 추가되었습니다.");
    })
  })
}

// 구매하기 눌렀을 때 발생하는 이벤트
function clickBuyButton() {
  let buybtns = document.querySelectorAll(".btn_buy");

  buybtns.forEach(function (buybtn) {
    buybtn.addEventListener("click", function () {
      window.location.href = "/gorang/order";
    })
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

// nav 눌렀을 때 발생하는 함수
function scrollToDiv(div) {
  const divOffsetTop = document.querySelector(div).offsetTop;
  window.scrollTo(0, divOffsetTop - 225);
}

// 페이지 이동 함수
function moveToPage(url) {
  window.location.href = url;
}



// $(function(){
//   options("order.po", {productNo: '${product.productNo}'}, function(result){
//     drawOpt(result);

//   })
// })


// function options(url, data, callback){
//   $.ajax({
//     url: url,
//     data: data,
//     success: function(result){
//       console.log(result);
//       callback(result);
//     },
//     error: function(){
//       console.log("옵션 불러오기 실패");
//     }
//   });
// }

// function drawOpt(result){
//   if(result.length === 0) return;
//   const pdOpt = document.querySelector("#product-opts");

//   for(let el of result){
//     const pdOptDetail =  document.createElement("select");
//     pdOptDetail.setAttribute("class", "#product-opts");

//     pdOptDetail.innerHTML += `<options>` + el.detailOptionName + `<options>`;
  
//     pdOpt.appendChild(pdOptDetail);
//   }
// }