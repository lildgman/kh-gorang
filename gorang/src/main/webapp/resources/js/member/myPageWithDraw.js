let isMatchedPwd = false;

function validatePwd(element) {
  const validPwd = element.value;
  $.ajax({
    url:'check-pwd.me',
    type: 'get',
    data: {
      validPwd : validPwd
    },
    success: function(res) {
      const resultMsgDiv = document.querySelector('#result-msg');
      if(res === 'mismatched') {
        resultMsgDiv.innerHTML = "";
        resultMsgDiv.innerHTML = "*입력하신 비밀번호가 기존 비밀번호와 일치하지 않습니다.";
        isMatchedPwd = false;
      } else {
        resultMsgDiv.innerHTML = "";
        isMatchedPwd = true;
      }
    },
    error: function() {
      console.log('비밀번호 조회 api 호출 실패');
    }
  })
}

function showSweetConfirm() {
  const checkPwd = document.querySelector('#input_pwd').value;
  const loginUserNo = document.querySelector('#login-user-number').value;

  if(checkPwd === '') {
    Swal.fire(
      '비밀번호를 입력해주세요!'
    );
    return;
  }

  if(!isMatchedPwd) {
    Swal.fire(
      '입력하신 비밀번호가 기존 비밀번호와 일치하지 않습니다.'
    );
    return;
  }

  Swal.fire({
      title: '정말 탈퇴하시겠습니까?',
      text: "이 작업은 되돌릴 수 없습니다!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: '확인',
      cancelButtonText: '취소'
  }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: 'delete-member.me',
          type: 'post',
          data: {
            loginUserNo: loginUserNo
          },
          success: function(res) {
            if(res==='done') {
              Swal.fire(
                '탈퇴 완료!',
                '탈퇴가 완료되었습니다.',
                'success'
              ).then(() => {
                window.location.href = "/gorang";
              });
            } else {
              Swal.fire(
                '탈퇴 실패!',
                '탈퇴가 실패하였습니다.',
                'error'
              );
            }

          },
          error: function() {
            console.log("회원탈퇴 api 호출 실패");
          }

        })

        
          
          // 탈퇴 처리 코드 여기에 추가
      } else if (result.dismiss === Swal.DismissReason.cancel) {
          Swal.fire(
              '취소됨',
              '탈퇴가 취소되었습니다.',
              'error'
          );
      }
  });
}