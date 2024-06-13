document.addEventListener("DOMContentLoaded", function () {
    
    const ctp = getContextPath();

    setPaginationEventListeners();

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
        }        
    }       


    // =================================== 나의 냉장고 식재료 테이블 관련 메소드 ================================
    
    /** 냉장고 페이지바 a 태그에 클릭 이벤트 넣어주는 메소드 */
    function setPaginationEventListeners() {
        const refriPaginationArea = document.querySelector("#pagination-area");
        refriPaginationArea.querySelectorAll(".pagination a").forEach(function(ev){
            ev.addEventListener("click", function(el){
                let cpage = el.currentTarget.getAttribute('data-value');
                getRefriInfoByAjax(parseInt(cpage));
            });
        });
    }

    /** ajax 로 currentPage 보내서 RowBounds 된 List<refrigerator> 값 받아온 후 뿌려주는 메소드*/
    function getRefriInfoByAjax(data){
        $.ajax({
            url: "selectRefriAjax.me",
            data: { cpage: data },
            success: function(res){
                const refriIngresList = res.refriIngres;
                const refriTbody = document.querySelector("#myRefrigerator-table-tbody");
                refriTbody.innerHTML = "";

                for(let refriIngre of refriIngresList){
                    console.log(refriIngre.daysDifference);
                    let refriTbodyTr = document.createElement('tr');
                    refriTbody.appendChild(refriTbodyTr);
                    refriTbodyTr.setAttribute("class", ".tr-block");
                    // 이미지 td
                    const refriIngreTd1 = document.createElement('td');
                    refriIngreTd1.setAttribute("class", "myRefrigerator-tr");
                    refriTbodyTr.appendChild(refriIngreTd1);
                    const refriIngreImg = document.createElement('img');
                    refriIngreImg.setAttribute("src", ctp + "/resources/images/member-img/Rectangle 18311 (2).png");
                    refriIngreTd1.appendChild(refriIngreImg);
                    // 식재료명 td
                    const refriIngreTd2 = document.createElement('td');
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
                    refriIngreTd7.setAttribute("class", "myRefrigerator-last-td");
                    refriIngreTd7.innerHTML = "삭제";
                    refriTbodyTr.appendChild(refriIngreTd7);
                }
                const paginationArea = document.querySelector("#pagination-area");
                // 페이지네이션 갱신
                updatePagination(paginationArea, res.pi);
            },
            error: function(){
                console.log("송신 실패");
            }
        })
    }

    // =================================== 식재료 추가 모달 관련 메소드 ==========================================

    // ======== 이벤트 리스너

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

    // 식재료 추가하기 모달창
    function viewModal2() {
        document.getElementById("myModal-two").style.display = "block";
        // 식재료 추가 모달창 => 체크 박스 클릭시 소비기한표시
        document.getElementById("closeModalBtn2").addEventListener("click", function () {
            document.getElementById("myModal-two").style.display = "none";
        });
    }

    // 모달 식재료 추가 검색창
    function findSearch2() {
        getFoodAndNutriAjax(1);
    }


    // 공공데이터 가져오는 ajax
    function getFoodAndNutriAjax(cpage) {
        const foodNameVl = document.querySelector("#refri-input-foodName").value;
        const makerVl = document.querySelector("#refri-input-maker").value;

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
        const ingreModalTbody = document.querySelector("#modal-ingre-tbody");
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

}




    // //레시피 직접 찾기 모달창
    // function viewModal() {
    //     document.getElementById("myModal").style.display = "block";
    //     // let h= document.querySelector(".header jsp");
    //     // console.log(h);
    //     document.getElementById("closeModalBtn").addEventListener("click", function () {
    //         document.getElementById("myModal").style.display = "none";
    //     });
    // }

    // 엔터로 쳐도 검색가능
    // function handleKeyPress(ev) {
    //     if (ev.key === 'Enter') {
    //         findSearch();
    //     }
    // }

    // 모달 레시피 검색창
    // function findSearch() {
    //     let result = document.getElementById('input-igretext').value;
    //     let igreList = document.querySelectorAll(".row-igre-area");
    //     igreList.forEach(function (igre) {
    //         let igreName = igre.querySelectorAll('span')[0];
    //         let partIgre = igreName.parentElement;
    //         if (igreName.innerHTML.includes(result)) {
    //             // console.log(partIgre);
    //             partIgre.style.display = 'flex';
    //         }
    //         else {
    //             partIgre.style.display = 'none';
    //         }
    //     })
    // }


    // 엔터로 쳐도 검색가능
    // function handleKeyPress2(ev) {
    //     if (ev.key === 'Enter') {
    //         findSearch2();
    //     }
    // }



    // 체크박스 체크시
    // function checkBoxStatus(el) {
    //     if (el.checked === true) {
    //         el.querySelector('.direct-input-label').style.display = 'inline';
    //         el.querySelector('.direct-input').style.display = 'inline';
    //     }
    //     else {
    //         el.querySelector('.direct-input-label').style.display = 'none';
    //         el.querySelector('.direct-input').style.display = 'none';
    //     }
    // }


    // 식재료 삭제 
    // function delteIngre(el) {
    //     document.querySelector("tr-block").remove();
    // }


)
