// 상품 옵션 찾아주는 함수
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

// 찾은 옵션들을 토대로 table을 그려주는 함수
function drawProductOptions(optionList, optionTbody) {
  optionList.forEach(option => {

    const newRow = $('<tr class="product-option-tr"></tr>');

    newRow.append('<input type="hidden" class="detail-option-no" value="' + option.detailOptionNo + '">');
    if(option.mainDetailOption) {
      newRow.append('<td align="center"><input type="checkbox" class="main-option-checkbox" onclick="checkSelectedOneMainOption(event)" checked></td>');
    } else {
      newRow.append('<td align="center"><input type="checkbox" class="main-option-checkbox" onclick="checkSelectedOneMainOption(event)" ></td>');
    }
    newRow.append('<td align="center"><input type="text" class="detail-option-name" value="' + option.detailOptionName + '"></td>');
    newRow.append('<td align="center"><input type="number" class="txt-align-right detail-option-quantity" placeholder="개" value="' + option.detailOptionQuantity + '"></td>');
    newRow.append('<td align="center"><input type="number" class="txt-align-right detail-option-origin-price" placeholder="원" value="' + option.detailOptionOriginPrice + '"></td>');
    newRow.append('<td align="center"><input type="number" class="txt-align-right detail-option-sale-price" placeholder="원" value="' + option.detailOptionSaledPrice + '"></td>');
    
    optionTbody.append(newRow[0]);
  });
}

// 숨겨져있던 옵션 보여주는 부문 보여주는 함수
function displayProductOptions() {
  const productOption = document.querySelector('.ds-none');
  productOption.style.display = "flex";
  productOption.classList.add('displayFlex');
}

// 상품조회 함수
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

// 조회된 상품을 토대로 table 그려주는 함수
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

// 상품 하나만 체크되도록 해주는 함수
function checkSelectedOneProduct(event) {
  const checkboxs = document.querySelectorAll('.check-product');
  for(let c of checkboxs){
    c.checked = false;
  }
  event.target.checked = true;
}

// 대표옵션 하나만 체크되도록 하는 함수
function checkSelectedOneMainOption(event) {
  const checkboxs = document.querySelectorAll('.main-option-checkbox');
  for(let c of checkboxs){
    c.checked = false;
  }
  event.target.checked = true;
}

// 상품 상태 변경하는 함수
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
            alert("상품 상태 변경을 실패하였습니다. 다시 진행해주세요.");
          }
        },
        error: function() {
          console.log('상품상태 업데이트 api 요청 실패');
        }
      })
    }
  }
}

// 상품 옵션을 변경해주는 함수
function updateProductOption() {

  let productDetailOptions = getProductOptions();

  const result = confirm("상품 옵션을 변경하시겠습니까?")

  if(result) {
    $.ajax({
      url: 'update-option.po',
      type: 'post',
      contentType: 'application/json',
      data: JSON.stringify(productDetailOptions),
      success: function(res) {
        if(res === 'done') {
          alert("상품 옵션 변경이 완료되었습니다.")
          window.location.href = window.location.href; 
        } else {
          alert("상품 옵션 변경을 실패하였습니다. 다시 진행해주세요.");
        }
      },
      error: function() {
        console.log("상품 옵션 업데이트 api 요청 실패");
      }
    })
  }
}

// 상품 옵션 배열을 반환하는 함수
function getProductOptions() {
  let productDetailOptions = [];

  const optionTrs = document.querySelectorAll('.product-option-tr');

  optionTrs.forEach(optionTr => {
    const mainOption = optionTr.querySelector('.main-option-checkbox').checked;
    const optionNo = optionTr.querySelector('.detail-option-no').value;
    const optionName = optionTr.querySelector('.detail-option-name').value;
    const optionQuantity = optionTr.querySelector('.detail-option-quantity').value;
    const optionOriginPrice = optionTr.querySelector('.detail-option-origin-price').value;
    const optionSalePrice = optionTr.querySelector('.detail-option-sale-price').value;

    let productDetailOption = {
      mainDetailOption : mainOption,
      detailOptionNo: optionNo,
      detailOptionName: optionName,
      detailOptionQuantity: optionQuantity,
      detailOptionOriginPrice: optionOriginPrice,
      detailOptionSaledPrice: optionSalePrice
    };
    productDetailOptions.push(productDetailOption);
  });

  return productDetailOptions;
}
