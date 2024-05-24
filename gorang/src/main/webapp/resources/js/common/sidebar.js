
// 현재 페이지의 URL에서 쿼리 파라미터 'pno' 값을 추출하는 함수
function getParameterPno(){
    let query = window.location.search;
    let param = new URLSearchParams(query);
    let pno = param.get('pno');

    console.log(pno);
    return pno;
}

// 페이지 로드 시 실행되는 함수
window.onload = function() {
    console.log("사이드바");

    const ctx = getContextPath();

    function getContextPath() {
    return sessionStorage.getItem("contextpath");
    }
    // URL에서 pno 파라미터 값을 가져옴
    let itemId = getParameterPno();
    if (itemId) {
        // 최근 본 상품 목록 초기화
        initRecentlyWatchedList(itemId);
    }
};

// 최근 본 상품 목록을 초기화하는 함수
function initRecentlyWatchedList(itemId) {
    let maxCount = 5;
    // localStorage에서 최근 본 상품 목록을 가져옴
    let watched = localStorage.getItem("recentlyWatched");

    // 최근 본 상품이 없는 경우, 빈 배열로 초기화
    watched = watched ? JSON.parse(watched) : [];

    // 현재 페이지의 아이템 ID가 최근 본 상품 목록에 이미 있는지 확인
    let index = watched.indexOf(itemId);

    // 최근 본 상품 목록에서 현재 페이지의 아이템 ID가 발견되지 않았을 경우에만 추가
    if (index === -1) {
        // 최근 본 상품 목록에 아이템 ID 추가
        watched.push(itemId);

        // 최근 본 상품 목록이 최대 아이템 갯수보다 큰 경우, 가장 오래된 아이템 삭제
        if (watched.length > maxCount) {
            watched.shift(); // 배열의 첫 번째 요소 제거
        }

        // 최근 본 상품 목록을 localStorage에 다시 저장
        localStorage.setItem("recentlyWatched", JSON.stringify(watched));
    }

    // 디버깅을 위해 콘솔에 최근 본 상품 목록 출력
    console.log("최근 본 상품 목록:", watched);

    // 최근 본 상품 목록을 화면에 표시
    displayRecentlyWatchedItems(watched);
}

// 최근 본 상품 목록을 화면에 표시하는 함수
function displayRecentlyWatchedItems(items) {
    let recentlySeenList = document.getElementById('recently-seen-list');
    recentlySeenList.innerHTML = ''; // 기존 내용을 비움

    items.forEach(item => {
        // 실제 상품 이미지와 링크를 가져오는 로직으로 대체해야 합니다
        // 예: item을 기반으로 AJAX 요청을 통해 상품 정보를 가져옴
        let listItem = document.createElement('li');
        let itemImg = document.createElement('img');
        itemImg.src = ctx + "/resources/dummyImg/shopping" + item.id + ".png"; // 실제 이미지 경로로 대체
        // 이미지 어떻게 저장?
        itemImg.alt = "최근 본 상품 이미지"; // 실제 alt 텍스트로 대체

        itemImg.style = "cursor:pointer;"

        itemImg.onclick = function(){
            location.href = ctx + "store/product?pno=" + item.id;
        }

        listItem.appendChild(itemImg);
        recentlySeenList.appendChild(listItem);
    });
}
