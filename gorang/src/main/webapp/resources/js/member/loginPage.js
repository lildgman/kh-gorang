
window.onload = function(){
    //네이버로그인설정
    const naverLoginBtn = document.getElementById('naver-login');
    naverLoginBtn.addEventListener("click", function(ev){
        console.log("Test");
        naverLogin(ev);
    })
    
   
}

function naverLogin(ev){
    const naverClientId = "6D1ucwJgv10DLouX8avE";
    //리다이렉트 URI를 utf-8로 인코딩해서 저장
    const naverRedirectURI = encodeURIComponent("http://localhost:8111/gorang/naver-login");

    const naverState = Math.random().toString(36).substring(2);
    
    //로그인 api url
    const apiURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&'
        + 'client_id=' + naverClientId + "&redirect_uri=" + naverRedirectURI + '&state=' + naverState;

    location.href= apiURL;
}