// 편집 => 삭제 변경
function editBtn(){
    document.getElementById("delete-edit").style.display="none";
    document.getElementById("delete-like").style.display="block";
    
    let checkboxes = document.querySelectorAll('.delete-check');
    checkboxes.forEach(function(checkbox) {
        checkbox.style.display ="block";
    });
    
}

//삭제하기
function deleteBtn(){
    // let scraplist = document.querySelectorAll("#scrap-area-content .scrap-content");
    // console.log(scraplist);
    // scraplist.forEach(function(scrap){
    //     checkbox=scrap.querySelector("#delete-check");
    //     if(checkbox.checked){
    //         scrap.remove();
    //     }
    // })

    // document.getElementById("delete-edit").style.display="block";
    // document.getElementById("delete-like").style.display="none";
    // let checkboxes = document.querySelectorAll('.delete-check');
    // checkboxes.forEach(function(checkbox) {
    //     checkbox.style.display ="none";
    // });
    const checkedCheckBoxes = document.querySelectorAll('.delete-check:checked');

    if (checkedCheckBoxes.length === 0) {
        alert('삭제할 항목을 선택해주세요');
        toggleDelete();
        return;
    }

    const result = confirm("정말로 스크랩을 취소하시겠습니까?");

    if (result) {

        checkedCheckBoxes.forEach(function (checkedCheckBox) {
            const scrapContent = checkedCheckBox.closest('.scrap-content');
            const scrapProductNo = scrapContent.querySelector('.scrap-img').getAttribute('data-no');

            console.log(scrapProductNo);
            $.ajax({
                url: 'delete-scrap-product.me',
                type: 'post',
                data: {
                    productNo: scrapProductNo
                },
                success: function (res) {
                    if (res === 'done') {
                        // scrapContent.remove();
                        // toggleDelete();
                        window.location.href = window.location.href;
                    }
                },
                error: function () {
                    console.log('스크랩 취소 api 호출 실패');
                }
            })
        })

    }


}

function moveDetailPage(element) {
    const productNo = element.getAttribute('data-no');
    window.location.href = "detail.po?pno=" + productNo;
}

