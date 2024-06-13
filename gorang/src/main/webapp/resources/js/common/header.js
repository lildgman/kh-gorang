function requireLogin() {
    const userConfirmed = confirm("로그인이 필요한 기능입니다. 로그인창으로 이동하시겠습니까?");
    if (userConfirmed) {
        moveLocation('/gorang/loginForm.me');
    } else {
        moveLocation('/gorang');
    }
}


// 페이지 이동 함수
function moveLocation(path){
    window.location.href =(path)
}

// function logo(){
//     window.location.href =('/gorang')
// }
// //레시피 클릭시 레시피 메인 페이지 이동
// function recipeMain(){
//     window.location.href =('/main.re')
// }
// //게시판 클릭시 게시판 메인 페이지 이동
// function boardMain(){
//     window.location.href =('main.bo')
// }
// //쇼핑 클릭시 쇼핑 메인 페이지 이동
// function shoppingMain(){
//     window.location.href =('store')
// }
// //회원가입 클릭시 회원가입 페이지 이동
// function register(){
//     window.location.href=('Register.me')
// }
// //로그인 클릭시 로그인 페이지 이동
// function login  (){
//     window.location.href=('Login.me')
// }

document.addEventListener("DOMContentLoaded", function() {

    let searchInput = document.querySelector('#search-input');
    searchInput.addEventListener("keypress", function(event) {
        if(event.key === 'Enter') {
            event.preventDefault();
            search(searchInput.value);
        }
    });
});

function search(value) {
    // alert(value);
    if(value=== "") {
        return;
    }

    window.location.href = "search.re?content=" + value;
}

function searchResult() {
    let searchInput = document.querySelector('#search-input');
    search(searchInput.value);
}