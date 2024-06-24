document.addEventListener("DOMContentLoaded", function() {
    askNotificationPermission();

    loginSet();

    let searchInput = document.querySelector('#search-input');
    searchInput.addEventListener("keypress", function(event) {
        if(event.key === 'Enter') {
            event.preventDefault();
            search(searchInput.value);
        }
    });
});


// 페이지 이동 함수
function moveLocation(path){
    if(path === '/gorang/logout.me') {
        localStorage.removeItem("uploadFile");
        localStorage.removeItem("tempBoardContent");
    }
    window.location.href =(path)
}

function search(value) {
    // alert(value);
    if(value.trim()=== "") {
        return;
    }

    window.location.href = "search.re?content=" + value;
}

function searchResult() {
    let searchInput = document.querySelector('#search-input');
    search(searchInput.value);
}

// ================================= 알림 관련 메소드 ==================================

function loginSet(){
    const profile = document.querySelector(".headerProfileImg");
    const notifyDiv = document.querySelector("#header-profile-notification");

    if(profile){
        const memberNo = profile.getAttribute("data-value");
        notifyDiv.addEventListener('click', (ev) => {
            ev.stopPropagation();
            getNotificationsByAjax( parseInt(memberNo), res => setNotification(res));
            // notificationSet(memberNo);  
        })
    }
}

function notificationSet(memberNo){
    const eventSource = new EventSource('http://localhost:8111/gorang/notifications/subscribe/' + memberNo);
    eventSource.addEventListener('sse', event => {
            const notifyData = event.data; // NotificationController.sendData(subscribe) 에서 처리하는 data
            console.log(notifyData);
            const showNotification = () => {
                const notify = new Notification(
                    "새로운 알림 도착", 
                    {
                     body: notifyData.content,
                     requireInteraction: true,  
                     });

                setTimeout(() => {notify.close();}, 60  * 60 * 1000);

                // 클릭 시 알람 보낸 페이지로 이동
                notify.addEventListener('click', () => {
                    window.open(notifyData, '_blank');
                })
            };
            if(Notification.permission === "granted"){
                showNotification();
            }  else if (Notification.permission === "denied" || Notification.permission === "default") {
                alert("알림이 차단된 상태입니다. 알림 권한을 허용해주세요.");
            }
            // } else if (Notification.permission !== "denied"){
            //     let permission = await Notification.requestPermission();
            //     if(permission === "granted"){
            //         showNotification();
            //     }
            // }
    });
};

/** 알림 권한 요청 함수 */
function askNotificationPermission(){
    console.log("권한 묻기");
    // 브라우저가 알림을 지원하는지 확인
    if(!("Notification" in window)){
        console.log("이 브라우저는 알림을 지원하지 않습니다.");
    } else {
        checkNotificationPromise() ? 
            Notification.requestPermission().then((permission) => {handlerPermission(permission)}) :
            Notification.requestPermission( (permission) => {handlerPermission(permission)});
    }
}

/** 권한을 실제로 요구하는 함수 */
function handlerPermission(permission){
    // 사용자의 응답에 관계없이 크롬이 정보 저장할 수 있도록 함
    if( !("permission" in Notification)) Notification.permission = permission;
}

/** 권한체크 */
function checkNotificationPromise(){
    try {
        Notification.requestPermission().then();
    } catch (e) {
        return false;
    }
    return true;
}

/** 알림 selectList 를 ajax로 받아오는 메소드 */
function getNotificationsByAjax(memberNo, callback){
    $.ajax({
        url: "getAlarmsByAjax.me",
        data: {memberNo: memberNo},
        success: function(res){
            console.log("알림 조회 요청 성공");
            console.log("알림 :", res);
            callback(res);
        },
        error: function(){
            console.log("알림 조회 요청 실패");
        }
    })
};

/** 받아 온 알림 리스트로 알림창 만드는 메소드 */
function setNotification(res){
    const dropdownUl = document.querySelector("#header-dropdown-container");
    const notifications = JSON.parse(res);
    if(notifications.length > 0){
        for(notify of notifications){
            let notifyType = notify.notifyType;
            switch(notifyType){
                case 1:
                    notifyType = "[좋아요]";
                    break;
                case 2: 
                    notifyType = "[댓글]";
                    break;
                case 3: 
                    notifyType = "[문의]";
                    break;
                case 4: 
                    notifyType = "[후기]";
                    break;
                case 5: 
                    notifyType = "[소비기한]";
                    break;
            }
            const dropDownItemlI = document.createElement('li');
            dropdownUl.appendChild(dropDownItemlI);
            const dropDownItemA = document.createElement('a');
            dropDownItemlI.appendChild(dropDownItemA);
            dropDownItemA.setAttribute('class', 'dropdown-item');
            dropDownItemA.innerHTML = notifyType + `&nbsp;` + notify.content;
        }
    } else {
        dropdownUl.innerHTML = "알림이 없습니다."
    }
  
}