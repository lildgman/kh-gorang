function moveDetailPage(element) {
  const contentNo = element.getAttribute('data-no');
  const type = element.getAttribute('data-type');

  if(type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;
  } else if(type === 'recipe') {
    window.location.href = 'detail.re?rno=' + contentNo;
  } else if(type === 'board') {
    window.location.href = 'detail.bo?boardNo=' + contentNo;
  }
}