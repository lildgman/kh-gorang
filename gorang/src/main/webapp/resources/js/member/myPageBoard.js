function movePage(element) {
  const contentNo = element.getAttribute('data-no');
  window.location.href = "detail.bo?boardNo=" + contentNo;
}

function deleteRecipeBoard(element){

  const result = confirm('정말 게시글을 삭제하시겠습니까?');
  
  if(result) {
      const boardContainer = element.closest('.myPage-board-list-block');
      const boardNo = parseInt(boardContainer.querySelector('.myPage-board-img').getAttribute('data-no'));
      
      $.ajax({
          url: 'remove-board.me',
          type: 'post',
          data: {
            boardNo : boardNo
          },
          success: function(res) {
              if(res === 'done') {
                  alert("게시글을 삭제하였습니다.");
                  recipeContainer.remove();
              } else {
                  alert("게시글 삭제를 실패하였습니다.");
              }

          },
          error: function() {
              console.log("나의 게시글 삭제 api 호출 실패");
          }
      })
      
  }
  
}