// 현재 페이지의 유형을 확인하는 함수
function getPageType() {
    const pathname = window.location.pathname;
    if (pathname.includes('.re')) {
        return 'recipe';
    } else if (pathname.includes('.po')) {
        return 'product';
    }
    return null;
}

// 페이지 유형에 따라 사이드바 제목을 설정하는 함수
function setSidebarTitle(pageType) {
    if (pageType === 'recipe') {
        document.querySelector("#recently-seen-container > span").innerHTML = "최근 본 레시피";
    } else if (pageType === 'product') {
        document.querySelector("#recently-seen-container > span").innerHTML = "최근 본 상품";
    }
}

// 페이지 로드 시 실행되는 함수
window.onload = function() {
    console.log("사이드바");

    const ctx = getContextPath();

    function getContextPath() {
        return sessionStorage.getItem("contextpath");
    }

    // 페이지 유형 확인
    const pageType = getPageType();
    if (!pageType) {
        console.log("페이지 유형을 알 수 없습니다.");
        return;
    }

    // 사이드바 제목 설정
    setSidebarTitle(pageType);

    // 상품 또는 레시피의 id값 가져오기
    let { num: itemId, isRecipe } = getParameter(pageType);

    // detail 페이지 이외의 페이지일 경우 itemId가 없기 때문에 이를 위한 예외처리 실시
    if (itemId === null) {
        // localStorage에서 최근 본 목록을 가져옴
        let watched = getRecentlyWatched(isRecipe);

        // 디버깅을 위해 콘솔에 최근 본 목록 출력
        console.log("최근 본 객체 목록:", watched);

        // 최근 본 목록을 화면에 표시
        displayRecentlyWatchedItems(watched, ctx, isRecipe);
    } else {
        // 최근 본 목록 초기화
        initRecentlyWatchedList(itemId, ctx, isRecipe);
    }

    $(function(){
        $('#recently-seen-list').slick({
            vertical: true, // 세로 방향 슬라이드 옵션
            slidesToShow: 3, // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
            verticalSwiping: true,
            prevArrow: $('.slick-prev'),
            nextArrow: $('.slick-next'),
        });
    });
};

// 현재 페이지의 URL에서 쿼리 파라미터 값을 추출하는 함수
function getParameter(pageType) {
    let query = window.location.search;
    let param = new URLSearchParams(query);
    let num;
    let isRecipe;

    // 레시피 게시글일 때와 상품 게시글일 때를 구분하여 가져옴
    if(pageType === 'recipe') {
        num = param.get('rno');
        isRecipe = true;
    } else if(pageType === 'product') {
        num = param.get('pno');
        isRecipe = false;
    }

    console.log(num);
    return { num, isRecipe };
}

// localStorage에서 최근 본 목록을 가져오는 함수
function getRecentlyWatched(isRecipe) {
    let key = isRecipe ? "recentlyWatchedRecipes" : "recentlyWatchedProducts";
    let watched = localStorage.getItem(key);

    // 최근 본 목록이 없는 경우, 빈 배열로 초기화
    return watched ? JSON.parse(watched) : [];
}

// localStorage에 최근 본 목록을 저장하는 함수
function setRecentlyWatched(watched, isRecipe) {
    let key = isRecipe ? "recentlyWatchedRecipes" : "recentlyWatchedProducts";
    localStorage.setItem(key, JSON.stringify(watched));
}

// 최근 본 목록을 초기화하는 함수
function initRecentlyWatchedList(itemId, ctx, isRecipe) {
    let maxCount = 5;

    // localStorage에서 최근 본 목록을 가져옴
    let watched = getRecentlyWatched(isRecipe);

    // 현재 페이지의 아이템 ID가 최근 본 목록에 이미 있는지 확인
    let index = watched.indexOf(itemId);

    // 최근 본 목록에서 현재 페이지의 아이템 ID가 발견되지 않았을 경우에만 추가
    if (index === -1) {
        // 최근 본 목록에 아이템 ID 추가
        watched.push(itemId);

        // 최근 본 목록이 최대 아이템 갯수보다 큰 경우, 가장 오래된 아이템 삭제
        if (watched.length > maxCount) {
            watched.shift(); // 배열의 첫 번째 요소 제거
        }

        // 최근 본 목록을 localStorage에 다시 저장
        setRecentlyWatched(watched, isRecipe);
    }

    // 디버깅을 위해 콘솔에 최근 본 목록 출력
    console.log("최근 본 객체 목록:", watched);

    // 최근 본 목록을 화면에 표시
    displayRecentlyWatchedItems(watched, ctx, isRecipe);
}

// 최근 본 목록을 화면에 표시하는 함수
function displayRecentlyWatchedItems(items, ctx, isRecipe) {
    console.log(items);

    let recentlySeenList = document.getElementById('recently-seen-list');
    recentlySeenList.innerHTML = ''; // 기존 내용을 비움

    // 최근 본 목록이 비어 있는 경우
    if (items.length === 0) {
        let sidebar = document.getElementById('sidebar');
        sidebar.innerHTML = ''; // sidebar의 내용을 비움
        return; // 함수 종료
    }

    items.forEach(item => {
        console.log(item);
        // 실제 상품 이미지와 링크를 가져오는 로직으로 대체해야 합니다
        // 예: item을 기반으로 AJAX 요청을 통해 상품 정보를 가져옴
        let listItem = document.createElement('div');
        let itemImg = document.createElement('img');
        
        // 레시피 관련 페이지 경우와 상품 관련 페이지일 경우 썸네일 위치 정보가 다르기 때문에
        if(isRecipe) { // 레시피일 경우
            itemImg.src = ctx + "/resources/dummyImg/recipe/recipeMain/newRecipeThumbnail" + item + ".png"; // 실제 이미지 경로로 대체
        } else { // 상품일 경우
            itemImg.src = ctx + "/resources/dummyImg/shopping/item" + item + ".png"; // 실제 이미지 경로로 대체
        }
        itemImg.style.cursor = "pointer";

        // 이미지 클릭 시 해당 썸네일의 상세 페이지로 이동
        itemImg.onclick = function(){
            if(isRecipe) {
                location.href = ctx + "/detail.re?rno=" + item;
            } else {
                location.href = ctx + "/detail.po?pno=" + item;
            }
        }

        listItem.appendChild(itemImg);
        recentlySeenList.appendChild(listItem);
    });
}
