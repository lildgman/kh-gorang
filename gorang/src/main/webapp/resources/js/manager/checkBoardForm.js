function searchBoard() {
  const searchBoardTitle = document.querySelector('#search-board-name-input').value;

  $.ajax({
    url: 'search-board.ma',
    type: 'get',
    data: {
      searchBoardTitle: searchBoardTitle
    },
    success: function(res) {
      console.log(res);
    }, 
    error: function() {
      console.log("상품 검색 api 호출 실패")
    }

  })
}