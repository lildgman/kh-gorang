function searchProductOption() {
  const checkbox = document.querySelector('.check-product:checked');

  if(!checkbox) {
    alert("상품을 선택해주세요");
  } else {
    const checkedProductTr = checkbox.closest('.option-tr');
    const productNo = parseInt(checkedProductTr.querySelector('.product-no').innerText);
    $.ajax({
      url: 'option.po',
      type: 'get',
      data: {
        productNo: productNo 
      },
      success: function(res) {
        console.log(res);
        const productOption = document.querySelector('.ds-none');
        productOption.style.display = "flex";
        productOption.classList.add('displayFlex');
      },
      error: function() {
        console.log("상품 옵션 조회 실패");
      }
    })
  }
  
}

// 
function searchProduct() {
  const tbody = $('.product-table tbody');
  const searchProductName = document.querySelector("#search-product-name-input").value;
  tbody.empty();
  $.ajax({
    url: 'search.po',
    type: 'get',
    data: {
      searchProductName: searchProductName
    },
    success: function(res) {
      const productList = res;
      drawProductInfo(productList, tbody);
      
    },
    error: function() {
      console.log("상품조회 ajax 실패")
    }
  })
}

function drawProductInfo(productList, tbody) {
  $('#search-result-count').text(productList.length);
  productList.forEach(product => {
    const newRow = $('<tr class="option-tr"></tr>');

    // 새로운 <td> 요소 생성하여 <tr>에 추가
    newRow.append('<td align="center" class="checkbox-container"><input type="checkbox" class="check-product" onclick="checkSelectedOneProduct(event)"></td>');
    newRow.append('<td align="center" class="product-no">' + product.productNo + '</td>');
    newRow.append('<td align="center" class="product-name">' + product.productName + '</td>');
    if (product.status === 'Y') {
      newRow.append('<td align="center">판매중</td>');
    } else {
      newRow.append('<td align="center">판매중지</td>');
    }
    newRow.append('<td align="center">' + product.salePrice.toLocaleString() + '</td>');
    newRow.append('<td align="center">' + product.normalPrice.toLocaleString() + '</td>');
    newRow.append('<td align="center">' + product.category + '</td>');

    tbody.append(newRow);
  });
}

function checkSelectedOneProduct(event) {
  const checkboxs = document.querySelectorAll('.check-product');
  for(let c of checkboxs){
    c.checked = false;
  }
  event.target.checked = true;
}
