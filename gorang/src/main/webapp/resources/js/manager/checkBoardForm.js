function searchBoard() {
  const searchBoardTitle = document.querySelector('#search-board-name-input').value;

  $.ajax({
    url: 'search-board.ma',
    type: 'get',
    data: {
      searchBoardTitle: searchBoardTitle
    },
    success: function(res) {
      drawBoardTable(res);
    }, 
    error: function() {
      console.log("상품 검색 api 호출 실패")
    }

  })
}

function drawBoardTable(res) {
  const boardDTOList = res;
  const boardTableTbody = document.querySelector("#admin-board-list tbody");
  
  const boardCount = document.querySelector('#board-count');
  boardCount.innerText = boardDTOList.length;
  boardTableTbody.innerHTML = "";
  boardDTOList.forEach(boardDTO => {
    const newRow = $('<tr class="admin-tbody-tr"></tr>');

    newRow.append('<td class="tbody-checkbox"><input type="checkbox" name="check" class="check-board"></td>');
    newRow.append('<td style="color: #1e90ff;" class="board-no">'+boardDTO.board.boardNo+'</td>');
    newRow.append('<td>'+boardDTO.board.boardTag +'</td>');
    newRow.append('<td>'+boardDTO.board.boardTitle +'</td>');
    newRow.append('<td>'+boardDTO.boardWriter +'</td>');
    newRow.append('<td>'+formattingDate(boardDTO.board.boardCreateDate) +'</td>');
    newRow.append('<td>'+boardDTO.reportCount +'</td>');
    newRow.append('<td>'+boardDTO.board.status +'</td>');
    
    boardTableTbody.append(newRow[0]);
  });
}

function formattingDate(dateString) {
  const months = {
    "1월": "01",
    "2월": "02",
    "3월": "03",
    "4월": "04",
    "5월": "05",
    "6월": "06",
    "7월": "07",
    "8월": "08",
    "9월": "09",
    "10월": "10",
    "11월": "11",
    "12월": "12"
  };

  let [month, day, year] = dateString.split(' ');

  month = months[month];
  day = day.replace(',', '');

  let date = new Date(`${year}-${month}-${day.padStart(2, '0')}`);

  let formattedDate = date.toISOString().split('T')[0];

  return formattedDate;
}

function updateBoardStatus() {
  const boardNoList = getCheckedBoard();

  $.ajax({
    url: 'update-status.bo',
    type: 'post',
    contentType: 'application/json',
    data: JSON.stringify(boardNoList),
    success: function(res) {
      console.log(res);
    },
    error: function() {
      console.log("게시글 상태 변경 api 호출 실패");
    }

  })
}

function getCheckedBoard() {
  const checkedCheckboxes = document.querySelectorAll('.check-board:checked');
  const boardNoList = [];
  checkedCheckboxes.forEach(checkedCheckbox => {
    const boardNo = parseInt(checkedCheckbox.closest('.admin-tbody-tr').querySelector('.board-no').innerText);
    boardNoList.push(boardNo);
  });
  return boardNoList;
}

