// 검색한 회원 조회 함수
function searchMember() {
  const searchMemberValue = document.querySelector('#search-member-input').value;

  $.ajax({
    url: 'search-member.ma',
    type: 'get',
    data: {
      searchMember: searchMemberValue
    },
    success: function(res) {
      drawMemberTable(res);
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
function deleteMember() {
  let memberNoList = getMemberNo();

  const result = confirm("정말로 회원탈퇴 처리를 하시겠습니까?");

  if(result) {
    $.ajax({
      url: "delete-member.ma",
      type: "post",
      contentType: "application/json",
      data : JSON.stringify(memberNoList),
      success: function(res) {
        if(res === "done") {
          alert("회원탈퇴처리를 성공적으로 처리하였습니다.");
          window.location.href = window.location.href;
        } else {
          alert("회원탈퇴처리를 실패하였습니다.")
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
