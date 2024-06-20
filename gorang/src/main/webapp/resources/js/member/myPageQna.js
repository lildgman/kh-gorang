function moveDetailPage(element) {
  const type = element.getAttribute('data-type');
  const contentNo = element.getAttribute('data-no');

  if(type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;
  } else if (type === 'recipe') {
    window.location.href = 'detailForm.re?recipeNo=' + contentNo;
  }
}

function deleteProductQna() {
  const checkedQnaNoList = getCheckedProductQnaNo();
  console.log(checkedQnaNoList);
  ajaxDeleteQna(checkedQnaNoList);
}


function getCheckedProductQnaNo() {
  const checkedQnaNos = [];
  const productQnaCheckBoxes = document.querySelectorAll('.product-qna-checkbox:checked');

  productQnaCheckBoxes.forEach(function (qnaCheckBox) {
    checkedQnaNos.push(parseInt(qnaCheckBox.getAttribute('data-qnaNo')));
  });

  return checkedQnaNos;
}


function deleteRecipeQna() {
  const checkedQnaNoList = getCheckedRecipeQnaNos();
  ajaxDeleteQna(checkedQnaNoList);
}

function getCheckedRecipeQnaNos() {
  const checkedQnaNos = [];
  const recipeQnaCheckBoxes = document.querySelectorAll('.recipe-qna-checkbox:checked');

  recipeQnaCheckBoxes.forEach(function(qnaCheckBox) {
    checkedQnaNos.push(parseInt(qnaCheckBox.getAttribute('data-qnaNo')));

  })

  return checkedQnaNos;

}


function ajaxDeleteQna(checkedQnaNoList) {
  $.ajax({
    url: 'delete-qna.me',
    type: 'post',
    contentType: 'application/json',
    data: JSON.stringify(checkedQnaNoList),
    success: function (res) {
      if (res === "done") {
        alert("문의 삭제 완료");
      } else {
        alert("문의 삭제 실패");
      }

      window.location.reload();
    },
    error: function () {
      console.log("문의 삭제 api 호출 실패");
    }
  });
}