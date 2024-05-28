window.onload = function () {

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

  fileInputClick();
  displaySelectedImage();

  $('.summernote').summernote({
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

    ]
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
                            <input type="checkbox" name="" id="">
                        </td>
                        <td align="center">
                            <input type="text" id="">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="개">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원">
                        </td>
                        <td align="center">
                            <input type="number" class="txt-align-right" placeholder="원">
                        </td>
                      </tr>`;
  optionTableTbody.appendChild(newRow);
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
  if(!isNaN(originPrice) && !isNaN(saledPrice)) {
    const discountPercent = (originPrice - saledPrice)/originPrice * 100;
    discountPercentEl.value = discountPercent;
  }
}

function enrollProduct() {
  const category = document.querySelector("#search-category-input").value;
  const productName = document.querySelector("#search-product-name-input").value;
  const productBrand = document.querySelector("#search-brand-input").value;
  const normalPrice = document.querySelector("#origin-price").value;
  const salePrice = document.querySelector("#saled-price").value;
  const discountPercent = document.querySelector("#discount-percent").value;
  const detailOptionName = document.querySelector("#detailOptionName").value;
  const detailOptionQuantity = document.querySelector("#detailOptionQuantity").value;
  const detailOptionOriginPrice = document.querySelector("#detailOptionOriginPrice").value;
  const detailOptionSaledPrice = document.querySelector("#detailOptionSaledPrice").value;





  console.log("category = "+category);
  console.log("productName = "+productName);
  console.log("productBrand = "+productBrand);
  console.log("normalPrice = "+normalPrice);
  console.log("salePrice = "+salePrice);
  console.log("discountPercent = "+discountPercent);
  console.log("detailOptionName = "+detailOptionName);
  console.log("detailOptionQuantity = "+detailOptionQuantity);
  console.log("detailOptionOriginPrice = "+detailOptionOriginPrice);
  console.log("detailOptionSaledPrice = "+detailOptionSaledPrice);
}

