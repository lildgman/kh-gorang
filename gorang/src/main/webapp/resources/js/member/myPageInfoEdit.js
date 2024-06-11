
// 새 비밀번호와 새 비밀번호 재입력한 부분이 일치하는지 확인하기위한 변수
let matchPassword = false;
// 새 아이디가 중복되는지 확인하기위한 변수
let checkNickname = false;
// 새 전화번호가 중복되는지 확인하기 위한 변수
let checkPhoneNumber = false;


function changeMemberImg() {
  const fileInput = document.getElementById('file-input');
  fileInput.click();
}

function displaySelectedImage(element) {

  const userProfileDiv = document.querySelector('#userProfile');

  element.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        userProfileDiv.innerHTML = ""
        userProfileDiv.innerHTML = `<img id="user-profile-img" src="${e.target.result}" alt="Selected Image">`;
      };
      reader.readAsDataURL(file);
    }
  });
}

function validPassword(element) {
  const newPassword = document.querySelector('#new-password').value;
  let resultDiv = document.querySelector('#valid-password-result');
  let validNewPassword = element.value;

  if(newPassword === validNewPassword) {
    matchPassword = true;
    
    resultDiv.innerText = "비밀번호가 일치합니다."
    resultDiv.style.display = 'block';
    resultDiv.classList.remove('wrong');
    resultDiv.classList.add('match');

  } else {
    matchPassword = false;

    resultDiv.innerText = "비밀번호가 일치하지 않습니다."
    resultDiv.style.display = 'block';
    resultDiv.classList.remove('match');
    resultDiv.classList.add('wrong');
  }
}

function submitMemberInfo() {
  const updateMemberInfoForm = document.querySelector('#update-member-info-form');
  if (matchPassword && checkNickname && checkPhoneNumber) {
    updateMemberInfoForm.submit();
  } else {
      // matchPassword가 false일 때 비밀번호가 일치하지 않음을 알림
      if (!matchPassword) {
          alert('비밀번호를 다시 확인해주세요.');
          return;
      }

      // checkNickname가 false일 때 닉네임이 일치하지 않음을 알림
      if (!checkNickname) {
          alert('닉네임이 중복되는지 확인해주세요.');
          return;
      }

      // checkPhoneNumber가 false일 때 전화번호가 일치하지 않음을 알림
      if (!checkPhoneNumber) {
          alert('전화번호가 중복되는지 확인해주세요.  ');
          return;
      }
  }
}

function validNickname() {
  const newNickname = document.querySelector('#new-nickname').value;
  $.ajax({
    url: 'check-nickname.me',
    type: 'get',
    data : {
      nickname : newNickname
    },
    success: function(res) {
      if(res === 'dup') {
        alert('중복된 닉네임 입니다.');
        checkNickname = false;
      } else {
        alert('사용 가능한 닉네임 입니다.');
        checkNickname = true;
      }
    },
    error: function() {
      console.log("회원 닉네임 중복체크 api 호출 실패");
    }
  })
}

function validPhoneNumber() {
  const newPhoneNumber = document.querySelector('#new-phone-number').value;

  const isValid =  /^\d{1,11}$/.test(newPhoneNumber.trim());

  if(!isValid) {
    alert("11자리 이하로 숫자만 입력해주세요");
  } else {
    $.ajax({
      url: 'check-phone.me',
      type: 'get',
      data: {
        memberPhone : newPhoneNumber
      },
      success: function(res) {
        if(res === 'dup') {
          alert('중복된 전화번호가 있습니다.');
          checkPhoneNumber = false;
        } else {
          alert('사용 가능한 전화번호 입니다.');
          checkPhoneNumber = true;
        }
      },
      error: function() {
        console.log("회원 전화번호 중복체크 api 호출 실패");
      }
    })
  }
}

