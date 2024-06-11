window.onload = function() {
  // 상품 카테고리 눌렀을 때 각 카테고리에 맞게 상품리스트로 이동하는 function
  function moveClickedCategoryList() {
    const categoryList = {
      "category-all" : "all",
      "category-veget" : "야채",
      "category-fruit" : "과일",
      "category-fish" : "어류",
      "category-meat" : "육류",
      "category-bread" : "빵",
      "category-noodle" : "면",
      "category-dairy" : "유제품"
    }

    let storeCategories = document.querySelectorAll(".store-category");
    
    storeCategories.forEach(function(category) {
      category.addEventListener("click", function() {
        let categoryId = category.id;
        let categoryName = categoryList[categoryId];
        
        window.location.href = "list.po?category=" + categoryName;
      })
    })
  }

  moveClickedCategoryList();
  priceFormat();
}

function orderProductList(method) {
  window.location.href = method;
}

function priceFormat() {
  const itemOriginPriceElements = document.querySelectorAll('.item-origin-price');
  const discountedPriceElements = document.querySelectorAll(".discounted-price");

  itemOriginPriceElements.forEach(function(itemOriginPriceElement) {
    const itemOriginPrice = parseInt(itemOriginPriceElement.innerText);
    itemOriginPriceElement.innerText = itemOriginPrice.toLocaleString()+"원"; 
  })

  discountedPriceElements.forEach(function(discountedPriceElement) {
    const discountedPrice = parseInt(discountedPriceElement.innerText);
    discountedPriceElement.innerText = discountedPrice.toLocaleString()+"원"; 
  })
}