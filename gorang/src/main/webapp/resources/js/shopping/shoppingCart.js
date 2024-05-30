window.onload = function () {


  checkAll();

  updateQuantity();

  updateTotalPrice();

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
  let checkedCheckboxes = document.querySelectorAll('.select-checkbox:checked');
  const result = confirm("정말로 삭제하시겠습니까?");

  if(result) {
    checkedCheckboxes.forEach(function(checkbox) {
      const productDiv = checkbox.closest('.product-in-cart');
      productDiv.parentNode.removeChild(productDiv);
      updateTotalPrice();
    })
  }
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

function deleteProduct(element) {
  const productDiv = element.closest('.product-in-cart');
  const cartDiv = document.querySelector('#product-content-area');

  cartDiv.removeChild(productDiv);
  updateTotalPrice();
}

function updateTotalDiscountPrice() {
  const totalDiscountPriceEl = document.querySelector("#total-discount-price");
  const totalSaledPrice = parseInt(document.querySelector("#cart-price-sum").innerText.replace(/,/g, ''));
  const totalOriginPrice = parseInt(document.querySelector("#total-origin-price").innerText.replace(/,/g, ''));

  const totalDiscountPrice = (totalOriginPrice - totalSaledPrice).toLocaleString();
  totalDiscountPriceEl.innerText = totalDiscountPrice;
}



