window.onload = function () {

  calculateTotalProductPrice();
  calculateTotalPrice();
  
  document.querySelector("#buy_btn").addEventListener("click", function(){
    const data = getDataForAjax();
    AjaxForInsertOrder(data);
  })
}

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

function calculateTotalPrice() {
  const totalProductPrice = parseInt(document.querySelector('#total-product-price').innerText.replace(/,/g, ''));
  const totalDeliveryCharge = parseInt(document.querySelector('#total-delivery-charge').innerText.replace(/,/g, ''));
  const totalPriceElements = document.querySelectorAll('.totalPrice');
  const totalPrice = totalProductPrice - totalDeliveryCharge;

  totalPriceElements.forEach(function(totalPriceElement) {
    totalPriceElement.innerText = totalPrice.toLocaleString();
  })

}

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
  // 구매자 정보
  // 이메일 셀렉트 요소
  const buyerEmailAddress = document.querySelector("#email-select");
  // 구매자명
  const buyerName = document.querySelector("#input-buyer-name").value;
  // 구매자 이메일 주소
  const buyerEmail = document.querySelector("#input-buyer-email").value + 
                    document.querySelector("#email-container > span").innerHTML + 
                    buyerEmailAddress.options[buyerEmailAddress.selectedIndex].value;
  // 구매자 전화번호
  const buyerPhone = document.querySelector("#input-buyer-phone").value;

  // 배송지 정보
  // 배송지명
  const deliveryAddressName = document.querySelector("#input-delivery-name").value;
  // 수령인
  const recipent = document.querySelector("#input-delivery-recipient").value;
  // 수령인 전화번호
  const recipientPhone = document.querySelector("#input-delivery-phone").value;
  // 배송지 주소
  const recipientAddress = document.querySelector("#address").innerHTML + `&nbsp` + document.querySelector("#input-delivery-detailAddress").value;
  // 요청사항
  const buyerRequirement = document.querySelector("#requirement-select").options[document.querySelector("#requirement-select").selectedIndex].value;
  // 결제 수단
  const payment = document.querySelector(".payment.selected > div").innerHTML;
  // 총 결제 금액
  const totalPrice = document.querySelector(".totalPrice").innerHTML.replace(/,/g, "");

  // 주문 상품 정보
  const orderOpts = [];
  document.querySelectorAll(".order-product-container").forEach(function(ev){
    // 상품정보
    const optNo = ev.querySelector(".input-order-optNo").value;
    const optQuantity = ev.querySelector(".order-product-quantity").innerHTML;
    // JSON
    orderOpts.push({
      optNo: optNo,
      optQuantity: optQuantity
    });
  });

  orderInfo.push({
    name: buyerName,
    email: buyerEmail,
    phone: buyerPhone,
    deliveryAddress: deliveryAddressName,
    recipient: recipent,
    recipientAddress: recipientAddress,
    recipientPhone: recipientPhone,
    buyerRequirement: buyerRequirement,
    payment: payment,
    totalPrice: totalPrice,
  });


  const orderData = {
    orderInfo: orderInfo,
    orderOpts: orderOpts
  };

  console.log(orderData);

  return orderData;
}