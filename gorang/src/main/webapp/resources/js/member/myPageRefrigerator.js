document.addEventListener("DOMContentLoaded", function () {
    
    const ctp = getContextPath();

    setPaginationEventListeners();

    setRecipeModalPaginationEventListeners();

    constructRecommendedRecipeDiv();

    // ================================== 유틸리티, 공통  메소드 =======================
    
    /** 헤더에서 세션에 넣은 contextPath 값 리턴하는 함수 */
    function getContextPath() {
        return sessionStorage.getItem("contextpath");
    }


     /** ajax로 받아온 pi 객체를 이용해 페이지네이션 업데이트 해주는 메소드 */
     function updatePagination(ev, pi) {
        const pagination = ev.querySelector(".pagination");
        pagination.innerHTML = "";

        if (pi.currentPage > 1) {
            const prevLink = document.createElement('a');
            prevLink.setAttribute('data-value', pi.currentPage - 1);
            prevLink.innerHTML = '&lt;';
            pagination.appendChild(prevLink);
        }

        for (let p = pi.startPage; p <= pi.endPage; p++) {
            const pageLink = document.createElement('a');
            pageLink.setAttribute('data-value', p);
            pageLink.innerHTML = p;
            if(p == parseInt(pi.currentPage)){
                pageLink.innerHTML = `<strong>${p}</strong>`
            }
            pagination.appendChild(pageLink)
        }

        if (pi.currentPage < pi.maxPage) {
            const nextLink = document.createElement('a');
            nextLink.setAttribute('data-value', pi.currentPage + 1);
            nextLink.innerHTML = '&gt;';
            pagination.appendChild(nextLink);
        }

        // 새로 생성된 링크에 이벤트 리스너 추가
        switch(ev){
            case document.querySelector("#pagination-area"):
                setPaginationEventListeners();
                break;
            case document.querySelector("#ingre-modal-pagination"):
                setIngreModalPaginationEventListeners();
                break;
            case document.querySelector("#modal-recipe-pagination"):
                setRecipeModalPaginationEventListeners();
        }        
    }       


    // =================================== 나의 냉장고 식재료 테이블 관련 메소드 ================================
    
    const refriMainTbody = document.querySelector("#myRefrigerator-table-tbody");
    
    /** 냉장고 페이지바 a 태그에 클릭 이벤트 넣어주는 메소드 */
    function setPaginationEventListeners() {
        const refriPaginationArea = document.querySelector("#pagination-area");
        refriPaginationArea.querySelectorAll(".pagination a").forEach(function(ev){
            ev.addEventListener("click", function(el){
                let cpage = el.currentTarget.getAttribute('data-value');
                // 나의 냉장고 페이지의 냉장고 식재료 테이블일 경우 mid 숫자 1 함께 보냄
                getRefriInfoByAjax(parseInt(cpage), 1);
            });
        });
    }

    /** 데이터를 받아서 나의 냉장고 식재료 테이블 구축해주는  메소드*/
    function constructRefriTable(refriIngresList, refriTbody){
        refriTbody.innerHTML = "";
        for(let refriIngre of refriIngresList){
            let refriTbodyTr = document.createElement('tr');
            refriTbody.appendChild(refriTbodyTr);
            refriTbodyTr.setAttribute("class", "tr-block");
            // 이미지 td
            const refriIngreTd1 = document.createElement('td');
            refriIngreTd1.setAttribute("class", "myRefrigerator-tr");
            refriTbodyTr.appendChild(refriIngreTd1);
            const refriIngreImg = document.createElement('img');
            refriIngreImg.setAttribute("style", "height: 50px;");
            refriIngreImg.setAttribute("src", ctp + "/resources/images/member-img/Rectangle 18311 (2).png");
            refriIngreTd1.appendChild(refriIngreImg);
            // 식재료명 td
            const refriIngreTd2 = document.createElement('td');
            refriIngreTd2.setAttribute("class", "refri-main-td-refName");
            refriIngreTd2.setAttribute("data-value", refriIngre.refNo);
            refriIngreTd2.innerHTML = refriIngre.refName;
            refriTbodyTr.appendChild(refriIngreTd2);
            // 신선도 td
            const refriIngreTd3 = document.createElement('td');
            refriIngreTd3.setAttribute("class", "flesh-area");
            refriTbodyTr.appendChild(refriIngreTd3);
            // 신선도 div
            const freshDiv = document.createElement('div');
            freshDiv.setAttribute("class", "flesh-status");
            if(refriIngre.daysDifference <= 3){ // 위험
                freshDiv.setAttribute("style", "background-color:#F20E2B;");
                refriIngreTd3.innerHTML = "위험"
            } else if(refriIngre.daysDifference > 3 && refriIngre.daysDifference <= 7){ // 보통
                freshDiv.setAttribute("style", "background-color:#FFE28A;");
                refriIngreTd3.innerHTML = "보통"
            } else { // 신선
                freshDiv.setAttribute("style", "background-color:#7ADC66;");
                refriIngreTd3.innerHTML = "신선"
            }
            refriIngreTd3.appendChild(freshDiv);
            // 소비기한 td
            const refriIngreTd4 = document.createElement('td');
            refriIngreTd4.innerHTML = refriIngre.refConsumptionDate;
            refriTbodyTr.appendChild(refriIngreTd4);
            // 입고일 td
            const refriIngreTd5 = document.createElement('td');
            refriIngreTd5.innerHTML = refriIngre.refInputDate;
            refriTbodyTr.appendChild(refriIngreTd5);
            // 갯수 td
            const refriIngreTd6 = document.createElement('td');
            refriIngreTd6.innerHTML = refriIngre.refCount;
            refriTbodyTr.appendChild(refriIngreTd6);
            // 삭제 td
            const refriIngreTd7 = document.createElement('td');
            refriIngreTd7.innerHTML = `<input type="checkbox" class="refri-main-delete-checkBox">`
            refriTbodyTr.appendChild(refriIngreTd7);
        }
    }

    /** ajax 로 currentPage 보내서 RowBounds 된 List<refrigerator> 값 받아온 후 뿌려주는 메소드*/
    function getRefriInfoByAjax(data, mid){
        $.ajax({
            url: "selectRefriAjax.me",
            data: { cpage: data },
            success: function(res){
                const refriIngresList = res.refriIngres;
                let paginationArea = "";

                if(mid == 1){ // 나의 냉장고 식재료 테이블 관련 요청일 경우
                    const refriTbody = document.querySelector("#myRefrigerator-table-tbody");
                    constructRefriTable(refriIngresList, refriTbody)
                    paginationArea = document.querySelector("#pagination-area");
                } else if(mid == 2){
                    const modalRecipeTbody = document.querySelector("#modal-recipe-tbody");
                    constructModalRecipeTable(refriIngresList, modalRecipeTbody);
                    paginationArea = document.querySelector("#modal-recipe-pagination");
                }

                // 페이지네이션 갱신
                updatePagination(paginationArea, res.pi);
            },
            error: function(){
                console.log("송신 실패");
            }
        })
    }

    const refriMainAllCheckBox = document.querySelector("#refri-main-delete-allCheckBox");
     /** th 체크 버튼 클릭 시 모든 td 체크되는 이벤트 */
    if(refriMainAllCheckBox){
        refriMainAllCheckBox.addEventListener('change', function(){
            refriMainTbody.querySelectorAll(".tr-block").forEach(tr => {
                let checkBox = tr.querySelector("td input[type='checkbox']");
                checkBox.checked = refriMainAllCheckBox.checked;
            })
        })
    }
   

    /** 삭제하기 버튼 클릭 시 ajax 통해 db에서 식재료 삭제하는 이벤트 */
    document.querySelector("#refreDeleteBtn").addEventListener('click', function(){
        // 삭제할 식재료 데이터 담을 배열 선언
        const ingresFordelete = [];
        // td 체크 박스에 체크된 데이터 파악
        refriMainTbody.querySelectorAll(".tr-block").forEach(tr => {
            let checkBox = tr.querySelector("td input[type='checkbox']");
            if(checkBox.checked){
                const refNo = parseInt(tr.querySelector(".refri-main-td-refName").getAttribute("data-value"));
                ingresFordelete.push(refNo);
            }
        })

        console.log(ingresFordelete);

        $.ajax({
            url: "deleteRefriIngre.me",
            data: {refriNums: JSON.stringify(ingresFordelete)},
            success: function(res){
                console.log("송신 성공");
                if(res == "success"){
                    location.reload();
                }
            },
            error: function(){
                console.log("송신 실패");
            }
        })
    })


    // =================================== 식재료 추가 모달 관련 메소드 ==========================================

    // 모달 요소
    const modalIngre = document.querySelector("#myModal-two");
    // 테이블 tbody
    const ingreModalTbody = document.querySelector("#modal-ingre-tbody");

    document.querySelector("#viewModalBtn-two").addEventListener("click", function () {
        viewModal2();
    })

    // 식재료 추가 모달 검색 버튼 클릭 시 이벤트 
    document.querySelector("#find-nutri-btn").addEventListener("click", function () {
        findSearch2();
    })


    // 이벤트 위임을 사용하여 동적으로 생성된 요소에도 이벤트 리스너를 적용
    document.querySelector("#modal-ingre-tbody").addEventListener("change", function (event) {
        if (event.target.type === 'checkbox') {
            const checkbox = event.target;
            const tr = checkbox.closest("tr");
            console.log("체크됨");
            if (checkbox.checked) {
                tr.querySelectorAll(".direct-input").forEach(function (el) {
                    el.style.display = 'inline';
                })
            } else {
                tr.querySelectorAll(".direct-input").forEach(function (el) {
                    el.style.display = 'none';
                })
            }
        }
    });

    // 모두 체크
    const ingreModalAllCheck = document.querySelector("#modal-ingre-checkBox");
    ingreModalAllCheck.addEventListener("change", function () {
        document.querySelectorAll(".overflow-tr").forEach(function (ev) {
            let checkbox = ev.querySelector(".td-checkbox input[type='checkbox']");
            checkbox.checked = ingreModalAllCheck.checked;
            if (checkbox.checked) {
                ev.querySelectorAll(".direct-input").forEach(function (el) {
                    el.style.display = 'inline';
                })
            } else {
                ev.querySelectorAll(".direct-input").forEach(function (el) {
                    el.style.display = 'none';
                })
            }
        })
    })

    // 식재료 추가 모달 내 추가하기 버튼 클릭 시 데이터 송신하는 이벤트
    document.querySelector("#addAll-btn2").addEventListener("click", function () {
        sendIngreByAjax();
    })

    // 식재료 추가하기 모달창 표시 / 숨김
    function viewModal2() {
        document.getElementById("myModal-two").style.display = "block";
        // 식재료 추가 모달창 => 체크 박스 클릭시 소비기한표시
        document.getElementById("closeModalBtn2").addEventListener("click", function () {
            ingreModalTbody.innerHTML = "";
            numForInput = 0;
            document.getElementById("myModal-two").style.display = "none";
        });
    }

    // 모달 식재료 추가 검색창
    function findSearch2() {
        getFoodAndNutriAjax(1);
    }


    // 공공데이터 가져오는 ajax
    function getFoodAndNutriAjax(cpage) {
        // 공백제거
        const foodNameVl = document.querySelector("#refri-input-foodName").value.replace(/\s+/g, '');;
        const makerVl = document.querySelector("#refri-input-maker").value.replace(/\s+/g, '');;

        console.log("식품명: ", foodNameVl);

        $.ajax({
            url: "food.me",
            data: {
                foodName: foodNameVl,
                makerName: makerVl,
                cpage: cpage
            },
            success: function (res) {
                // 가져온 식품 데이터 가공
                let foodArr = res.body.items;

                foodArr = foodArr.map(f => {
                    let food = {}
                    for (let key in f) {
                        food[key.trim()] = f[key];
                    }
                    return food;
                })
                let currentPage = res.body.pageNo;

                drawFoodAndNutri(currentPage, foodArr);
                
                // 페이지 처리 위한 pi 변수 생성
                let listCount = res.body.totalCount;
                

                let boardLimit = 10;
                let pageLimit = 10;
                let maxPage = Math.ceil(listCount / boardLimit); // 총 페이지 수
                let startPage = Math.floor((currentPage -1) / pageLimit) * pageLimit + 1; // 페이징바의 시작 
                let endPage = startPage + pageLimit -1; // 페이징 바의 끝 수
                endPage = endPage > maxPage ? maxPage : endPage;

                let pi = {
                    listCount: listCount,
                    currentPage: currentPage,
                    pageLimit: pageLimit,
                    boardLimit: boardLimit,
                    maxPage: maxPage,
                    startPage: startPage,
                    endPage: endPage
                }

                // 페이지바 요소를 담은 상위 요소 호출
                const ingreModalPagination = document.querySelector("#ingre-modal-pagination");
                updatePagination(ingreModalPagination, pi);


            },
            error: function () {
                console.log("송신 실패");
            }
        })
    }

    /**getFoodAndNutriAjax 로 받아온 데이터를 모달에 뿌려주는 메소드 */ 
    function drawFoodAndNutri(currentPage, foodArr) {
        ingreModalTbody.innerHTML = "";

        let temp = 1;

        for (let food of foodArr) {
            let num = ((currentPage - 1) * 10) + temp;
            constructFoodModalTable(ingreModalTbody, num, food);
            temp++;
        }
    }


    /** 식재료 추가 모달의 테이블 만들어주는 메소드 */
    function constructFoodModalTable(ingreModalTbody, num, food) {
        const nutri = {
            servingSize: food.SERVING_SIZE,
            kcal: food.AMT_NUM1,
            protein: food.AMT_NUM3,
            fat: food.AMT_NUM4,
            saluratedFat: food.AMT_NUM23,
            transFat: food.AMT_NUM24,
            carb: food.AMT_NUM6,
            sugar: food.AMT_NUM7,
            sodium: food.AMT_NUM13,
            cholesterol: food.AMT_NUM22
        };

        const foodTabletr = document.createElement('tr');
        foodTabletr.setAttribute("class", "overflow-tr");
        ingreModalTbody.appendChild(foodTabletr);
        // 체크박스
        const foodTableTdCk = document.createElement('td');
        foodTableTdCk.setAttribute("class", "td-checkbox");
        foodTabletr.appendChild(foodTableTdCk);

        const foodTableTdCkInput = document.createElement('input');
        foodTableTdCk.appendChild(foodTableTdCkInput);
        foodTableTdCkInput.setAttribute("class", "row-checkbox");
        foodTableTdCkInput.setAttribute("type", "checkbox");
        // 번호
        const foodTableTd1 = document.createElement('td');
        foodTableTd1.setAttribute("class", "fixed-width1");
        foodTableTd1.innerHTML = num;
        foodTabletr.appendChild(foodTableTd1);
        // 식품명
        const foodTableTd2 = document.createElement('td');
        foodTableTd2.setAttribute("class", "fixed-width2");
        foodTableTd2.innerHTML = food.FOOD_NM_KR;
        foodTabletr.appendChild(foodTableTd2);
        // 대분류
        const foodTd5 = document.createElement('td');
        foodTabletr.appendChild(foodTd5);
        foodTd5.setAttribute("class", "fixed-width5");
        foodTd5.innerHTML = food.FOOD_CAT1_NM;
        // 영양성분
        const foodTableTd3 = document.createElement('td');
        foodTableTd3.setAttribute("class", "fixed-width3");
        foodTabletr.appendChild(foodTableTd3);

        const nutriBtn = document.createElement('button');
        foodTableTd3.appendChild(nutriBtn);
        nutriBtn.setAttribute("class", "seek-ingre-btn");
        nutriBtn.setAttribute("data-toggle", "modal");
        nutriBtn.setAttribute("data-target", "#nutritionModal");
        nutriBtn.innerHTML = "보기";
        // 소비기한
        const foodTableTd4 = document.createElement('td');
        foodTableTd4.setAttribute("class", "fixed-width4");
        foodTableTd4.setAttribute("style", "text-align: left; font-size: 12px");
        foodTabletr.appendChild(foodTableTd4);

        const foodTd4Input = document.createElement('input');
        foodTableTd4.appendChild(foodTd4Input);
        foodTd4Input.setAttribute("class", "direct-input");
        foodTd4Input.setAttribute("type", "text");
        foodTd4Input.setAttribute("name", "refConsumptionDate");
        foodTd4Input.setAttribute("placeholder", "입력: 예시) 20240611");
        foodTd4Input.setAttribute("style", "display: none;");

        // 입고일
        const foodTableTd5 = document.createElement('td');
        foodTableTd5.setAttribute("class", "fixed-width4");
        foodTableTd5.setAttribute("style", "text-align: left; font-size: 12px");
        foodTabletr.appendChild(foodTableTd5);

        const foodTd5Input = document.createElement('input');
        foodTableTd5.appendChild(foodTd5Input);
        foodTd5Input.setAttribute("class", "direct-input");
        foodTd5Input.setAttribute("type", "text");
        foodTd5Input.setAttribute("name", "refInputDate");
        foodTd5Input.setAttribute("placeholder", "입력: 예시) 20240611");
        foodTd5Input.setAttribute("style", "display: none;");

        // 갯수
        const foodTableTd6 = document.createElement('td');
        foodTableTd6.setAttribute("class", "fixed-width4");
        foodTableTd6.setAttribute("style", "text-align: left; font-size: 12px");
        foodTabletr.appendChild(foodTableTd6);

        const foodTd6Input = document.createElement('input');
        foodTableTd6.appendChild(foodTd6Input);
        foodTd6Input.setAttribute("class", "direct-input");
        foodTd6Input.setAttribute("type", "text");
        foodTd6Input.setAttribute("name", "refCount");
        foodTd6Input.setAttribute("placeholder", "입력: 예시) 3");
        foodTd6Input.setAttribute("style", "display: none;");

        nutriBtn.addEventListener("click", function () {
            constructNutriModal(nutri);
        });
    }

    /** 식재료 추가 모달 내 영양성분 보기 클릭 시 영양성분표 모달 만들어주는 메소드 */
    //1일 영양성분 기준치 국가법령정보센터 제6조 제2항 및 제3항 관련 식품 등의 표시, 광고에 관한 시행규칙 참고
    function constructNutriModal(nutri) {
        console.log(nutri);
        const nutriTable = document.querySelector(".nutrition-table");
        if (nutriTable) {
            nutriTable.innerHTML = `
            <thead>
                <tr>
                    <th colspan="3" style="text-align: left">영양성분함량기준량 ${nutri.servingSize}</th>
                </tr>
                <tr>
                    <th>성분명</th>
                    <th>내용</th>
                    <th style="font-size: 10px">1일 영양성분 기준치에 대한 비율</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>열량</td>
                    <td>${nutri.kcal}Kcal</td>
                    <td>${Math.ceil((nutri.kcal / 2000) * 100)}%</td>
                </tr>
                 <tr>
                    <td>나트륨</td>
                    <td>${nutri.sodium}mg</td>
                    <td>${Math.ceil((nutri.sodium / 2000) * 100)}%</td>
                </tr>
                <tr>
                    <td>탄수화물</td>
                    <td>${nutri.carb}g</td>
                    <td>${Math.ceil((nutri.carb / 324) * 100)}%</td>
                </tr>
                <tr>
                    <td>당류</td>
                    <td>${nutri.sugar}g</td>
                    <td>${Math.ceil((nutri.sugar / 100) * 100)}%</td>
                </tr>
                <tr>
                    <td>지방</td>
                    <td>${nutri.fat}g</td>
                    <td>${Math.ceil((nutri.fat / 54) * 100)}%</td>
                </tr>
                <tr>
                    <td>트랜스지방</td>
                    <td>${nutri.transFat}g</td>
                    <td></td>
                </tr>
                <tr>
                    <td>포화지방</td>
                    <td>${nutri.saluratedFat}g</td>
                    <td>${Math.ceil((nutri.saluratedFat / 15) * 100)}%</td>
                </tr>
                <tr>
                    <td>콜레스테롤</td>
                    <td>${nutri.cholesterol}mg</td>
                    <td>${Math.ceil((nutri.saluratedFat / 15) * 100)}%</td>
                </tr>
                <tr>
                    <td>단백질</td>
                    <td>${nutri.protein}g</td>
                    <td>${Math.ceil((nutri.protein / 55) * 100)}%</td>
                </tr>
            </tbody>
            `;
        }
    }


    /** 냉장고 db에 식재료 저장하기 위해 컨트롤러로 보내는 ajax */
    function sendIngreByAjax() {
        const ingreData = [];
        // tbody 요소 가져옴
        const modalIngrediTbody = document.querySelector("#modal-ingre-tbody");
        // tbody 내 tr들 가져옴
        const modalIngrediTrs = modalIngrediTbody.querySelectorAll(".overflow-tr");
        // tr들을 반복문 돌려서 tr 내 데이터 추출
        modalIngrediTrs.forEach(function (modalIngrediTr) {
            // 체크됐을 경우만 가져옴
            let checkbox = modalIngrediTr.querySelector(".td-checkbox input[type='checkbox']");
            if (checkbox.checked) {
                let today = new Date();

                // 두 자리 숫자로 변환하는 함수
                function padToTwoDigits(num) {
                    return num.toString().padStart(2, '0');
                    // padStart(targetLength, padString) 은 문자열의 길이가 targetLength 보다 짧을 시 문자열의 시작 부분에 지정된 padString 추가함
                }

                // 식품명
                const refName = modalIngrediTr.querySelector(".fixed-width2").innerHTML;

                // 소비기한
                let refConsumptionDate = modalIngrediTr.querySelector("input[name='refConsumptionDate']").value;

                // 소비기한 미입력 시 현재 날짜에 7일을 더 해줌
                let refConsumptionDateFormat;
                if (!refConsumptionDate) {
                    today.setDate(today.getDate() + 7);
                    refConsumptionDateFormat = today.getFullYear() + "-" + padToTwoDigits(today.getMonth() + 1) + "-" + padToTwoDigits(today.getDate());
                    today = new Date(); // reset today
                } else {
                    let tempDate = new Date(refConsumptionDate);
                    refConsumptionDateFormat = tempDate.getFullYear() + "-" + padToTwoDigits(tempDate.getMonth() + 1) + "-" + padToTwoDigits(tempDate.getDate());
                }

                // 냉장고 입고일
                let refInputDate = modalIngrediTr.querySelector("input[name='refInputDate']").value;

                // 냉장고 입고일 미기입 시 현재 날짜로 넣어줌
                let refInputDateFormat;
                if (!refInputDate) {
                    refInputDateFormat = today.getFullYear() + "-" + padToTwoDigits(today.getMonth() + 1) + "-" + padToTwoDigits(today.getDate());
                } else {
                    let tempDate = new Date(refInputDate);
                    refInputDateFormat = tempDate.getFullYear() + "-" + padToTwoDigits(tempDate.getMonth() + 1) + "-" + padToTwoDigits(tempDate.getDate());
                }

                // 갯수
                let refCount = modalIngrediTr.querySelector("input[name='refCount']").value;
                if (!refCount) {
                    refCount = 1;
                }

                const ingre = {
                    refName: refName,
                    refConsumptionDate: refConsumptionDateFormat,
                    refInputDate: refInputDateFormat,
                    refCount: refCount
                }

                ingreData.push(ingre);
            }
        })

        console.log("송신할 데이터: ", ingreData);

        $.ajax({
            url: "insertRefri.me",
            method: "POST",
            data: JSON.stringify(ingreData),
            contentType: "application/json; charset=UTF-8",
            success: function (res) {
                console.log("송신 성공: ", res);
                window.location.reload();
            },
            error: function (xhr, status, error) {
                console.error("송신 실패 - 상태 코드: " + xhr.status + ", 상태: " + status + ", 에러 메시지: " + error);
            }
        });
    }


    /** 식재료 추가 모달 페이지바 a 태그에 클릭 이벤트 넣어주는 메소드 */
    function setIngreModalPaginationEventListeners() {
        const pagination = document.querySelector("#ingre-modal-pagination .pagination");
        const pageLinks = pagination.querySelectorAll('a');
        pageLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                const page = parseInt(e.target.getAttribute('data-value'));
                getFoodAndNutriAjax(page);
            });
        });
    }

    // 직접 입력 시 번호 부여하기 위한 변수 선언
    let numForInput = 0;

    /** 유저가 직접 입력 시 테이블 만들어주는 메소드 */
    modalIngre.querySelector("#input-nutri-btn").addEventListener('click', function(){
        numForInput++;
        //유저가 직접 입력한 식품명
        const foodNameByUser = modalIngre.querySelector("#refri-input-foodName-user").value;
        //유저가 셀렉트한 대분류
        const foodSelectBox = modalIngre.querySelector("#refri-select-foodClassification");
        const foodClassNameByUser = foodSelectBox.options[foodSelectBox.selectedIndex].innerHTML;
        const foodClassByUser = foodSelectBox.options[foodSelectBox.selectedIndex].value;

        let food = {
            FOOD_NM_KR: foodNameByUser,
            FOOD_CAT1_NM: foodClassNameByUser
        }

        constructFoodModalTable(ingreModalTbody, numForInput, food)
    })


    // =============================================== 추천 레시피 찾기 관련 메소드 ================================================
   
    // 레시피 찾기 모달 div 요소
    const recipeModal = document.querySelector("#myModal");

    // 식재료 추가시 #modal-recipe-selectedIngre 에 저장하기 위한 배열 생성
    let tempForModalRecipeselectedIngre = [];

    /** 직접 레시피 찾기 모달 표시 메소드 */ 
    document.querySelector("#viewModalBtn").addEventListener('click', function(){
        getRefriInfoByAjax(1, 2);
        document.getElementById("myModal").style.display = "block";
    })

    // 직접 레시피 찾기 모달 숨김 메소드
    document.getElementById("closeModalBtn").addEventListener("click", function () {
        document.getElementById("myModal").style.display = "none";
        tempForModalRecipeselectedIngre = []; // 배열 초기화
        // 식재료를 넣는 div 초기화 수행
        recipeModal.querySelector("#modal-recipe-selectedIngre").innerHTML = tempForModalRecipeselectedIngre;
    });

     // 레시피 찾기 모달 모두 체크 버튼 이벤트
    const recipeModalAllCheck = document.querySelector("#modal-recipe-allCheckBox");
    recipeModalAllCheck.addEventListener("change", function(){
        recipeModal.querySelectorAll(".modal-recipe-tbody-tr").forEach(tr => {
            let checkbox = tr.querySelector("td input[type='checkbox']");
            checkbox.checked = recipeModalAllCheck.checked;
        })
    })

    /** ajax 데이터 받아서 레시피 모달 구축하는 메소드 */
    function constructModalRecipeTable(refriIngresList, modalRecipeTbody){
        modalRecipeTbody.innerHTML = "";
        for( let refriIngre of refriIngresList ){
            //tr 생성
            let recipeTbodyTr = document.createElement('tr');
            modalRecipeTbody.appendChild(recipeTbodyTr);
            recipeTbodyTr.setAttribute("class", "modal-recipe-tbody-tr");
            // 체크박스
            const recipeTableTdCk = document.createElement('td');
            recipeTableTdCk.setAttribute("class", "modal-recipe-td-checkBox");
            recipeTbodyTr.appendChild(recipeTableTdCk);
            const recipeCheckBox = document.createElement('input');
            recipeCheckBox.setAttribute("type", "checkbox");
            recipeTableTdCk.appendChild(recipeCheckBox);
            // 식재료명 td
            const recipeTbodyTd1 = document.createElement('td');
            recipeTbodyTd1.setAttribute("class", "modal-recipe-refName");
            recipeTbodyTd1.innerHTML = refriIngre.refName;
            recipeTbodyTr.appendChild(recipeTbodyTd1);
            // 소비기한 td
            const recipeTbodyTd2 = document.createElement('td');
            recipeTbodyTd2.innerHTML = refriIngre.refConsumptionDate;
            recipeTbodyTr.appendChild(recipeTbodyTd2);
            // 입고일 td
            const refriIngreTd3 = document.createElement('td');
            refriIngreTd3.innerHTML = refriIngre.refInputDate;
            recipeTbodyTr.appendChild(refriIngreTd3);
        }
    }

    /** 레시피 찾기 모달 페이지바 클릭 이벤트 */
    function setRecipeModalPaginationEventListeners() {
        const recipeModalPagination = document.querySelector("#modal-recipe-pagination .pagination");
        const recipePageLinks = recipeModalPagination.querySelectorAll("a");
        recipePageLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                const recipePage = parseInt(e.target.getAttribute('data-value'));
                getRefriInfoByAjax(recipePage, 2);
            });
        });
    }

    /**추가하기 버튼 클릭 시 선택한 항목들을 위에 뿌리기 */
    const completeModalBtn = recipeModal.querySelector("#completeModalBtn");
    completeModalBtn.addEventListener('click', function(){
        recipeModal.querySelectorAll(".modal-recipe-tbody-tr").forEach(tr => {
            let checkbox = tr.querySelector("td input[type='checkbox']");
            if(checkbox.checked){
                let refName = tr.querySelector(".modal-recipe-refName").innerHTML;
                tempForModalRecipeselectedIngre.push(refName);
            }
        })
        recipeModal.querySelector("#modal-recipe-selectedIngre").innerHTML = tempForModalRecipeselectedIngre;
    })

    /** 레시피 찾기 버튼 클릭 시 ajax 로 식재료 보내서 레시피 데이터 받는 메소드 */
    recipeModal.querySelector("#findOutRecipeBtn").addEventListener('click', function(){
        const selectedIngreList = recipeModal.querySelector("#modal-recipe-selectedIngre").innerHTML;

        $.ajax({
            url: "selectRecipeListByRefri.me",
            data: {ingreList: selectedIngreList},
            contentType: "application/json; charset-utf-8",
            success: function(res){
                console.log(res);
                console.log("송신 성공");

                saveRecipeNoInLocalStorage(res);
                       
                location.reload();
            },
            error: function(){
                console.log("송신 실패");
            }
        })
    })

    /** localStorage에서 최근 본 목록을 가져오는 함수 */ 
    function getRecommendedRecipeList(key) {
        let recipeList = localStorage.getItem(key);

        // 최근 본 목록이 없는 경우, 빈 배열로 초기화
        return recipeList ? JSON.parse(recipeList) : [];
    }

    /** 받아 온 레시피들을 로컬 스토리지에 저장하는 메소드 */
    function saveRecipeNoInLocalStorage(recipes){
        // 로컬스토리지의 키값
        let key = "recommendedRecipe";
        // 로컬 스토리지 불러오기
        let localRecipeNoList = getRecommendedRecipeList(key);
        // 해당 키에 저장할 최대 데이터 갯수
        let maxCount = 10;
        // 받아온 추천 레시피 반복문 돌리기
        for(let recipe of recipes){
            console.log(recipe.recipeNo);
            // 로컬 스토리지에 저장 전에 이미 존재하는 데이터인지 여부 체크
            let index = localRecipeNoList.indexOf(recipe.recipeNo);
            // 없다면 리스트에 넣기
            if(index === -1){
                localRecipeNoList.push(recipe.recipeNo);
                // 10개가 넘어가면 가장 앞의 데이터 삭제
                if(localRecipeNoList.length > maxCount){
                    localRecipeNoList.shift();
                }
            }
            // 로컬 스토리지에 저장
            localStorage.setItem(key, recipe.recipeNo);
        }
    }

    /** 로컬 스토리지에 저장된 추천 레시피 no 들로  div 요소 채우는 메소드 */
    function constructRecommendedRecipeDiv(){

        const recipeNums = localStorage.getItem("recommendedRecipe");

        console.log(recipeNums);

        $.ajax({
            url: "selectRecipeListByRecipeNo.me",
            type: "post",
            data: {recipeNums: recipeNums},
            success: function(res){
                console.log(res);
                console.log("송신 성공");
                // 추천 레시피 div
                const recommendRecipeDiv = document.querySelector("#recommend-recipe-imgs");
                recommendRecipeDiv.innerHTML = "";
                for(let recipe of res){
        
                    const divForRecoRecipe = document.createElement('div');
                    recommendRecipeDiv.appendChild(divForRecoRecipe);
        
                    const recoRecipe = document.createElement('img');
                    recoRecipe.src = ctp + "/resources/uploadfile/recipe/recipemain/" + recipe.recipeImg
                    recoRecipe.setAttribute("style", "width: 295px; height: 240px; cursor: pointer");
                    divForRecoRecipe.appendChild(recoRecipe);
        
                    
                    recoRecipe.addEventListener('click', function(){
                        location.href = ctp + "/detail.re?recipeNo=" + recipe.recipeNo;
                    })
                }
            },
            error: function(){
                console.log("송신 실패");
            }
        })
        // 이미지 클릭 시 해당하는 url 로 넘어갈 수 있도록 클릭 이벤트 추가

    }


}
    // 엔터로 쳐도 검색가능
    // function handleKeyPress(ev) {
    //     if (ev.key === 'Enter') {
    //         findSearch();
    //     }
    // }

    // 엔터로 쳐도 검색가능
    // function handleKeyPress2(ev) {
    //     if (ev.key === 'Enter') {
    //         findSearch2();
    //     }
    // }
)
