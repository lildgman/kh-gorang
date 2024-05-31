let optionNo = 0;

window.onload = function () {

  $('#summernote').summernote({
    width: 1000,
    height: 329,
    lang: "ko-KR",
    toolbar: [
      ['insert', ['link', 'picture']],
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']],
    ],
    callbacks: {
      onImageUpload: uploadFiles
    }
  });

  fileInputClick();
  displaySelectedImage();
}

function fileInputClick() {
  const imgContainer = document.getElementById('input-img-container');
  const fileInput = document.getElementById('file-input');

  imgContainer.addEventListener('click', () => {
    fileInput.click();
  });
}

function displaySelectedImage() {
  const fileInput = document.getElementById('file-input');
  const mainImgContainer = document.getElementById('main-img-container');

  fileInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        mainImgContainer.innerHTML = `<img id="main-img" src="${e.target.result}" alt="Selected Image">`;
      };
      reader.readAsDataURL(file);
    }
  });
}

function addOption() {
  const optionTableTbody = document.querySelector('#option-table-tbody');

  let newRow = document.createElement('tr');
  newRow.className = 'option-tr';
  newRow.innerHTML = `<tr class="option-tr">
                        <td align="center">
                            <input type="checkbox" name="" id="" class="deleteTrCheckBox">
                          </td>
                          <td align="center">
                            <input type="checkbox" name="main-option" id="">
                          </td>
                          <td align="center">
                            <input type="text" id="detailOptionName" name="options[${optionNo}].detailOptionName" required>
                          </td>
                          <td align="center">
                            <input type="number" class="txt-align-right" placeholder="개"
                                id="detailOptionQuantity" name="options[${optionNo}].detailOptionQuantity" required>
                          </td>
                          <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원"
                                id="detailOptionOriginPrice" name="options[${optionNo}].detailOptionOriginPrice" required>
                          </td>
                          <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원"
                                id="detailOptionSaledPrice" name="options[${optionNo}].detailOptionSaledPrice" required>
                          </td>
                      </tr>`;
  optionTableTbody.appendChild(newRow);
  optionNo++;
}

function deleteSelectedOption() {
  let checkedCheckBoxes = document.querySelectorAll('.deleteTrCheckBox:checked');
  let optionTrs = document.querySelectorAll(".option-tr");

  if (optionTrs.length <= 1) {
    alert("옵션은 1개 이상이어야 합니다.");
  } else {
    checkedCheckBoxes.forEach(function (checkCheckBox) {
      checkCheckBox.closest('tr').remove();
    })
  }
}

function calculateDiscountPercent() {
  const originPrice = parseInt(document.querySelector('#origin-price').value);
  const saledPrice = parseInt(document.querySelector('#saled-price').value);
  let discountPercentEl = document.querySelector('#discount-percent');
  if (!isNaN(originPrice) && !isNaN(saledPrice)) {
    const discountPercent = parseInt((originPrice - saledPrice) / originPrice * 100);
    discountPercentEl.value = discountPercent;
  }
}

function uploadFiles(fileList) {
  const formData = new FormData();

  for (let file of fileList) {
    formData.append("fileList", file);
  }

  insertFileApi(formData, function (nameList) {
    for (let name of nameList) {
      $("#summernote").summernote('insertImage', "/gorang/resources/uploadfile" + name);
    }
  });
}

function insertFileApi(data, callback) {
  $.ajax({
    url: "detaildesc",
    type: "POST",
    data: data,
    processData: false,
    contentType: false,
    dataType: "json",
    success: function (changeNameList) {
      callback(changeNameList);
    },
    error: function () {
      console.log("파일업로드 api 요청 실패");
    }
  })
}

function enrollProduct() {
  const category = document.querySelector('#search-category-input').value
  const productName = document.querySelector('#search-product-name-input').value
  const productBrand = document.querySelector('#search-brand-input').value
  const normalPrice = document.querySelector('#origin-price').value
  const salePrice = document.querySelector('#saled-price').value
  const discountPercent = document.querySelector('#discount-percent').value

  const detailOption = addProductDetailOptions();

  const fileInput = document.querySelector('#file-input');
  const fileData = fileInput.files[0];

  console.log(fileInput.files[0]);

  let productInfo = {};
}

function addProductDetailOptions() {
  let productDetailOptions = [];

  // 상품 옵션을 배열에 담는 함수
  const optionTrElements = document.querySelectorAll('.option-tr');
  optionTrElements.forEach(function (optionTrElement) {
    const detailOptionName = optionTrElement.querySelector("#detailOptionName").value;
    const detailOptionQuantity = optionTrElement.querySelector("#detailOptionQuantity").value;
    const detailOptionOriginPrice = optionTrElement.querySelector("#detailOptionOriginPrice").value;
    const detailOptionSaledPrice = optionTrElement.querySelector("#detailOptionSaledPrice").value;

    let productDetailOption = {
      detailOptionName: detailOptionName,
      detailOptionQuantity: detailOptionQuantity,
      detailOptionOriginPrice: detailOptionOriginPrice,
      detailOptionSaledPrice: detailOptionSaledPrice
    };

    productDetailOptions.push(productDetailOption);
  });

  return productDetailOptions;

}

