function searchProductOption() {
  const productOption = document.querySelector('.ds-none');
  productOption.style.display = "flex";
  productOption.classList.add('displayFlex');
}


function searchProduct() {
  const searchProductName = document.querySelector("#search-product-name-input").value;

  $.ajax({
    url: 'search.po',
    type: 'get',
    data: searchProductName,
    success: function(res) {
      console.log(res)
    },
    error: function() {
      console.log("상품조회 ajax 실패")
    }

  })
}