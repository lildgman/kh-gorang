window.onload = function() {
  
  // 상품 카테고리 눌렀을 때 각 카테고리에 맞게 상품리스트로 이동하는 function
  function moveClickedCategoryList() {
    const categoryList = {
      "category-veget" : "veget",
      "category-fruit" : "fruit",
      "category-fish" : "fish",
      "category-meat" : "meat",
      "category-bread" : "bread",
      "category-noodle" : "noodle",
      "category-dairy" : "dairy"
    }

    let storeCategories = document.querySelectorAll(".store-category");
    
    storeCategories.forEach(function(category) {
      category.addEventListener("click", function() {
        let categoryId = category.id;
        let url = categoryList[categoryId];
        
        window.location.href = "store/list?category=" + url;
      })
    })
  }



  moveClickedCategoryList();
}