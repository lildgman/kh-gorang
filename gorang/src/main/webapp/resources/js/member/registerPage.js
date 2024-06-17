$(function(){
    new PhoneAuthentication();
})

document.addEventListener('DOMContentLoaded', function(){
    // 로고 클릭 시 메인페이지로 이동
    document.querySelector("#gorang-logo").addEventListener("click", function(){
        location.href = (ctx);
    })
    // 이용약관 관련 메소드들 실행
    setTermSection();

    document.querySelector("input[name='memberEmail']").addEventListener('blur', validateEmail);
})

// ==================== 공통, 유틸리티 =========================
const ctx = sessionStorage.getItem("contextpath");


// ============== 핸드폰 번호 입력 ==========================
// 휴대폰 인증 class
class PhoneAuthentication{
    constructor(){
        this.isSend = false; // 인증번호 전송 여부
        this.authNo = ''; // 인증번호
        this.timerId = null; //타이머
        this.timer = $('.timer>h4'); // 타이머 ui
        // input 창 한 쪽에 나타나게 하면 어떨까?

        this.input = $("input[name='phone-authNo']");// 인증번호 input

        this.sendBtn = $('#member-auth-btn'); // 인증번호 전송 버튼
        this.authBtn = $('#member-phone-auth-btn'); // 인증번호 체크 버튼

        this.sendBtn.on('click',()=>{
            console.log("클릭");
            this.sendAuthNum();
        });

        this.authBtn.on('click', ()=>{
            this.checkAuthNum();
        });
    }

    sendAuthNum(){
        if(this.isSend){
            const result = confirm('재전송 하시겠습니까?');
            if(!result){ // 재전송 거절 시
                return;
            } else {
                clearInterval(this.timerId); // 호출 스케쥴링(일정 시간 간격 두고 함수 실행)
            }
        }


        // 랜덤번호 생성
        this.authNo = Math.floor(Math.random() * 100000).toString().padStart(6, '0');
        const phone = document.querySelector("input[name='memberPhone']").value;

        $('#phoneAuthSection').css('display','flex');

        sendPhoneAuthNoAjax({authNo: this.authNo, phone: phone}, res => {
            if(res === "success"){
                console.log("전송 성공");
                console.log("인증번호 : " + this.authNo);
                console.log("전송한 휴대폰 번호 : " + phone);

                this.timer.css("color", "red");
                this.authBtn.prop('disabled', false);
                this.input.prop('readonly', false).val('').focus();

                this.isSend = true;
                this.startTimer(181); // 3분 타이머 시작
            } else {
                alert('전송 실패');
                this.authNo = '';
            }
        });

    };

    checkAuthNum(){
        const inputCode = this.input.val();
        if(this.authNo !== inputCode){
            alert("잘못된 인증번호입니다.");
        }else {
            this.sendBtn.prop('disabled', true);
            $('#phone1').prop('readonly', true);
            $('#phone2').prop('readonly', true);

            alert('인증성공');
            clearInterval(this.timerId);

            this.input.prop('readonly', true);            
            this.timer.css("color", "#4aa500");
            this.isSend = false;
            this.authBtn.prop('disabled', true);
        };
    };

    startTimer(duration){
        let timeLeft = duration;
        this.timerId =  setInterval(() => {
            if(timeLeft <= 0){
                clearInterval(this.timerId);
                alert("인증시간 초과. 다시 인증해주세요.");
                this.timer.text("3:01");
                this.authBtn.prop('disabled', true);
                this.authNo = "";
            } else {
                timeLeft --;
                let minutes = Math.floor(timeLeft/60);
                let seconds = timeLeft % 60;
                this.timer.text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
            }
        }, 1000); // 1초마다
    }
};

// 휴대폰 인증 관련 ajax 함수
function sendPhoneAuthNoAjax(data, callback){
    $.ajax({
        url:'authPhone.me',
        type: 'post',
        data,
        success: res => callback(res),
        error: () => {
            alert('휴대폰 인증번호 전송 실패');
        }
    });
};


// ==================================== 이용약관 ====================================

function setTermSection(){
    ////전체 동의
    document.getElementById("select-all").addEventListener('change', handlerAllCheckboxChange);
}

/** 전체 동의 체크 시 전체 체크박스 체크해주는 메소드 */
function handlerAllCheckboxChange(){
    const allChecked = this.checked;
    document.querySelectorAll(".list input[type='checkbox']").forEach(checkbox => {
        checkbox.checked = allChecked;
    })
}




