function searchToCategory(element) {
  const category= element.getAttribute('data-category');
  window.location.href = 'list.re?category=' + category;
}

function sortRecipe(element) {
  const sort = element.getAttribute('data-sort');
  window.location.href = 'list.re?sort=' + sort;
}