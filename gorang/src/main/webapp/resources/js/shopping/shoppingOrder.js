window.onload = function () {


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