$(document).ready(function () {
    // 게시글 로딩 시 조회수 증가
    increaseViewCount();

    function increaseViewCount() {
        var boardNo = '${board.boardNo}'; // 현재 게시글 번호
        var visitedBoards = JSON.parse(localStorage.getItem('visitedBoards')) || [];

        // 이미 조회한 게시글인지 확인
        if (!visitedBoards.includes(boardNo)) {
            $.ajax({
                url: '${contextPath}/board/increaseViewCount',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ boardNo: boardNo }),
                success: function (response) {
                    console.log("View count increased successfully")
                    // 조회한 게시글 번호를 로컬 스토리지에 추가
                    visitedBoards.push(boardNo);
                    localStorage.setItem('visitedBoards', JSON.stringify(visitedBoards));
                },
                error: function (error) {
                    console.log("Error increasing view count:", error);
                }
            });
        } else {
            console.log("Already visited this board. Skipping view count increase.");
        }
    }
});
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


    if(!existReplyDiv) {
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
            <input type="text" placeholder="댓글을 입력하세요"></input>
            <button type="button" class="submit-reply" data-refNo="`+commentNo+`" data-boardNo="`+boardNo+`" onclick="ajaxAddReply(this)">등록</button>
        `;

    replyTarget.insertAdjacentElement('afterend', replyInputDiv);
}

function ajaxAddReply(element) {
    const commentContent = element.closest('.reply-input');

    const refCommentNo = element.getAttribute('data-refNo');
    const boardNo = element.getAttribute('data-boardNo');
    const commentContentValue = commentContent.querySelector('input[type="text"]').value;

    $.ajax({
        url: 'insert.re',
        type: 'post',
        data: {
            commentContent:commentContentValue,
            boardNo : boardNo,
            refCommentNo: refCommentNo
        },
        success: function(res) {
            if(res === "done") {
                window.location.reload();
            }
        },
        error: function() {
            console.log("댓글 달기 api 호출 실패");
        }
    })
}

function deleteBoard(element) {

    const result = confirm("게시글을 삭제하시겠습니까?");

    if(result) {
        const boardNo = element.getAttribute('data-boardNo');

        $.ajax({
            url: 'delete.bo',
            type: 'post',
            data: {
                boardNo: boardNo
            },
            success: function(res) {
                console.log(res);
                if(res === 'done') {
                    alert("게시글을 삭제하였습니다.");
                    window.location.href = "main.bo";
                } else {
                    alert("게시글 삭제를 실패하였습니다.");
                }
            },
            error: function() {
                console.log("게시글 삭제 api 호출 실패");
            }
        })
    }

    
}

function removeReply(element) {
    const commentNo = element.getAttribute('data-commentNo');
    
    $.ajax({
        url:'delete.co',
        type:'post',
        data: {
            commentNo : commentNo
        },
        success: function(res) {
            if(res === 'done') {
                alert('댓글을 삭제하였습니다.');
                window.location.reload();
            }
        },
        error: function() {
            console.log("댓글 삭제 api 호출 실패");
        }


    })
}

function toggleLikeBoard(element) {
    const loginUser = element.getAttribute('data-user');
    const boardNo = element.getAttribute('data-boardNo');

    if(loginUser) {
        console.log(loginUser);
        $.ajax({
            url: 'like.bo',
            type: 'post',
            data: {
                boardNo : boardNo
            },
            success: function(res) {
                console.log(res);
                if(res === 'cancle_like') {
                    alert("좋아요 취소하셨습니다.");
                } else if (res === 'do_like') {
                    alert("좋아요를 누르셨습니다.")
                } else {
                    alert("좋아요를 실패하였습니다.");
                }

                window.location.reload();
            },
            error: function() {
                console.log('좋아요 기능 api 호출 실패');
            }


        })
    } else {
        alert("로그인이 필요한 기능입니다.");
    }

}