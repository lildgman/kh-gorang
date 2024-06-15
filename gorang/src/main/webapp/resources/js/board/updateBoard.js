document.addEventListener('DOMContentLoaded', function () {
    const saveContentBtn = document.getElementById('saveContentBtn');
    // const enrollContentBtn = document.getElementById('enrollContentBtn'); // 수정: enrollContentBtn 변수 삭제
    const boardCategory = document.getElementById('boardCategory');
    const boardTitle = document.getElementById('boardTitle');
    const boardThumbnail = document.querySelector('#uploadThumbnailSection');
    const boardContent = document.getElementById('boardContent');
    const form = document.querySelector('form');

    // 임시 저장 버튼 클릭 이벤트
    saveContentBtn.addEventListener('click', function () {
        saveTemporary();
    });

    // 폼 제출 이벤트
    form.addEventListener('submit', function (event) {
        if (!validateForm()) {
            event.preventDefault(); // 유효성 검사 실패 시 폼 제출 방지
        }
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
});

window.onload = function () {
    $('.summernote').summernote({
        height: 329,
        lang: "ko-KR",
        toolbar: [
            ['insert', ['link', 'picture']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],

        ],
        callbacks: {
            onImageUpload: uploadFiles
        }
    });
}

function uploadFiles(fileList) {
    const formData = new FormData();

    for (let file of fileList) {
        formData.append("fileList", file);
    }

    insertFileApi(formData, function (nameList) {
        for (let name of nameList) {
            $(".summernote").summernote('insertImage', "/gorang/resources/uploadfile" + name);
        }
    });
}

function insertFileApi(data, callback) {
    $.ajax({
        url: "content.bo",
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        dataType: "json",
        success: function (changeNameList) {
            callback(changeNameList);
        },
        error: function () {
            console.log("파일업로드 api 요청 실패");
        }
    })
}

function fileInputClick() {
    const fileInput = document.querySelector('#file-input');
    fileInput.click();
}

function displaySelectedImg(event) {
    const imgContainer = document.querySelector('#thumbnail-container');
    const file = event.target.files[0];
    console.log(file);
    console.log(imgContainer);

    if (file) {
        const reader = new FileReader();
        reader.onload = function (event) {
            imgContainer.innerHTML = `<img id="main-img" src="${event.target.result}" alt="Selected Image">`;
        };
        reader.readAsDataURL(file);
    }

}

function turnBack() {
    const result = confirm('글쓰기를 취소하시겠습니까? 저장되지 않은 내용은 삭제됩니다.');

    if(result) {
        window.history.back();
    }
}