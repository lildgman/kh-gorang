window.onload = function () {

  calculateTotalProductPrice();
  calculateTotalPrice();
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