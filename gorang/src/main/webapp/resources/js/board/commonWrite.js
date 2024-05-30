document.addEventListener('DOMContentLoaded', function() {
    const saveContentBtn = document.getElementById('saveContentBtn');
    // const enrollContentBtn = document.getElementById('enrollContentBtn'); // 수정: enrollContentBtn 변수 삭제
    const boardCategory = document.getElementById('boardCategory');
    const boardTitle = document.getElementById('boardTitle');
    const boardThumbnail = document.getElementById('boardThumbnail');
    const boardContent = document.getElementById('boardContent');
    const form = document.querySelector('form');
    const writeUploadThumbnail = document.getElementById('writeUploadThumbnail');

    // 임시 저장 버튼 클릭 이벤트
    saveContentBtn.addEventListener('click', function() {
        saveTemporary();
    });

    // 폼 제출 이벤트
    form.addEventListener('submit', function(event) {
        if (!validateForm()) {
            event.preventDefault(); // 유효성 검사 실패 시 폼 제출 방지
        }
    });

    // 이미지 파일 업로드 이벤트
    boardThumbnail.addEventListener('change', function(event) {
        displayThumbnail(event);
    });

    // 콘텐츠 임시 저장 함수
    function saveTemporary() {
        const tempData = {
            category: boardCategory.value,
            title: boardTitle.value,
            thumbnail: boardThumbnail.value,
            content: boardContent.value
        };
        localStorage.setItem('tempBoardContent', JSON.stringify(tempData));
        alert('내용이 임시 저장되었습니다!');
    }

    // 폼 유효성 검사 함수
    function validateForm() {
        if (boardCategory.value === "" || boardCategory.value === "카테고리") {
            alert("카테고리를 선택해주세요.");
            boardCategory.focus();
            return false;
        }
        if (boardTitle.value.trim() === "") {
            alert("제목을 입력해주세요.");
            boardTitle.focus();
            return false;
        }
        if (boardThumbnail.files.length === 0) {
            alert("이미지를 선택해주세요.");
            return false;
        }
        if (boardContent.value.trim() === "") {
            alert("내용을 입력해주세요.");
            boardContent.focus();
            return false;
        }
        return true;
    }

    // 임시 저장된 데이터 불러오는 함수
    function loadTemporaryData() {
        const tempData = localStorage.getItem('tempBoardContent');
        if (tempData) {
            const { category, title, thumbnail, content } = JSON.parse(tempData);
            if (category) boardCategory.value = category;
            if (title) boardTitle.value = title;
            if (thumbnail) boardThumbnail.value = thumbnail;
            if (content) boardContent.value = content;
        }
    }

    // 페이지 로드 시 임시 저장된 데이터 불러오기
    loadTemporaryData();

   // 썸네일 이미지를 표시하는 함수
function displayThumbnail(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            // 기존 하위 요소 제거
            while (writeUploadThumbnail.firstChild) {
                writeUploadThumbnail.removeChild(writeUploadThumbnail.firstChild);
            }
            // 새로운 이미지 요소 생성 및 추가
            const img = document.createElement('img');
            img.src = e.target.result;
            img.style.width = '100%';
            img.style.height = 'auto';
            img.style.objectFit = 'cover';
            img.style.aspectRatio = '1 / 1';
            // writeUploadThumbnail div를 이미지로 교체
            writeUploadThumbnail.innerHTML = '';
            writeUploadThumbnail.appendChild(img);
        }
        reader.readAsDataURL(file);
        // 이미지를 업로드하는 경우 썸네일 값을 파일 이름으로 설정
        boardThumbnail.value = file.name;
    } else {
        // 이미지를 선택하지 않은 경우 썸네일 값을 빈 문자열("")로 설정
        boardThumbnail.value = '';
    }
}

});
