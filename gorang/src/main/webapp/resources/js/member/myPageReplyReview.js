function moveBoardDetail(element) {
  
}

function moveDetailProduct(element) {
  
}

function moveDetailPage(element) {
  const type = element.getAttribute('data-type');

  if(type === 'board-comment') {
    const boardNo = element.getAttribute('data-boardNo');
    window.location.href = "detail.bo?boardNo=" + boardNo;
  } else if (type === 'product-review') {
    const productNo = element.getAttribute('data-productNo');
    window.location.href = "detail.po?pno=" + productNo;
  } else if (type === 'recipe-review') {
    const recipeNo = element.getAttribute('data-recipeNo');
    window.location.href = "detailForm.re?recipeNo=" + recipeNo;
  }
}