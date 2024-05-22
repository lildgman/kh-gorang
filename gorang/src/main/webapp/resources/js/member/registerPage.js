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

    function validateForm() {
        const email = document.querySelector("input[type='email']");
        const password = document.querySelector("input[type='text'][placeholder='비밀번호를 입력해주세요.']");
        const confirmPassword = document.querySelector("input[type='text'][placeholder='비밀번호를 한번 더 입력해주세요.']");
        const nickname = document.querySelector("input[type='text'][placeholder='닉네임을 입력해주세요.']");
        const phoneNumber = document.querySelector("input[type='number'][placeholder='전화번호를 입력해주세요.']");
        const birthdate = document.querySelector("input[type='number'][placeholder='YYYYMMDD']");
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
        const re = /^[0-9]{8}$/;
        if (!re.test(birthdate)) {
            return false;
        }

        const year = parseInt(birthdate.substring(0, 4), 10);
        const month = parseInt(birthdate.substring(4, 6), 10);
        const day = parseInt(birthdate.substring(6, 8), 10);

        if (month < 1 || month > 12 || day < 1 || day > 31) {
            return false;
        }

        const date = new Date(year, month - 1, day);
        return date && date.getMonth() + 1 === month && date.getDate() === day;
    }
});
