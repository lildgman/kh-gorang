document.write('<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>')

document.addEventListener("DOMContentLoaded", function() {

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

    addressSearchPostcode.addEventListener("click", function(event){
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
    });

});

function validateForm() {
    const email = document.querySelector("input[type='email']");
    const password = document.querySelector("input[type='password'][placeholder='비밀번호를 입력해주세요.']");
    const confirmPassword = document.querySelector("input[type='password'][placeholder='비밀번호를 한번 더 입력해주세요.']");
    const nickname = document.querySelector("input[type='text'][placeholder='닉네임을 입력해주세요.']");
    const phoneNumber = document.querySelector("input[type='tel'][placeholder='전화번호를 입력해주세요.']");
    const birthdate = document.querySelector("input[type='date'][placeholder='YYYYMMDD']");
    const terms = document.querySelector("input[type='checkbox']:not(.select-all)");

    // Validate email
    if (!validateEmail(email.value)) {
        alert("올바른 이메일을 입력해주세요.");
        email.focus();
        return false;
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

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
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
