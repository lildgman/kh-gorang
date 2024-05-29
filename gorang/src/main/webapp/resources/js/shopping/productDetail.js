window.onload = function () {


  //contextPath 담은 변수
  const contextPath = getContextPath();

  const pno =  getParameterPno()
  
  productLoad({pno},(product)=>inputProductInfo(product, contextPath))
  


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

  

  clickZzim();
  minusProductQuantity();
  plusProductQuantity();
  addProductToCart();
  clickBuyButton();
  fileInputClick();
  displaySelectedImage();
}

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


function productLoad(data, callback){
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

function inputProductInfo(product, contextPath){
  console.log(product)

  // 썸네일
  document.querySelector("#product-img-container > img").src = contextPath + "/resources/uploadfile/productimg/" + product.mainImg;

  //브랜드명
  document.querySelector("#product_brand > span").innerHTML = product.productBrand;

  

  
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