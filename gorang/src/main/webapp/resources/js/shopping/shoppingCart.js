window.onload = function () {

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

  function deleteProduct() {
    let deleteBtns = document.querySelectorAll('.cart-product-delete');

    deleteBtns.forEach(function(deleteBtn) {
      deleteBtn
    })
  }
  checkAll();
}

function reallyDelete() {
  let checkedCheckboxes = document.querySelectorAll('.select-checkbox:checked');
  const result = confirm("정말로 삭제하시겠습니까?");

  if(result) {
    checkedCheckboxes.forEach(function(checkbox) {
      const productDiv = checkbox.closest('.product-in-cart');
      productDiv.parentNode.removeChild(productDiv);
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

function deleteProduct() {

}