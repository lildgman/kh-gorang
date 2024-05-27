
// 현재 페이지의 URL에서 쿼리 파라미터 'pno' 값을 추출하는 함수
function getParameterRno(){
    let query = window.location.search;
    let param = new URLSearchParams(query);
    let rno = param.get('rno');

    console.log(rno);
    return rno;
}

// 페이지 로드 시 실행되는 함수
window.onload = function() {
    console.log("사이드바");

    const ctx = getContextPath();

    function getContextPath() {
    return sessionStorage.getItem("contextpath");
    }
    // URL에서 pno 파라미터 값을 가져옴
    let itemId = getParameterRno();

    // detail 페이지 이외의 페이지일 경우 itemId가 없기 때문에 이를 위한 예외처리 실시
    if (itemId === null){
        // localStorage에서 최근 본 상품 목록을 가져옴
        let watched = localStorage.getItem("recentlyWatched");

        // 최근 본 상품이 없는 경우, 빈 배열로 초기화
        watched = watched ? JSON.parse(watched) : [];

        // 디버깅을 위해 콘솔에 최근 본 상품 목록 출력
        console.log("최근 본 상품 목록:", watched);

        // 최근 본 상품 목록을 화면에 표시
        displayRecentlyWatchedItems(watched, ctx);
    } else {
        // 최근 본 상품 목록 초기화
        initRecentlyWatchedList(itemId, ctx);
    }
        
    $(function(){
        $('#recently-seen-list').slick({
            vertical : true, // 세로 방향 슬라이드 옵션
            slidesToShow : 3,		// 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
            verticalSwiping : true,
            prevArrow: $('.slick-prev'),
            nextArrow: $('.slick-next'),
        });
      })
};

// 최근 본 상품 목록을 초기화하는 함수
function initRecentlyWatchedList(itemId, ctx) {
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
    displayRecentlyWatchedItems(watched, ctx);
}

// 최근 본 상품 목록을 화면에 표시하는 함수
function displayRecentlyWatchedItems(items, ctx) {
    console.log(items);

    let recentlySeenList = document.getElementById('recently-seen-list');
    recentlySeenList.innerHTML = ''; // 기존 내용을 비움

     // 최근 본 상품 목록이 비어 있는 경우
     if (items.length === 0) {
        let sidebar = document.getElementById('sidebar');
        sidebar.innerHTML = ''; // sidebar의 내용을 비움
        return; // 함수 종료
    }

    items.forEach(item => {
        console.log(item)
        // 실제 상품 이미지와 링크를 가져오는 로직으로 대체해야 합니다
        // 예: item을 기반으로 AJAX 요청을 통해 상품 정보를 가져옴
        let listItem = document.createElement('div');
        let itemImg = document.createElement('img');
        itemImg.src = ctx + "/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail" + item + ".png"; // 실제 이미지 경로로 대체
        // 이미지 어떻게 저장?
        console.log(itemImg.src);

        itemImg.style.cursor = "pointer;"

        itemImg.onclick = function(){
            location.href = ctx + "/detail.re?rno=" + item;
        }

        listItem.appendChild(itemImg);
        recentlySeenList.appendChild(listItem);
    });
}
