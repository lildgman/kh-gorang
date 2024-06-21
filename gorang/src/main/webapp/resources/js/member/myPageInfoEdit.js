// 새로 입력한 비밀번호가 8자리 이상인지
let validPwdLength = false;
// 새 비밀번호와 새 비밀번호 재입력한 부분이 일치하는지 확인하기위한 변수
let matchPassword = false;

// 닉네임 바꼈는지?
let isChangeNicknameType = true;
// 닉네임 중복확인 했는지?
let validNickNameType = true;

// 전화번호 변경했는지?
let isChangePhoneNumType = true;
let validPhoneNumType = true;

console.log()


window.onload = function() {
  setUserProfileImg ();

}

// 닉네임 변경시 isChangeNickname false로 바꿔줌
function ischangeNickname() {
  isChangeNicknameType = false;
}

// 전화번호 변경 시 isChangePhoneNum false로 변경
function isChangePhoneNum() {
  isChangePhoneNumType = false;
}


function setUserProfileImg (){
  const profileImgSrc = document.querySelector('#user-profile-img').src;

  fetch(profileImgSrc)
  .then(response => response.blob())
  .then(blob => {
      let file = new File([blob], 'current_user_profile.jpg', { type: 'image/jpeg' });

      let dataTransfer = new DataTransfer();
      dataTransfer.items.add(file);

      let fileInput = document.querySelector('#file-input');
      fileInput.files = dataTransfer.files;

      console.log(fileInput.files);
  })
  .catch(error => console.error('Error:', error));
}



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
  if (matchPassword&&validPwdLength&&isChangeNicknameType&&validNickNameType&&isChangePhoneNumType&&validPhoneNumType) {
    updateMemberInfoForm.submit();
  } else {
      // matchPassword가 false일 때 비밀번호가 일치하지 않음을 알림
      if (!matchPassword || !validPwdLength) {
          alert('비밀번호를 다시 확인해주세요.');
          return;
      } 

      if(!isChangeNicknameType) {
        alert('닉네임을 중복확인 해주세요');
        return;
      }

      if(!isChangePhoneNumType) {
        alert("전화번호 중복확인을 해주세요");
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
        validNickNameType = false;

      } else {
        alert('사용 가능한 닉네임 입니다.');
        isChangeNicknameType = true;
        validNickNameType = true;
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
          validPhoneNumType = false;
        } else {
          alert('사용 가능한 전화번호 입니다.');
          isChangePhoneNumType = true;
          validPhoneNumType = true;
        }
      },
      error: function() {
        console.log("회원 전화번호 중복체크 api 호출 실패");
      }
    })
  }
}

function checkPwdLength(element) {
  const password = element.value;
  const checkPasswordLength = document.querySelector('#check-password-length');
  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

  if(password.length > 0 && !regex.test(password)) {
    checkPasswordLength.innerHTML = "";
    checkPasswordLength.innerHTML = "영문, 숫자를 포함한 8자리 이상의 비밀번호를 입력해주세요.";
    checkPasswordLength.style.display = 'block';
    checkPasswordLength.style.color = 'red';
    
  } else {
    checkPasswordLength.innerHTML = "";
    checkPasswordLength.style.display = 'none';

    validPwdLength = true;
  }
}