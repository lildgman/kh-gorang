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

document.addEventListener('DOMContentLoaded', function () {
    const saveContentBtn = document.getElementById('saveContentBtn');
    // const enrollContentBtn = document.getElementById('enrollContentBtn'); // 수정: enrollContentBtn 변수 삭제
    const boardCategory = document.getElementById('boardTag');
    const boardTitle = document.getElementById('boardTitle');
    const boardThumbnail = document.querySelector('#thumbnail-container');
    const boardContent = document.getElementById('boardContent');
    const form = document.querySelector('form');
    const uploadFileInput = document.querySelector('#file-input');


    // 임시 저장 버튼 클릭 이벤트
    saveContentBtn.addEventListener('click', function () {
        saveTemporary();
    });

    // 폼 제출 이벤트
    form.addEventListener('submit', function (event) {

        if (!validateForm()) {
            event.preventDefault(); // 유효성 검사 실패 시 폼 제출 방지   
        }
        localStorage.removeItem("uploadFile");
        localStorage.removeItem("tempBoardContent");
    });

    // 콘텐츠 임시 저장 함수
    function saveTemporary() {

        const file = uploadFileInput.files[0];

        if(file) {

            const reader = new FileReader();
            reader.onload = function(event) {
                const fileContent = event.target.result;
                localStorage.setItem('uploadFile', fileContent);
            };
            reader.readAsDataURL(file);

        };

        const tempData = {
            category: boardCategory.value,
            title: boardTitle.value,
            thumbnail: boardThumbnail.innerHTML,
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
        if (uploadFileInput.files.length === 0) {
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
        const uploadFile = localStorage.getItem('uploadFile');
        const tempData = localStorage.getItem('tempBoardContent');

        if(uploadFile) {

            const base64Parts = uploadFile.split(',');
            const mimeType = base64Parts[0].match(/:(.*?);/)[1];
            const base64Data = base64Parts[1];

            const byteCharacters = atob(base64Data);
            const byteNumbers = new Array(byteCharacters.length);
            for (let i = 0; i < byteCharacters.length; i++) {
                byteNumbers[i] = byteCharacters.charCodeAt(i);
            }
            const byteArray = new Uint8Array(byteNumbers);
            const fileBlob = new Blob([byteArray], { type: mimeType });

            const file = new File([fileBlob], 'stored_img.png', { type: mimeType });

            const dataTransfer = new DataTransfer();
            dataTransfer.items.add(file);

            uploadFileInput.files = dataTransfer.files;

        }


        if (tempData) {
            const { category, title, thumbnail, content } = JSON.parse(tempData);
            if (category) {
                boardCategory.value = category;
            }
            if (title) {
                boardTitle.value = title;
            }
            if (thumbnail) {
                boardThumbnail.innerHTML = thumbnail;
            }
            if (content) {
                boardContent.value = content;
            }

        }

    }

    if(localStorage.getItem('tempBoardContent') || localStorage.getItem('uploadFile')) {
        const result = confirm('임시저장한 게시글이 있습니다. 불러오시겠습니까?');

        if(result) {    
            loadTemporaryData();
        }
        
    }

});



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

    if (file) {
        const reader = new FileReader();
        reader.onload = function (event) {
            imgContainer.innerHTML = `<img id="main-img" src="${event.target.result}" alt="Selected Image">`;
        };
        reader.readAsDataURL(file);
    }

}

function turnMainPage() {
    const result = confirm('글쓰기를 취소하시겠습니까? 저장되지 않은 내용은 삭제됩니다.');

    if (result) {
        window.location.href = '/gorang';
    }
}

