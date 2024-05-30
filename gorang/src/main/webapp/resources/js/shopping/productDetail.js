window.onload = function () {


  
  // productNo 담은 변수
  // product 객체 호출하는 ajax
  ajaxGetProduct({pno},(product)=>inputProductInfo(product, thumbnailLocation))
  
  clickZzim();

  minusProductQuantity();

  plusProductQuantity();

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
      





    }

  
    // 상품 평점 평균
    let ratingAvg = ratingSum / reviews.length;
    document.querySelector("#product_review_quantity").innerHTML = ratingAvg;


    // 리뷰 객체들 반복문
    // 각 리뷰

    //상품 평점 = 리뷰 객체들 반복문 -> 리뷰 평점 += -> 평점 sum / 리뷰들 length
    //리뷰 

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

  //리뷰 수, 리뷰 내용 가져오기
  ajaxGetProductReviews({pno}, (reviews)=>putProductReviewList(reviews))

  


  
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

// 문의 작성 완료 버튼 클릭시 발생하는 함수
function enrollQna() {
  alert("성공적으로 문의를 작성하였습니다.");
  location.reload();
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