window.onload = function(){
 

    const form = document.getElementById("register-form");
    form.addEventListener("submit", function(event) {
        // Prevent the form from submitting until validation is done
        event.preventDefault();
        // Check all validation rules
        if (validateForm()) {
            form.submit();
        }
    });

    const addressSearchPostcode = document.querySelector("#addressSearch > button");
    addressSearchPostcode.addEventListener("click", function(){
        inputAddress();
    });

    const idCheckBtn = document.querySelector("#idCheck");
    idCheckBtn.onclick = function(ev){
        checkEmail(ev);
    };

    const emailInput = document.querySelector("input[type='email']");
    emailInput.addEventListener("input", function() {
        idCheckBtn.value = "중복확인";
        idCheckBtn.style.pointerEvents = "auto";
        idCheckBtn.style.border = "solid 2px #1E90FF";
        idCheckBtn.style.background = "#ffffff";
        idCheckBtn.style.color = "#1E90FF";
    });

    const nameCheckBtn = document.querySelector("#nameCheck");
    nameCheckBtn.onclick = function(ev){
        checkNickname(ev);
    };

    document.querySelector("input[name='nickname']").addEventListener("input", function(){
        nameCheckBtn.value = "중복확인";
        nameCheckBtn.style.pointerEvents = "auto";
        nameCheckBtn.style.border = "solid 2px #1E90FF";
        nameCheckBtn.style.background = "#ffffff";
        nameCheckBtn.style.color = "#1E90FF";
    });


    console.log("Naver User Info:", naverUserInfo);

    if (typeof naverUserInfo !== 'undefined') {
        console.log("Naver User Info:", naverUserInfo);

        if (naverUserInfo.email) {
            document.querySelector("input[name='memberEmail']").value = naverUserInfo.email;
        }
        if (naverUserInfo.mobile) {
            document.querySelector("input[name='memberPhone']").value = naverUserInfo.mobile.replace(/-/g, '');
        }
        if (naverUserInfo.birthyear && naverUserInfo.birthday) {
            const birthdate = `${naverUserInfo.birthyear}-${naverUserInfo.birthday}`;
            document.querySelector("input[name='birth']").value = birthdate;
        }
        if (naverUserInfo.gender) {
            document.querySelector(`input[name='gender'][value='${naverUserInfo.gender === 'M' ? 'M' : 'F'}']`).checked = true;
        }
        if (naverUserInfo.profile_image) {
            document.querySelector("#profileImage").value = naverUserInfo.profile_image;
        }
    };
}

function validateForm() {
    const emailInput = document.querySelector("input[type='email']");
    const password = document.querySelector("input[type='password'][placeholder='비밀번호를 입력해주세요.']");
    const confirmPassword = document.querySelector("input[type='password'][placeholder='비밀번호를 한번 더 입력해주세요.']");
    const nickname = document.querySelector("input[type='text'][placeholder='닉네임을 입력해주세요.']");
    const phoneNumber = document.querySelector("input[type='tel'][placeholder='전화번호를 입력해주세요.']");
    const birthdate = document.querySelector("input[type='date'][placeholder='YYYYMMDD']");
    const terms = document.querySelector("input[type='checkbox']:not(#select-all)");

    const isTrue =  false;

    // Validate email
    if (validateEmail(emailInput.value)) {
        isTrue = true;
    }

    // Validate password
    if (password.value.length < 6) {
        alert("비밀번호는 6자 이상이어야 합니다.");
        password.focus();
        return false;
    }

    // Validate confirm password
    if (password.value !== confirmPassword.value) {
        alert("비밀번호가 일치하지 않습니다.");
        confirmPassword.focus();
        return false;
    }

    // Validate nickname
    if (nickname.value.trim() === "") {
        alert("닉네임을 입력해주세요.");
        nickname.focus();
        return false;
    }

    // Validate phone number
    if (!validatePhoneNumber(phoneNumber.value)) {
        alert("올바른 전화번호를 입력해주세요.");
        phoneNumber.focus();
        return false;
    }

    // Validate birthdate
    if (!validateBirthdate(birthdate.value)) {
        alert("올바른 생년월일을 입력해주세요.");
        birthdate.focus();
        return false;
    }

    // Validate terms and conditions
    if (!terms.checked) {
        alert("이용약관에 동의해주세요.");
        terms.focus();
        return false;
    }

    // If all validations pass
    return true;
}

// 이메일 유효성 검증
function validateEmail() {
    let email = this.value;
    const isTrue = false;
    const emailNotice = document.querySelector("#register-input-email > .regi-notice-wrapper");
    if(email.trim() !== ""){
        console.log("통과1");
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(re.test(email)){
            console.log("통과3");
            emailNotice.innerHTML = "";
            checkEmail(emailNotice);
        } else {
            console.log("통과2");
            emailNotice.innerHTML = `<span class="regi-notice email-form">잘못된 이메일 형식입니다.</span>`;
        }
    } else {
        emailNotice.innerHTML = `<span class="regi-notice email-empty">이메일을 입력해주세요.</span>`;
    }
    return isTrue;
}

