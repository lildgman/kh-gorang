document.addEventListener("DOMContentLoaded", function () {


    



    // =================================== 식재료 추가 모달 관련 코드 ==========================================
    

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
                tr.querySelectorAll(".direct-input-label").forEach(function(el){
                    el.style.display = 'inline';
                })
                tr.querySelectorAll(".direct-input").forEach(function(el){
                    el.style.display = 'inline';
                })
            } else {
                tr.querySelectorAll(".direct-input-label").forEach(function(el){
                    el.style.display = 'none';
                })
                tr.querySelectorAll(".direct-input").forEach(function(el){
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
                ev.querySelector(".direct-input-label").style.display = 'inline';
                ev.querySelector(".direct-input").style.display = 'inline';
            } else {
                ev.querySelector(".direct-input-label").style.display = 'none';
                ev.querySelector(".direct-input").style.display = 'none';
            }
        })
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
        getFoodAndNutriAjax();
    }


        // 공공데이터 가져오는 ajax
        function getFoodAndNutriAjax() {
            const foodNameVl = document.querySelector("#refri-input-foodName").value;
            const makerVl = document.querySelector("#refri-input-maker").value;
    
            $.ajax({
                url: "food.me",
                data: {
                    foodName: foodNameVl,
                    makerName: makerVl
                },
                success: function (res) {
                    console.log(res);
                    let foodArr = res.body.items
                    foodArr = foodArr.map(f => {
                        let food = {}
                        for (let key in f) {
                            food[key.trim()] = f[key];
                        }
                        return food;
                    })
    
                    console.log(foodArr)
                    drawFoodAndNutri(foodArr);
                },
                error: function () {
                    console.log("송신 실패");
                }
            })
        }
    
        // getFoodAndNutriAjax 로 받아온 데이터를 모달에 뿌려주는 메소드
        function drawFoodAndNutri(foodArr) {
            const ingreModalTbody = document.querySelector("#modal-ingre-tbody");
            ingreModalTbody.innerHTML = "";
    
            let num = 0;
    
            for (let food of foodArr) {
                num++;
                constructFoodModalTable(ingreModalTbody, num, food);
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
    
            const foodTd4Span = document.createElement('span');
            foodTableTd4.appendChild(foodTd4Span);
            foodTd4Span.setAttribute("class", "direct-input-label");
            foodTd4Span.setAttribute("style", "display: none;");
            foodTd4Span.innerHTML = "직접입력 : ";
    
            const foodTd4Input = document.createElement('input');
            foodTableTd4.appendChild(foodTd4Input);
            foodTd4Input.setAttribute("class", "direct-input");
            foodTd4Input.setAttribute("type", "text");
            foodTd4Input.setAttribute("name", "refConsumptionDate");
            foodTd4Input.setAttribute("placeholder", "예시) 20240611");
            foodTd4Input.setAttribute("style", "display: none;");
            
            // 입고일
            const foodTableTd5 = document.createElement('td');
            foodTableTd5.setAttribute("class", "fixed-width4");
            foodTableTd5.setAttribute("style", "text-align: left; font-size: 12px");
            foodTabletr.appendChild(foodTableTd5);
    
            const foodTd5Span = document.createElement('span');
            foodTableTd5.appendChild(foodTd5Span);
            foodTd5Span.setAttribute("class", "direct-input-label");
            foodTd5Span.setAttribute("style", "display: none;");
            foodTd5Span.innerHTML = "직접입력 : ";
    
            const foodTd5Input = document.createElement('input');
            foodTableTd5.appendChild(foodTd5Input);
            foodTd5Input.setAttribute("class", "direct-input");
            foodTd5Input.setAttribute("type", "text");
            foodTd5Input.setAttribute("name", "refInputDate");
            foodTd5Input.setAttribute("placeholder", "예시) 20240611");
            foodTd5Input.setAttribute("style", "display: none;");
            
            // 갯수
            const foodTableTd6 = document.createElement('td');
            foodTableTd6.setAttribute("class", "fixed-width4");
            foodTableTd6.setAttribute("style", "text-align: left; font-size: 12px");
            foodTabletr.appendChild(foodTableTd6);
    
            const foodTd6Span = document.createElement('span');
            foodTableTd6.appendChild(foodTd6Span);
            foodTd6Span.setAttribute("class", "direct-input-label");
            foodTd6Span.setAttribute("style", "display: none;");
            foodTd6Span.innerHTML = "직접입력 : ";
    
            const foodTd6Input = document.createElement('input');
            foodTableTd6.appendChild(foodTd6Input);
            foodTd6Input.setAttribute("class", "direct-input");
            foodTd6Input.setAttribute("type", "text");
            foodTd6Input.setAttribute("name", "refCount");
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
        function sendIngreByAjax(){
            const ingre = {

            }


            $.ajax({

            })
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
