window.onload = function () {

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

          let intProductQuantity = parseInt(productQuantityDiv.innerText);

          if (intProductQuantity > 1) {
            quantity = intProductQuantity - 1;
            productQuantityDiv.innerHTML = quantity;
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
    let productQuantityDivs = document.querySelectorAll(".quantity");

    plusDivs.forEach(function (plusDiv) {
      plusDiv.addEventListener("click", function (e) {
        e.preventDefault();

        productQuantityDivs.forEach(function (productQuantityDiv) {

          let productQuantity = parseInt(productQuantityDiv.innerText);

          quantity = productQuantity + 1;

          productQuantityDiv.innerHTML = quantity;

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