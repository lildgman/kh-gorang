
const ctx = getContextPath();

function getContextPath() {
return sessionStorage.getItem("contextpath");
}

function goRecipeList(){
location.href = ctx + "/list.re";
}

function goShoppingList(){
location.href = ctx + "/store/list";
}
