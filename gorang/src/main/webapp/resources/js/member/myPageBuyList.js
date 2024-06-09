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

})

/** QNA 모달 내 유저, 상품 정보 기입하는 함수 */
function fillQnaModal(ev){
    // 문의하기 버튼을 자손으로 둔 tr 요소 찾기
    const trEl = ev.currentTarget.closest(".tbody-buy-list-block");
    // 모달 내 참조 상품 번호 입력
    document.querySelector("input[name='refProductNo']").value = trEl.querySelector(".buyList-input-productNo").value;
    // 모달 내 상품 옵션번호 및 상품명
    document.querySelector("#qna_product_name > option").value = trEl.querySelector(".buyList-input-pdOptNo").value;
    document.querySelector("#qna_product_name > option").innerHTML = trEl.querySelector(".product-opt-name").innerHTML;

    // 문의 사진 첨부 버튼 이벤트
    document.querySelector('#add_qna_product_pic').addEventListener("click", function(){
        // 파일 첨부 클릭 실행
        document.querySelector('#file-input').click();
    })

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