/** 이메일 중복확인 검증하는 메소드 */
function checkEmail(emailNotice){
    // 중복확인 버튼 활성화
    const emailCheckBtn = document.querySelector("#idCheck");
    emailCheckBtn.style.pointerEvents = "auto";
    emailCheckBtn.addEventListener('click', ev => handlercheckEmailClick(ev));
}

/** 중복확인 버튼 클릭 시 메소드 실행 */
function handlercheckEmailClick(ev){
    const idEmail = document.querySelector("input[name='memberEmail']").value;
    if(ev.target.value !== "사용 가능"){
        $.ajax({
            url: "idCheck.me",
            data: {checkId : idEmail},
            success: function(result){
                if(result === "NNNNN"){ // 중복 시
                    emailNotice.innerHTML = `<span class="regi-notice email-id">이미 가입한 이메일입니다.</span>`; 
                }else{ //사용 가능 시
                    ev.target.value = "사용 가능";
                    ev.target.style.pointerEvents = "none";
                    ev.target.style.background = "#1e90ff";
                    ev.target.style.color = "#ffffff";
                }
            },
            error: function(){
                console.log("아이디 중복체크 실패");
            }
        });
    }
}


function validatePhoneNumber(phoneNumber) {
    const re = /^[0-9]{10,11}$/;
    return re.test(phoneNumber);
}

function validateBirthdate(birthdate) {
    // 정규 표현식으로 형식 검사를 먼저 합니다 (YYYY-MM-DD)
    const regex = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;
    if (!regex.test(birthdate)) {
        return false;
    }

    // 날짜 유효성을 검사합니다
    const [year, month, day] = birthdate.split('-').map(Number);
    const date = new Date(year, month - 1, day); // month는 0부터 시작하므로 -1을 해줍니다

    // 유효한 날짜인지 확인합니다
    return (
        date.getFullYear() === year &&
        date.getMonth() === month - 1 &&
        date.getDate() === day
    );
}

function inputAddress(){
    // 버튼 없애고 새로운 input 창들 생성 후 위 메소드의 결과값 띄우기
    let addressSection = document.querySelector("#registAddressSection");
    addressSection.removeChild(document.getElementById("addressSearch"));

    let searchResult = document.createElement('div');
    addressSection.appendChild(searchResult);
    searchResult.setAttribute("id", "address-search-result");

    // 우편번호
    let searchResultPostcode = document.createElement('input');
    searchResult.appendChild(searchResultPostcode);
    searchResultPostcode.setAttribute("class", "register-input");
    searchResultPostcode.setAttribute("id", "sample6_postcode");
    searchResultPostcode.setAttribute("style", "width: 160px");

    // 주소
    let searchResultAddress = document.createElement('input');
    searchResult.appendChild(searchResultAddress);
    searchResultAddress.setAttribute("class", "register-input");
    searchResultAddress.setAttribute("id", "sample6_address");

    // 상세 주소
    let searchResultAddressDetail = document.createElement('input');
    searchResult.appendChild(searchResultAddressDetail);
    searchResultAddressDetail.setAttribute("class", "register-input");
    searchResultAddressDetail.setAttribute("id", "sample6_detailAddress");
    searchResultAddressDetail.setAttribute("type", "text");
    searchResultAddressDetail.setAttribute("placeholder", "상세 주소를 입력해주세요");

    searchResult.innerHTML += `<div class="regi-notice-wrapper">
                                    <span class="regi-notice address-empty">상세주소를 입력해주세요.</span>
                              </div>`


    let totalAddress = document.createElement('input');
    searchResult.appendChild(totalAddress);
    totalAddress.setAttribute("type", "hidden");
    totalAddress.setAttribute("name", "memberAddress");
    totalAddress.setAttribute("id", "totalAddress");

    sample6_execDaumPostcode();

    //주소와 상세주소 합침
    searchResultAddressDetail.addEventListener("input", function() {
        totalAddress.value = searchResultAddress.value + " " + searchResultAddressDetail.value;
    }); 
}


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();

            // 주소와 상세주소 합치기
            document.getElementById("totalAddress").value = addr + " " + document.getElementById("sample6_detailAddress").value;
        }
    }).open();
}


function checkNickname(ev){
    const nickname = document.querySelector("input[name='nickname']").value;
    if(ev.target.value !== "사용 가능"){
        $.ajax({
            url: "nameCheck.me",
            data: {checkName : nickname},
            success: function(result){
                if(result === "NNNNN"){ // 중복 시
                    alert("이미 사용중인 닉네임입니다.");   
                }else{ //사용 가능 시
                    ev.target.value = "사용 가능";
                    ev.target.style.pointerEvents = "none";
                    ev.target.style.background = "#1e90ff";
                    ev.target.style.color = "#ffffff";
                }
            },
            error: function(){
                console.log("닉네임 중복체크 실패");
            }
        });
    }
}