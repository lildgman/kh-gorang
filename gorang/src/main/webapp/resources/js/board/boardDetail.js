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
