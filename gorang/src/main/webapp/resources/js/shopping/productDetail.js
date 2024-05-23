window.onload = function() {

  function clickZzim() {

    let zzimStatus = false;

    const zzim = document.querySelector("#zzim");
    zzim.addEventListener("click",function() {

      if(!zzimStatus) {
        zzim.innerHTML = `<i class="fa-solid fa-heart fa-xl" style="color: #ff0000;"></i>`;
        zzimStatus = true;
      } else {
        zzim.innerHTML = `<i class="fa-regular fa-heart fa-xl"></i>`;
        zzimStatus = false;
      }
    })
  }

  function minusProductQuantity() {
    let minusDivs = document.querySelectorAll(".minus_quantity");
    let productQuantityDivs = document.querySelectorAll(".quantity");

    
    minusDivs.forEach(function(minusDiv) {

      minusDiv.addEventListener("click", function() {

        productQuantityDivs.forEach(function(productQuantityDiv) {

          let intProductQuantity = parseInt(productQuantityDiv.innerText);
          
          if(intProductQuantity > 1) {
            productQuantityDiv.innerHTML = intProductQuantity-1;
          }
        })
      })
    })
  }

  function plusProductQuantity() {
    let plusDivs = document.querySelectorAll(".plus_quantity");
    let productQuantityDivs = document.querySelectorAll(".quantity");

    plusDivs.forEach(function(plusDiv){
      plusDiv.addEventListener("click", function() {
        productQuantityDivs.forEach(function(productQuantityDiv) {
          
          let productQuantity = parseInt(productQuantityDiv.innerText);
          productQuantityDiv.innerHTML = productQuantity+1;

        })
      })
    })

  }

  function addProductToCart() {
    const addProductToCartBtns = document.querySelectorAll(".btn_cart");

    addProductToCartBtns.forEach(function(addProductToCartBtn) {

      addProductToCartBtn.addEventListener("click", function() {

        alert("장바구니에 추가되었습니다.");
      })
    })
  }

  clickZzim();
  minusProductQuantity();
  plusProductQuantity();
  addProductToCart()
}

function scrollToDiv(div) {
  const divOffsetTop = document.querySelector(div).offsetTop;
  console.log(divOffsetTop);

  window.scrollTo(0,divOffsetTop-220);
}