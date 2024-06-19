// $(document).ready(function () {
//     // 게시글 로딩 시 조회수 증가
//     increaseViewCount();

//     function increaseViewCount() {
//         var boardNo = '${board.boardNo}'; // 현재 게시글 번호
//         var visitedBoards = JSON.parse(localStorage.getItem('visitedBoards')) || [];

//         // 이미 조회한 게시글인지 확인
//         if (!visitedBoards.includes(boardNo)) {
//             $.ajax({
//                 url: '${contextPath}/board/increaseViewCount',
//                 type: 'POST',
//                 contentType: 'application/json',
//                 data: JSON.stringify({ boardNo: boardNo }),
//                 success: function (response) {
//                     console.log("View count increased successfully")
//                     // 조회한 게시글 번호를 로컬 스토리지에 추가
//                     visitedBoards.push(boardNo);
//                     localStorage.setItem('visitedBoards', JSON.stringify(visitedBoards));
//                 },
//                 error: function (error) {
//                     console.log("Error increasing view count:", error);
//                 }
//             });
//         } else {
//             console.log("Already visited this board. Skipping view count increase.");
//         }
//     }
// });
// function writeComment() {
//     var commentContent = document.getElementById("commentContent").value;

//     // AJAX를 이용하여 서버로 댓글 내용을 전송
//     $.ajax({
//         type: "POST",
//         url: "insertComment.bo", // 서버의 컨트롤러 매핑 주소
//         data: { commentContent: commentContent }, // 댓글 내용을 전달
//         success: function(response) {
//             // 서버로부터의 응답 처리
//             // 여기서 필요한 작업을 수행 (예: 댓글 목록 갱신 등)
//         },
//         error: function(xhr, status, error) {
//             // 오류 처리
//             console.error(xhr.responseText);
//         }
//     });
// }

function addReply(element) {
    const replyTargetDiv = element.closest('.userReplyWrap');
    const commentNo = replyTargetDiv.querySelector('.comment-no').value;
    const boardNo = replyTargetDiv.querySelector('.board-no').value;
    const replyArea = document.querySelector('#ReplyArea');
    const existReplyDiv = replyArea.querySelector('.reply-input');

    console.log(commentNo);
    console.log(replyTargetDiv.querySelector('.comment-no'));


    if (!existReplyDiv) {
        drawReReply(replyTargetDiv, commentNo, boardNo);
    } else {
        existReplyDiv.remove();
        drawReReply(replyTargetDiv, commentNo, boardNo);
    }
}

function drawReReply(replyTarget, commentNo, boardNo) {
    const replyInputDiv = document.createElement('div');
    replyInputDiv.classList.add('reply-input');
    replyInputDiv.innerHTML = `
            <textarea class="rereply-textarea" placeholder="댓글을 입력하세요" maxlength="500" oninput="autoExpand(this)"></textarea>
            <button type="button" class="submit-reply" data-refNo="`+ commentNo + `" data-boardNo="` + boardNo + `" onclick="ajaxAddReply(this)" >등록</button>
        `;

    replyTarget.insertAdjacentElement('afterend', replyInputDiv);
}

function ajaxAddReply(element) {
    const commentContent = element.closest('.reply-input');

    const refCommentNo = element.getAttribute('data-refNo');
    const boardNo = element.getAttribute('data-boardNo');
    const commentContentValue = commentContent.querySelector('.rereply-textarea').value;

    if(commentContentValue.trim() === "") {
        alert("댓글내용을 입력해주세요");
        return;
    }

    $.ajax({
        url: 'insert.re',
        type: 'post',
        data: {
            commentContent: commentContentValue,
            boardNo: boardNo,
            refCommentNo: refCommentNo
        },
        success: function (res) {
            if (res === "done") {
                window.location.reload();
            }
        },
        error: function () {
            console.log("댓글 달기 api 호출 실패");
        }
    })
}

