function searchBoard() {
  const searchBoardTitle = document.querySelector('#search-board-name-input').value;

  if(searchBoardTitle) {
    $.ajax({
      url: 'search-board.ma',
      type: 'get',
      data: {
        searchBoardTitle: searchBoardTitle
      },
      success: function(res) {
        drawBoardTable(res.pi, res.boardList);
        drawPagination(res.pi, searchBoardTitle);
      }, 
      error: function() {
        console.log("상품 검색 api 호출 실패")
      }
    })
  }
  
}

function drawPagination(pi, searchBoardTitle) {
  const paginationDiv = document.querySelector('#pagination');
  paginationDiv.innerHTML = "";

  if(pi.currentPage !== 1) {
    paginationDiv.innerHTML += `<span data-cpage="${pi.currentPage - 1 }" data-searchBoardTitle="${searchBoardTitle}" onclick="movePage(this)">&lt;</span>`;
  }

  for(let p = pi.startPage; p <= pi.endPage; p++) {
    if(p === pi.currentPage) {
      paginationDiv.innerHTML += `<span data-cpage="${p}" data-searchBoardTitle="${searchBoardTitle}" onclick="movePage(this)"><strong>${p}</strong></span>`;
    } else {
      paginationDiv.innerHTML += `<span data-cpage="${p}" data-searchBoardTitle="${searchBoardTitle}" onclick="movePage(this)">${p}</span>`;

    }
  }

  if(pi.currentPage < pi.maxPage) {
    paginationDiv.innerHTML += `<span data-cpage="${pi.currentPage + 1 }" data-searchBoardTitle="${searchBoardTitle}" onclick="movePage(this)">&gt;</span>`;
  }
}

function movePage(element) {
  const cpage = element.getAttribute('data-cpage');
  const searchBoardTitle = element.getAttribute('data-searchBoardTitle');

  ajaxSearchBoard(cpage,searchBoardTitle);

}

function ajaxSearchBoard(cpage,searchBoardTitle) {
  $.ajax({
    url: 'search-board.ma',
    type: 'get',
    data: {
      cpage:cpage,
      searchBoardTitle: searchBoardTitle
    },
    success: function(res) {
      drawBoardTable(res.pi, res.boardList);
      drawPagination(res.pi, searchBoardTitle);
    }, 
    error: function() {
      console.log("상품 검색 api 호출 실패")
    }
  })
}

function drawBoardTable(pi, boardList) {
  const boardTableTbody = document.querySelector("#admin-board-list tbody");
  
  const boardCount = document.querySelector('#board-count');
  boardCount.innerText = pi.listCount;
  boardTableTbody.innerHTML = "";
  boardList.forEach(boardDTO => {
    const newRow = $('<tr class="admin-tbody-tr hover-tr" onclick="moveDetailBoardPage(this)"></tr>');

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

function moveDetailBoardPage(element){
  const boardNo = element.querySelector('.board-no').innerText;
  window.location.href = "detail.bo?boardNo=" + boardNo;
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

  if(boardNoList.length === 0) {
    alert("게시글을 선택해주세요.");
    return;
  }

  const result = confirm("정말로 게시물의 상태를 변경하시겠습니까?");

  if(result) {
    $.ajax({
      url: 'update-status.bo',
      type: 'post',
      contentType: 'application/json',
      data: JSON.stringify(boardNoList),
      success: function(res) {
        if(res === 'done') {
          alert("게시물 상태를 성공적으로 변경하였습니다.");
          window.location.href = window.location.href;
        } else {
          alert("게시물 상태 변경을 실패하였습니다.")
        }
      },
      error: function() {
        console.log("게시글 상태 변경 api 호출 실패");
      }
  
    })
  }

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

document.addEventListener("DOMContentLoaded", function() {
  const searchInput = document.querySelector('#search-board-name-input');
  searchInput.addEventListener("keypress",function(event) {
    if(event.key == 'Enter') {
      event.preventDefault();
      if(searchInput.value) {
        searchBoard();
      }
    }
  })
})