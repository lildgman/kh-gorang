function moveDetailPage(element) {
  const contentNo = element.getAttribute('data-no');
  const type = element.getAttribute('data-type');

  if(type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;
  } else if(type === 'recipe') {
    window.location.href = 'detail.re?recipeNo=' + contentNo;
  } else if(type === 'board') {
    window.location.href = 'detail.bo?boardNo=' + contentNo;
  }
}



document.addEventListener('DOMContentLoaded', function() {
  const originPriceDivs = document.querySelectorAll('.item-origin-price');
  const salePriceDivs = document.querySelectorAll('.discounted-price');

  originPriceDivs.forEach(function(originPriceDiv) {
    const originPrice = parseInt(originPriceDiv.innerText).toLocaleString();
    originPriceDiv.innerText = originPrice;
    
  })

  salePriceDivs.forEach(function(salePriceDiv){
    const salePrice = parseInt(salePriceDiv.innerText).toLocaleString();
    salePriceDiv.innerText = salePrice;
  }) 

  

})