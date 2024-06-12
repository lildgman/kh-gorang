function moveDetailPage(element) {
  const type = element.getAttribute('data-type');
  const contentNo = element.getAttribute('data-no');

  if(type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;
  } else if (type === 'recipe') {
    window.location.href = 'detail.re?recipeNo=' + contentNo;
  }
}