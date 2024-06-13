/**
 * 
 * @param {*} element 
 */

function moveDetailPage(element) {
  const type = element.getAttribute('data-type');
  const contentNo = element.getAttribute('data-no');

  if(type === 'recipe') {
    window.location.href = 'detail.re?recipeNo=' + contentNo;
  } else if (type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;

  } else if (type === 'board') {
    window.location.href = 'detail.bo?boardNo=' + contentNo;

  }
}