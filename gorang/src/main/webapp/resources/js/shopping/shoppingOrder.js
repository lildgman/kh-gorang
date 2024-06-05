window.onload = function () {

  calculateTotalProductPrice();
  calculateTotalPrice();
 
}

 document.addEventListener("DOMContentLoaded", function(){
  const loginUser = sessionStorage.getItem("loginUser");
  console.log(loginUser);
   // 구매하기 버튼 클릭 시 컨트롤러로 정보 보내는 ajax 함수 실행하기 위한 이벤트 핸들러
  document.querySelector("#buy_btn").addEventListener("click", function(){
    const data = getDataForAjax();
    AjaxForInsertOrder(data);
  })

  document.querySelector("#put-myInfo").addEventListener("clcik", function(){
    document.querySelector("#input-buyer-email").value =  loginUser.memberEmail;
    document.querySelector("#input-buyer-phone").value = loginUser.memberPhone;
  })

 })

// 상품 총 금액 계산
function calculateTotalProductPrice() {
  const orderContainerElements = document.querySelectorAll('.order-product-container');
  const totalProductPriceEl = document.querySelector('#total-product-price');
  let totalPrice = 0;
  orderContainerElements.forEach(function(orderContainerElement) {
    const productPrice = parseInt(orderContainerElement.querySelector('.order-product-saled-price').innerText.replace(/,/g, ''));
    totalPrice += productPrice;
  })
  totalProductPriceEl.innerText = totalPrice.toLocaleString();
}
// 결제해야 할 총 금액 계산
function calculateTotalPrice() {
  const totalProductPrice = parseInt(document.querySelector('#total-product-price').innerText.replace(/,/g, ''));
  const totalDeliveryCharge = parseInt(document.querySelector('#total-delivery-charge').innerText.replace(/,/g, ''));
  const totalPriceElements = document.querySelectorAll('.totalPrice');
  const totalPrice = totalProductPrice - totalDeliveryCharge;

  totalPriceElements.forEach(function(totalPriceElement) {
    totalPriceElement.innerText = totalPrice.toLocaleString();
  })

}
// 클릭한 결제수단 경계 색칠 및 카드 결제 클릭 시 동적 요소 생성 위한 메소드
function clickPayment(element, type) {

  const payments = document.querySelectorAll(".payment");

  payments.forEach(function(payment) {
    payment.classList.remove('selected');

    element.classList.add('selected');

    const selectCardArea = document.querySelector("#select-card-area");

    if(type === 'card') {
      selectCardArea.style.display = "flex";
      selectCardArea.classList.add('displayFlex');
    } else {
      selectCardArea.style.display = "none";

    }
  })

}
// 주소 검색 api
function searchAddress() {
  new daum.Postcode({
    oncomplete: function (data) {
      console.log(data);

      let zonecode = document.querySelector("#zonecode");
      let address = document.querySelector("#address");

      zonecode.innerHTML = data.zonecode;
      address.innerHTML = data.roadAddress;

    }
  }).open();
}
// 주문 데이터 보내기 위한 ajax
function AjaxForInsertOrder(data){
  $.ajax({
    url: "insertOrder.po",
    data: JSON.stringify(data),
    method: "POST",
    contentType: "application/json",
    success: function(){
      console.log("데이터 송신 성공");
    },
    error: function(){
      console.log("불러오기 실패");
    }
  });
}

// ajax 로 보내기 위한 데이터를 작성하기 위한 함수
function getDataForAjax(){
  // 구매자 및 배송지 정보
  const orderInfo = [];

  // 주문 상품 정보
  const orderOpts = [];
  document.querySelectorAll(".order-product-container").forEach(function(ev){
    // JSON
    orderOpts.push({
      optNo: ev.querySelector(".input-order-optNo").value,
      refProductNo: ev.querySelector(".input-pdopt-pno").value,
      optQuantity: ev.querySelector(".order-product-quantity").innerHTML
    });
  });

  orderInfo.push({
    buyerName: document.querySelector("#input-buyer-name").value,
    buyerEmail: document.querySelector("#input-buyer-email").value,
    buyerPhone: document.querySelector("#input-buyer-phone").value,
    deliveryAddressName: document.querySelector("#input-delivery-name").value,
    recipentName: document.querySelector("#input-delivery-recipient").value,
    recipientAddress: document.querySelector("#address").innerHTML + `&nbsp` + document.querySelector("#input-delivery-detailAddress").value,
    recipientPhone:  document.querySelector("#input-delivery-phone").value,
    requirements: document.querySelector("#requirement-select").options[document.querySelector("#requirement-select").selectedIndex].value,
    payment: document.querySelector(".payment.selected > div").innerHTML,
    totalPrice: document.querySelector(".totalPrice").innerHTML.replace(/,/g, "")
  });


  const orderData = {
    orderInfo: orderInfo,
    orderOpts: orderOpts
  };

  console.log(orderData);

  return orderData;
}