function deleteBoard(element) {

    const result = confirm("게시글을 삭제하시겠습니까?");

    if (result) {
        const boardNo = element.getAttribute('data-boardNo');

        $.ajax({
            url: 'delete.bo',
            type: 'post',
            data: {
                boardNo: boardNo
            },
            success: function (res) {
                console.log(res);
                if (res === 'done') {
                    alert("게시글을 삭제하였습니다.");
                    window.location.href = "main.bo";
                } else {
                    alert("게시글 삭제를 실패하였습니다.");
                }
            },
            error: function () {
                console.log("게시글 삭제 api 호출 실패");
            }
        })
    }


}

function removeReply(element) {
    const commentNo = element.getAttribute('data-commentNo');

    $.ajax({
        url: 'delete.co',
        type: 'post',
        data: {
            commentNo: commentNo
        },
        success: function (res) {
            if (res === 'done') {
                alert('댓글을 삭제하였습니다.');
                window.location.reload();
            }
        },
        error: function () {
            console.log("댓글 삭제 api 호출 실패");
        }


    })
}

function toggleLikeBoard(element) {
    const loginUserNo = element.getAttribute('data-userNo');
    const boardNo = element.getAttribute('data-boardNo');

    if (loginUserNo) {
        $.ajax({
            url: 'like.bo',
            type: 'post',
            data: {
                boardNo: boardNo
            },
            success: function (res) {
                if (res === 'cancle_like') {
                    alert("좋아요 취소하셨습니다.");
                } else if (res === 'do_like') {
                    alert("좋아요를 누르셨습니다.")
                } else {
                    alert("좋아요를 실패하였습니다.");
                }

                window.location.reload();
            },
            error: function () {
                console.log('좋아요 기능 api 호출 실패');
            }


        })
    } else {
        alert("로그인이 필요한 기능입니다.");
    }

}

function toggleScrapBoard(element) {
    const loginUserNo = element.getAttribute('data-userNo');
    const boardNo = element.getAttribute('data-boardNo');

    if(loginUserNo) {
        $.ajax({
            url:'scrap.bo',
            type: 'post',
            data: {
                boardNo: boardNo
            },
            success: function (res) {
                if (res === 'cancle_scrap') {
                    alert("스크랩을 취소하셨습니다.");
                } else if (res === 'do_scrap') {
                    alert("스크랩을 완료하였습니다.")
                } else {
                    alert("스크랩을 실패하였습니다.");
                }

                window.location.reload();
            
            
            }, 
            error: function() {
                console.log('상품 스크랩 api 호출 실패');
            }


        })
    } else {
        alert("로그인이 필요한 기능입니다.");
    }
}

function checkSelectedOneOption(event) {
    const checkBoxes = document.querySelectorAll('.reason');

    checkBoxes.forEach(function (checkBox) {
        checkBox.checked = false;
    })

    event.target.checked = true;
}

function reportBoard(element) {
    const boardNo = element.getAttribute('data-boardNo');

    const checkedReasonDiv = document.querySelector('.reason:checked');
    const reportContentDiv = document.querySelector('#report-content');
    
    if(!checkedReasonDiv) {
        alert("신고사유를 골라주세요.");
        return;
    } 

    const reason = checkedReasonDiv.closest('.reason-div').querySelector('label').innerText;
    const reportContent = reportContentDiv.value;

    $.ajax({
        url: 'report.bo',
        type: 'post',
        data: {
            boardNo: boardNo,
            reportReason : reason,
            reportContent : reportContent
        },
        success: function(res) {
            if(res === "done") {
                alert("신고가 성공적으로 완료되었습니다.");
                window.location.reload();
            } else {
                alert("신고를 실패하였습니다.");
            }
        },
        error : function() {
            console.log("게시글 신고 api 호출 실패");
        }

    })
    
}

function validateComment() {
    const commentContent = document.querySelector('#commentContent').value.trim();
    console.log(commentContent);
    console.log(commentContent.length);

    if(commentContent === "") {
        alert("댓글 내용이 없습니다. 댓글 내용을 입력해주세요");
        return false;
    }

    return true;
}

function autoExpand(element) {
    console.log(element);
    element.style.height = 'auto'; // 높이를 자동으로 설정하여 초기화
    element.style.height = (element.scrollHeight) + 'px'; // 스크롤 높이에 따라 높이를 재설정
}