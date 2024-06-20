document.addEventListener("DOMContentLoaded", function() {
  const searchInput = document.querySelector('#search-member-input');
  searchInput.addEventListener("keypress",function(event) {
    if(event.key == 'Enter') {
      event.preventDefault();
      if(searchInput.value) {
        searchMember();
      }
    }
  })
})

// 검색한 회원 조회 함수
function searchMember() {
  const searchMemberValue = document.querySelector('#search-member-input').value;

  if(searchMemberValue) {
    $.ajax({
      url: 'search-member.ma',
      type: 'get',
      data: {
        searchMember: searchMemberValue
      },
      success: function(res) {
        drawMemberTable(res.memberList);
        drawPagination(res.pi, searchMemberValue);
      }, 
      error: function() {
        console.log("회원 검색 api 호출 실패");
      }
  
    })
  }
}

function drawPagination(pi, searchMember){
  const paginationDiv = document.querySelector('#pagination');
  paginationDiv.innerHTML = "";

  if(pi.currentPage !== 1) {
    paginationDiv.innerHTML += `<span data-cpage="${pi.currentPage - 1 }" data-searchMember="${searchMember}" onclick="movePage(this)">&lt;</span>`;
  }

  for(let p = pi.startPage; p <= pi.endPage; p++) {
    if(p === pi.currentPage) {
      paginationDiv.innerHTML += `<span data-cpage="${p}" data-searchMember="${searchMember}" onclick="movePage(this)"><strong>${p}</strong></span>`;
    } else {
      paginationDiv.innerHTML += `<span data-cpage="${p}" data-searchMember="${searchMember}" onclick="movePage(this)">${p}</span>`;

    }
  }

  if(pi.currentPage < pi.maxPage) {
    paginationDiv.innerHTML += `<span data-cpage="${pi.currentPage + 1 }" data-searchMember="${searchMember}" onclick="movePage(this)">&gt;</span>`;
  }
}

function movePage(element) {
  const cpage = element.getAttribute('data-cpage');
  const searchMember = element.getAttribute('data-searchMember');

  paginationSearchBoard(cpage,searchMember);
}

function paginationSearchBoard(cpage,searchMember) {
  $.ajax({
    url: 'search-member.ma',
    type: 'get',
    data: {
      cpage : cpage,
      searchMember: searchMember
    },
    success: function(res) {
      drawMemberTable(res.memberList);
      drawPagination(res.pi, searchMember);
    }, 
    error: function() {
      console.log("회원 검색 api 호출 실패");
    }

  })
}


// 회원테이블 그려주는 함수
function drawMemberTable(res) {
  const memberList = res;
  const memberTableTbody = document.querySelector('#member-table tbody');
  memberTableTbody.innerHTML = "";

  memberList.forEach(member => {
    const newRow = `
          <tr class="member-tr">
            <input type="hidden" class="member-no" value="`+member.memberNo+`">
            <td align="center">
                <input type="checkbox" class="check-member">
            </td>
            <td align="center" class="member-email">` + member.memberEmail + `</td>
            <td align="center" class="member-nickname">` + member.nickname + `</td>
            <td align="center" class="member-enroll-date">` + formattingDate(member.memberEnrollDate) + `</td>
            <td align="center" class="member-status">` + member.memberStatus + `</td>
          </tr>`;
    memberTableTbody.innerHTML += newRow;
  });
}

// 날짜 포맷팅 함수
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

// 회원 삭제 함수
function updateMember() {
  let memberNoList = getMemberNo();

  if(memberNoList.length === 0) {
    alert("회원을 선택해주세요.");
    return;
  }

  const result = confirm("정말로 회원상태를 변경하시겠습니까?");

  if(result) {
    $.ajax({
      url: "update-status.me",
      type: "post",
      contentType: "application/json",
      data : JSON.stringify(memberNoList),
      success: function(res) {
        if(res === "done") {
          alert("회원상태를 성공적으로 변경하였습니다.");
          window.location.href = window.location.href;
        } else {
          alert("회원상태 변경을 실패하였습니다.")
        }
      }, 
      error: function() {
        console.log("회원 탈퇴 api 호출 실패");
      }
    })
  }
}

// 회원번호 가져오는 함수
function getMemberNo() {
  const checkedCheckboxes = document.querySelectorAll('.check-member:checked');

  let memberNoList = [];

  checkedCheckboxes.forEach(checkedCheckbox => {
    const memberTr = checkedCheckbox.closest('.member-tr');
    const memberNo = parseInt(memberTr.querySelector('.member-no').value);

    memberNoList.push(memberNo);
  });

  return memberNoList;
}
