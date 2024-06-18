
const ctx = getContextPath();

function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

function goRecipeList(){
  location.href = ctx + "/list.re";
}

function goShoppingList(){
  location.href = ctx + "/list.po";
}

function moveDetailPage(element) {
  const contentNo = element.getAttribute('data-no');
  const type = element.getAttribute('data-type');

  if(type === 'recipe') {
    window.location.href = 'detailForm.re?recipeNo=' + contentNo;
  } else if(type === 'product') {
    window.location.href = 'detail.po?pno=' + contentNo;

  }
}