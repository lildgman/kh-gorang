document.addEventListener("DOMContentLoaded", function(){

    // 주문 취소 버튼 클릭 이벤트
    document.querySelector(".tbody-td-btn-cancle").addEventListener("click", function(){
        showSweetConfirm();
    })
    // 문의하기 버튼 클릭 이벤트
    document.querySelector(".tbody-td-btn-qna").addEventListener("click", function(ev){
        ev.preventDefault();
        fillQnaModal(ev);
    })
    // 후기작성 버튼 클릭 이벤트
    document.querySelector(".tbody-td-btn-write").addEventListener("click", function(ev){   
        ev.preventDefault();
        fullReviewModal(ev);
    })

    setRatingStar();

    // 문의 모달 열릴 때 이벤트
    document.querySelector("#qna_Modal").addEventListener("show.bs.modal", function(ev) {
        resetImage(ev.target);
    });

    // 리뷰 모달 열릴 때 이벤트
    document.querySelector("#buyList-review_Modal").addEventListener("show.bs.modal", function(ev) {
        resetRating();
        resetImage(ev.target);
    });
})

/** QNA 모달 내 유저, 상품 정보 기입하는 함수 */
function fillQnaModal(ev){
    console.log("fillQnaModal 함수 호출됨"); // 함수가 호출되었는지 확인하기 위한 로그 출력
    // 문의하기 버튼을 자손으로 둔 tr 요소 찾기
    const trEl = ev.currentTarget.closest(".tbody-buy-list-block");

    const qnaModal = document.querySelector("#qna_Modal");
    // 모달 내 참조 상품 번호 입력
    qnaModal.querySelector("input[name='refProductNo']").value = trEl.querySelector(".buyList-input-productNo").value;
    // 모달 내 상품명, 상품 옵션번호, 옵션명
    qnaModal.querySelector(".qna_product_name").innerHTML = trEl.querySelector(".product-name").innerHTML;
    qnaModal.querySelector(".qna_pdopt_name > option").value = trEl.querySelector(".buyList-input-pdOptNo").value;
    qnaModal.querySelector(".qna_pdopt_name > option").innerHTML = trEl.querySelector(".product-opt-name").innerHTML;

    setupFileInput(qnaModal);
}

/** review 모달 내 유저, 상품 정보 기입하는 함수 */
function fullReviewModal(ev){
    console.log("fullReviewModal 함수 호출됨"); // 함수가 호출되었는지 확인하기 위한 로그 출력
    // 후기 작성 버튼을 자손으로 둔 tr 요소 찾기
    const trEl = ev.currentTarget.closest(".tbody-buy-list-block");

    const reviewModal = document.querySelector("#buyList-review_Modal");
    
    // 모달 내 참조 상품 번호 입력
    reviewModal.querySelector("input[name='refProductNo']").value = trEl.querySelector(".buyList-input-productNo").value;
    // 모달 내 상품명, 상품 옵션번호, 옵션명
    reviewModal.querySelector(".qna_product_name").innerHTML = trEl.querySelector(".product-name").innerHTML;
    reviewModal.querySelector(".qna_pdopt_name > option").value = trEl.querySelector(".buyList-input-pdOptNo").value;
    reviewModal.querySelector(".qna_pdopt_name > option").innerHTML = trEl.querySelector(".product-opt-name").innerHTML;

    setupFileInput(reviewModal);
} 

/** 주문 취소 관련 부트스트랩 모달 함수 */
function showSweetConfirm() {
    Swal.fire({
        title: '주문 취소하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                '주문 취소',
                '주문이 취소되었습니다.',
                'success'
            );
            // 탈퇴 처리 코드 여기에 추가
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire(
                '취소됨',
                '주문이 취소되지 않았습니다.',
                'error'
            );
        }
    });
}

/** 이미지 파일 첨부 및 이미지 미리 보기 함수 */
function setupFileInput(modalElement) {
    console.log("setupFileInput 함수 호출됨");
    const addPicBtn = modalElement.querySelector('.add_qna_product_pic');
    const fileInput = modalElement.querySelector('.file-input');
    const mainImgContainer = modalElement.querySelector('.qna_pic_container');

    // 클릭 이벤트 핸들러 정의
    function handleFileInputClick() {
        console.log("파일 첨부 버튼 클릭됨");
        fileInput.click();
    }

    // 파일 입력 변경 이벤트 핸들러 정의
    function handleFileInputChange(e) {
        console.log("파일 입력 변경됨");
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (ev) {
                mainImgContainer.innerHTML = `<img class="qna-img" src="${ev.target.result}" alt="Selected Image">`;
            };
            reader.readAsDataURL(file);
            mainImgContainer.style.display = 'block';
        }
    }

    // 파일 첨부 버튼 클릭 이벤트 핸들러 등록
    addPicBtn.addEventListener("click", function() {
        // 파일 첨부 이벤트가 이미 등록되어 있는지 확인
        if (!fileInput._fileInputHandlerAdded) {
            // 파일 첨부 이벤트가 등록되어 있지 않으면 이벤트 등록
            fileInput.addEventListener("change", handleFileInputChange);
            // 파일 첨부 이벤트가 등록되었음을 표시
            fileInput._fileInputHandlerAdded = true;
        }
        // 파일 입력 클릭 실행
        fileInput.click();
    });

}

/** 별점 평가 시 별 색칠하고 평점 값 설정하는 함수 */
function setRatingStar(){
    const stars = document.querySelectorAll(".modal-review-rating-content .star");
    const ratingInput = document.querySelector("input[name='rating']");

    stars.forEach(star => {
        star.addEventListener("click", function() {
            // data-value 값 가져옴
            let value = parseInt(this.getAttribute("data-value"));
            // input 에 값 넣기
            ratingInput.value = value;
            // 별 색칠하기
            highlightStars(value);
        });
    });

    function highlightStars(value) {
        stars.forEach(star => {
            const starValue = parseInt(star.getAttribute("data-value"));
            if (starValue <= value) {
                star.querySelector("path").setAttribute("fill", "#FFD700");
            } else {
                star.querySelector("path").setAttribute("fill", "#DBDBDB");
            }
        });
    };

}

/** 별점 리셋 */
function resetRating() {
    console.log("resetRating 함수 호출됨");

    const ratingInput = document.querySelector("input[name='rating']");
    ratingInput.value = 0;
    const stars = document.querySelectorAll(".modal-review-rating-content .star");
    stars.forEach(star => {
        star.querySelector("path").setAttribute("fill", "#DBDBDB"); // Gray color
    });
}

/** 이미지 초기화 */
function resetImage(modalElement) {
    console.log("resetImage 함수 호출됨"); 

    const fileInput = modalElement.querySelector('.file-input');
    fileInput.value = "";
    const mainImgContainer = modalElement.querySelector('.qna_pic_container');
    mainImgContainer.innerHTML = "";
    mainImgContainer.style.display = 'none';
}