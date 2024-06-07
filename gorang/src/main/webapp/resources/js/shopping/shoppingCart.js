window.onload = function () {

  checkAll();

  updateQuantity();

  updateTotalPrice();

}

function ajaxForDeleteCart(data){
  $.ajax({
    url: "ajaxDeleteCart.po",
    data: JSON.stringify(data),
    contentType: "application/json", 
    method: "post",
    success: function(res){
      console.log(res)
    },
    error: function(){
      console.log("송신 실패")
    }
  })
}


 function checkAll() {
    let allCheckLabel = document.querySelector('#all-check-label');
    let allCheckbox = document.querySelector('#all-select-checkbox');

    allCheckLabel.addEventListener('click', function () {

      let checkboxes = document.querySelectorAll('.select-checkbox');

      if (allCheckbox.checked) {
        checkboxes.forEach(function(checkbox) {
          checkbox.checked = false;
        });
      } else {
        checkboxes.forEach(function(checkbox) {
          checkbox.checked = true;
        });
      }
    })

    allCheckbox.addEventListener('change', function() {
      let checkboxes = document.querySelectorAll('.select-checkbox');
      if (allCheckbox.checked) {
        checkboxes.forEach(function(checkbox) {
          checkbox.checked = true;
        });
      } else {
        checkboxes.forEach(function(checkbox) {
          checkbox.checked = false;
        });
      }
    })
  }

function updateQuantity() {
    const productPriceQuantityDivs = document.querySelectorAll(".product-quantity-price-container");

    productPriceQuantityDivs.forEach(function(productQuantity) {
      const minus = productQuantity.querySelector('.minus_quantity');
      const plus = productQuantity.querySelector('.plus_quantity');
      const quantityElement = productQuantity.querySelector('.quantity');
      const originPriceElement = productQuantity.querySelector('.product-origin-price');
      const saledPriceElement = productQuantity.querySelector('.product-saled-price');
      const originPrice = originPriceElement.innerText.replace(/,/g, '');
      const saledPrice = saledPriceElement.innerText.replace(/,/g, '');

      minus.addEventListener("click", function() {

        let currentQuantity = parseInt(quantityElement.innerText);

        if(currentQuantity > 1) {
          quantity = currentQuantity -1;
          quantityElement.innerText = quantity;

          saledPriceElement.innerText = updateProductPrice(saledPrice, quantity);
          originPriceElement.innerText = updateProductPrice(originPrice, quantity);
          updateTotalPrice();
        };
      });

      plus.addEventListener("click", function() {
        let currentQuantity = parseInt(quantityElement.innerText);

        quantity = currentQuantity +1;
        quantityElement.innerText = quantity;

        saledPriceElement.innerText = updateProductPrice(saledPrice, quantity);
        originPriceElement.innerText = updateProductPrice(originPrice, quantity);
        updateTotalPrice();
      });

    })
  }

function updateTotalPrice() {
  updateTotalSaledPrice();
  updateTotalOriginPrice();
  updateTotalDiscountPrice();
}

function updateTotalSaledPrice() {
  const totalSaledPriceElement = document.querySelector("#cart-price-sum");
  const saledPriceElements = document.querySelectorAll(".product-saled-price");
  let totalSaledPrice = 0;
  saledPriceElements.forEach(function(saledPriceElement) {
    totalSaledPrice += parseInt(saledPriceElement.innerText.replace(/,/g, ''));
  })
  totalSaledPriceElement.innerText = totalSaledPrice.toLocaleString();

}

function updateTotalOriginPrice() {
  const totalOriginProductPriceElement = document.querySelector("#total-origin-price");
  const originProductPricesElements = document.querySelectorAll('.product-origin-price');
  let totalOriginProductPrice = 0;
  originProductPricesElements.forEach(function(originProductPricesElement) {
    totalOriginProductPrice += parseInt(originProductPricesElement.innerText.replace(/,/g, ''));
  })
  totalOriginProductPriceElement.innerText = totalOriginProductPrice.toLocaleString();
}

function updateProductPrice(saledPrice,quantity) {
  const result = (saledPrice*quantity).toLocaleString();
  return result;
}

function reallyDelete() {
  const optListForDelete = [];

  let checkedCheckboxes = document.querySelectorAll('.select-checkbox:checked');
  const result = confirm("정말로 삭제하시겠습니까?");

  if(result) {
    checkedCheckboxes.forEach(function(checkbox) {
      const productDiv = checkbox.closest('.product-in-cart');

      productDiv.querySelectorAll(".cart-pdopt-container").forEach(function(ev){
        optListForDelete.push(ev.querySelector(".cart-input-optNo").value);
      })

      productDiv.parentNode.removeChild(productDiv);
      
      updateTotalPrice();
    })
  }

  ajaxForDeleteCart(optListForDelete);

}

