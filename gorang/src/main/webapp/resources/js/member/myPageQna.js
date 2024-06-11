function moveDetailPage(element) {
  const productNo = element.getAttribute('data-no');
  window.location.href = 'detail.po?pno=' + productNo;
}