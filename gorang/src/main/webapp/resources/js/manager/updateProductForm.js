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
        const optionList = res;
        const optionTbody = document.querySelector('#product-option-tbody');
        optionTbody.innerHTML="";
        
        displayProductOptions();
        drawProductOptions(optionList, optionTbody);
      
      },
      error: function() {
        console.log("상품 옵션 조회 실패");
      }
    })
  }
}

function drawProductOptions(optionList, optionTbody) {
  optionList.forEach(option => {
    const newRow = `
                    <tr class="product-option-tr">
                        <td align="center">
                            <input type="text" value="` + option.detailOptionName + `">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="개" value="` + option.detailOptionQuantity + `">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원" value="` + option.detailOptionOriginPrice + `">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원" value="` + option.detailOptionSaledPrice + `">
                        </td>
                    </tr>`;
    optionTbody.innerHTML += newRow;
  });
}

function displayProductOptions() {
  const productOption = document.querySelector('.ds-none');
  productOption.style.display = "flex";
  productOption.classList.add('displayFlex');
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

function updateProductStatus() {
  const checkbox = document.querySelector('.check-product:checked');

  if(!checkbox) {
    alert("상품을 선택해주세요");
  } else {
    const checkedProductTr = checkbox.closest('.option-tr');
    const productNo = parseInt(checkedProductTr.querySelector('.product-no').innerText);

    const result = confirm("정말로 상품 상태를 변경하시겠습니까?");

    if(result) {
      $.ajax({
        url: 'update-status.po',
        type: 'post',
        data: {
          productNo: productNo
        },
        success: function(res) {
          if(res === 'done') {
            alert("상품 상태 변경이 성공하였습니다.");
            window.location.href = window.location.href; 
          } else {
            alert("상품 상태 변경을 실패하였습니다. 다시 진행해주세요.")
          }
        },
        error: function() {
          console.log('판매중지 api 요청 실패');
        }
      })
    }
  }
}