function changeAllCheckBox() {
  let checkboxes = document.querySelectorAll('.select-checkbox');
  let checkedCheckBoxes = document.querySelectorAll('.select-checkbox:checked');
  let allCheckbox = document.querySelector('#all-select-checkbox');

  if(checkboxes.length === checkedCheckBoxes.length ) {
    allCheckbox.checked = true;
  } else {
    allCheckbox.checked = false;
  }

}

function deleteProductOpt(element) {
  const productOptDiv = element.closest('.cart-pdopt-container');
  const cartDiv = productOptDiv.closest('.cart-product-info-container');

   // .cart-pdopt-container 내에서 .cart-input-optNo 요소를 찾음
   const optNo = productOptDiv.querySelector('.cart-input-optNo').value;

  // 선택한 옵션 삭제
  cartDiv.removeChild(productOptDiv);


  //ajax 로 db delete
  ajaxForDeleteCart([optNo]);


  // 더 이상 옵션이 남아있지 않을 경우 .product-in-cart 요소까지 삭제
   // cart-product-info-container가 비어 있는지 확인
   if (cartDiv.querySelectorAll('.cart-pdopt-container').length === 0) {
    // 상위 product-in-cart 요소 제거
    const productInCartDiv = cartDiv.closest('.product-in-cart');
    productInCartDiv.parentNode.removeChild(productInCartDiv);
  }

  updateTotalPrice();
}

function updateTotalDiscountPrice() {
  const totalDiscountPriceEl = document.querySelector("#total-discount-price");
  const totalSaledPrice = parseInt(document.querySelector("#cart-price-sum").innerText.replace(/,/g, ''));
  const totalOriginPrice = parseInt(document.querySelector("#total-origin-price").innerText.replace(/,/g, ''));

  const totalDiscountPrice = (totalOriginPrice - totalSaledPrice).toLocaleString();
  totalDiscountPriceEl.innerText = totalDiscountPrice;
}

// 장바구니 목록을 주문 페이지로 보내기 위한 ajax
function ajaxForBuy(data){
  $.ajax({
    url: "order.po",
    data: JSON.stringify(data),
    method: "post",
    contentType: "application/json",
    dataType: "text",
    success: function(res){
      console.log(res);
      window.location.href = res;
    },
    error: function(){
      console.log("송신 실패");
    }
  })
}


// 구매하기 버튼에 클릭 이벤트 체크된 장바구니 목록의 데이터를 JSON 형태로 취합하기 위한 메소드 
document.addEventListener("DOMContentLoaded", function(){
  document.querySelector("#buy_btn").addEventListener("click", function(){
  // 데이터를 모두 담을 배열 선언

  const selectedOpts = [];

  document.querySelectorAll(".product-in-cart").forEach(function(ev){
    // 체크 박스 체크될 경우만 데이터 취합
    if(!ev.querySelector(".select-checkbox").checked){
      // foreach 문에서는 return 을 사용하면 다음 반복으로 넘어감
      return;
    }
    // 상품 항목별 데이터 담을 배열
    

    // 상품 정보
    const selectedPno = ev.querySelector(".cart-input-productNo").value;
    const productSeller = ev.querySelector(".cart-input-seller").value;
    const productBrand = ev.querySelector(".cart-input-productBrand").value;
    const productName = ev.querySelector(".cart-product-name").innerHTML;
    const mainImg = ev.querySelector(".cart-input-mainImg").value;
    const shipmentType = ev.querySelector(".product-delivery-method").innerHTML;

    const selectProductInfo = {
      productNo: selectedPno,
      seller: productSeller,
      productBrand: productBrand,
      productName: productName,
      mainImg: mainImg,
      shipmentType: shipmentType
    };
    // 옵션별 정보
    ev.querySelectorAll(".cart-pdopt-container").forEach(function(opt){
      const selectedOptNo = opt.querySelector(".cart-input-optNo").value;
      const selectedOptName = opt.querySelector(".cart-productOpt-name").innerHTML;
      const selectedOptQnt = opt.querySelector("#quantity").innerHTML;
      const selectedOptPrice = opt.querySelector(".product-saled-price").innerHTML.replace(/,/g, "");
      
      selectedOpts.push({
        detailOptionNo: selectedOptNo,
        detailOptionName: selectedOptName,
        detailOptionQuantity: selectedOptQnt,
        detailOptionSaledPrice: selectedOptPrice,
        pdForOpt : selectProductInfo
      });

    });
  });

  ajaxForBuy(selectedOpts);

  });
})


