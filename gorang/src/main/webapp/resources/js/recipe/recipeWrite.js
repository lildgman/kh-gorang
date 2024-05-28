// 외부 함수(alert)
function showSweetConfirm() {
    // Swal.fire({
    //     title: '정말 탈퇴하시겠습니까?',
    //     text: "이 작업은 되돌릴 수 없습니다!",
    //     icon: 'warning',
    //     showCancelButton: true,
    //     confirmButtonText: '확인',
    //     cancelButtonText: '취소'
    // }).then((result) => {
    //     if (result.isConfirmed) {
    //         Swal.fire(
    //             '탈퇴 완료!',
    //             '탈퇴가 완료되었습니다.',
    //             'success'
    //         );
    //         // 탈퇴 처리 코드 여기에 추가
    //     } else if (result.dismiss === Swal.DismissReason.cancel) {
    //         Swal.fire(
    //             '취소됨',
    //             '탈퇴가 취소되었습니다.',
    //             'error'
    //         );
    //     }
    // });
}

// -----------------------------사진 넣기 영역---------------------------
function choiceThumnailImg() {
    document.querySelector("#recipe-write-imgupload-area input[type='file']").click();
}
function cookIngOrderImg(element) {
    element.querySelector(".cooking-order-block-bottom-img input[type='file']").click();
}
function completeImg(element) {
    element.querySelector("input[type='file']").click();
}
//썸네일 이미지 넣기
function changeThumnailImg(inputFile) {
    if (inputFile.files.length === 1) {
        document.getElementById("thumnailImg").style.display = "none";
        document.getElementById("recipe-write-img-middle-text").style.display = "none";
        document.getElementById("recipe-write-img-bottom-text").style.display = "none";

        document.getElementById("thumnailImg-real").style.display = "block";
        const reader = new FileReader();
        reader.readAsDataURL(inputFile.files[0]);
        reader.onload = function (ev) {
            document.getElementById("thumnailImg-real").src = ev.target.result;
        }

    } else {
        document.getElementById("thumnailImg").style.display = "inline";
        document.getElementById("recipe-write-img-middle-text").style.display = "block";
        document.getElementById("recipe-write-img-bottom-text").style.display = "block";

        document.getElementById("thumnailImg-real").style.display = "none";
    }
}

//조리 순서 이미지 넣기
function changeCookIngOrderImg(inputFile){
    let parentBlock = inputFile.closest('.cooking-order-block-bottom-img');
    if (inputFile.files.length === 1) {
        parentBlock.querySelector(".cookingImg").style.display = "none";
        parentBlock.querySelector(".cookingImg-real").style.display = "block";
        const reader = new FileReader();
        reader.readAsDataURL(inputFile.files[0]);
        reader.onload = function (ev) {
            parentBlock.querySelector(".cookingImg-real").src = ev.target.result;
        }

    } else {
        parentBlock.querySelector(".cookingImg").style.display = "inline";
        parentBlock.querySelector(".cookingImg-real").style.display = "none";
    }
}
//요리 완성 이미지 넣기
function changecompleteImg(inputFile){
    let parentBlock = inputFile.closest('.complete-food-img-block');
    if (inputFile.files.length === 1) {
        parentBlock.querySelector(".completeImg").style.display = "none";
        parentBlock.querySelector(".completeImg-real").style.display = "block";
        const reader = new FileReader();
        reader.readAsDataURL(inputFile.files[0]);
        reader.onload = function (ev) {
            parentBlock.querySelector(".completeImg-real").src = ev.target.result;
        }

    } else {
        parentBlock.querySelector(".completeImg").style.display = "inline";
        parentBlock.querySelector(".completeImg-real").style.display = "none";
    }
}

//--------------------------------재료정보-------------------------------
// 재료명 행삭제
function deleteSmaillBlock(element) {
    let parentBlock = element.closest('.recipe-smaill-block');
    parentBlock.remove();
}

//분류 행삭제
function deleteIngreBlock(element){
    let count =0;
    // 분류가 전체 1개만 있을시 삭제불가
   document.querySelectorAll("#recipe-ingredient-info-area #recipe-ingredient-info-blocks").forEach(function(child){
        count++;
   })
   if(count>1){
        let parentBlock =element.closest('#recipe-ingredient-info-blocks');
        console.log(parentBlock); 
        parentBlock.remove();
   }
   
}

function Inputs() {
    const newBlock = document.createElement('div');
    newBlock.className = 'recipe-smaill-block';
    newBlock.innerHTML = `
    <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
    <div class="igre-name-block"><input name ="ingreName" type="text" placeholder="재료명 예)돼지고기"></div>
    <div class="igre-amount-block"><input name ="ingreAmount" type="text" placeholder="수량"></div>
    <div class="igre-unit-block"><input  name ="ingreUnit" type="text" placeholder="단위"></div>
    <div class="delete-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteSmaillBlock(this)"></div>
    <button type="button">태그 +</button>`;
    return newBlock;
}

// 기존 묶음 아래에 추가
function addBundle(element) {
    let cloneBlock = element.closest('.recipe-ingredient-info-bottom');
    cloneBlock.querySelector('.add-igre-btn').insertAdjacentElement('beforebegin', Inputs());

}


// 기존 분류 추가
function addUnit(element) {
    let parentBlock = element.closest('#recipe-ingredient-info-area');
    console.log(parentBlock);
    let cloneBlock = parentBlock.querySelector("#recipe-ingredient-info-blocks").cloneNode(true);
    console.log(cloneBlock);
    cloneBlock.querySelector('.recipe-ingredient-info-top').innerHTML = '';

    cloneBlock.querySelectorAll('.recipe-ingredient-info-bottom .recipe-smaill-block').forEach(child => {
        child.remove();
    });
    cloneBlock.querySelector('.add-igre-btn').insertAdjacentElement('beforebegin', Inputs());
    console.log(cloneBlock);
    cloneBlock.querySelector('.recipe-ingredient-info-top').innerHTML = `
    <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
    <div class="ingre-div-block" >
        <input type="text" placeholder="분류 예)식재료">
    </div>
    <div class="delete-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteIngreBlock(this)"></div>`;

    parentBlock.querySelector('#add-div-btn').insertAdjacentElement('beforebegin', cloneBlock);

}


//--------------------------------조리순서-------------------------------
function tipInputs() {
    const newBlock = document.createElement('div');
    newBlock.className = 'cooking-order-block-bottom-tip';
    newBlock.innerHTML = `
    <input type="text" placeholder="팁 예) 볶는 시간은 최소로 합니다">
    <button type="button" class="add-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus (2).png" alt="" onclick="addTip(this)"></button>
    <button type="button" class="delte-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt=""  onclick="deleteTip(this)"></button>
    `;
    return newBlock;
}
function orderInputs(){
    const newBlock = document.createElement('div');
    newBlock.id = 'cooking-order-blocks';
    newBlock.innerHTML = `
    <div class="cooking-order-block">
    <div class="cooking-order-block-top">
        <div class="cook-order-number-img">1</div>
        <div class="cook-order-write-content"><input type="text" placeholder="예) 소고기는 기름을 떼어내고 적당한 크기로 썰어주세요"></div>
        <div class="cook-order-hambugerbar"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/SVG.png" alt=""></div>
    </div>
    <div class="cooking-order-block-bottom">
        <div class="cooking-order-block-bottom-img" onclick="cookIngOrderImg(this)">
            <img class ="cookingImg" src="/gorang/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
            <img class="cookingImg-real" src="" alt="" >
            <input type="file"  id="fileInput"  onchange="changeCookIngOrderImg(this)">
        </div>
        <div class="cooking-order-block-bottom-tips">
            <div class="cooking-order-block-bottom-tip">
                <input type="text" placeholder="팁 예) 볶는 시간은 최소로 합니다">
                <button type="button" class="add-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus (2).png" alt="" onclick="addTip(this)"></button>
                <button type="button" class="delte-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt=""  onclick="deleteTip(this)"></button>
            </div>
        </div>
    </div>
    <div id="recipe-order-delete-btn-area">
        <button type="button" id="order-delete-btn" onclick="deleteCookingOrder(this)">삭제</button>
    </div>
    </div>
    `;
    return newBlock;
}



// 팁 추가 최대 4개
function addTip(element){
    let countTip=0;
    let parentBlock = element.closest(".cooking-order-block-bottom-tips");
    let checkCount = parentBlock.querySelectorAll(".cooking-order-block-bottom-tip");
    checkCount.forEach(function(){
        countTip++;
    })
    console.log(countTip);
    if(countTip<4){
        let cloneBlock = element.closest(".cooking-order-block-bottom-tips");
        cloneBlock.querySelector('.cooking-order-block-bottom-tip').insertAdjacentElement('beforebegin', tipInputs());
    }
}
//요리순서 추가
function addCookingOrder(element){
    let parentBlock = element.closest("#cooking-order-area");
    parentBlock.querySelector('#add-order-btn').insertAdjacentElement('beforebegin', orderInputs());
   
    let lastNum =  parentBlock.querySelectorAll(".cook-order-number-img").length;
    parentBlock.querySelectorAll(".cook-order-number-img")[lastNum-1].innerHTML=lastNum;
    
    console.log(parentBlock);
}

// 팁 삭제
function deleteTip(element){
    element.closest(".cooking-order-block-bottom-tip").remove();
}


//요리순서 삭제 (1개만 있을시 삭제x)
function deleteCookingOrder(element){
    let parentBlock = element.closest("#cooking-order-area");
    if(parentBlock.querySelectorAll('#cooking-order-blocks').length>1){
        // 클릭된 요리순서 번호 찾기
        let deleteNum=element.closest('.cooking-order-block').querySelector('.cook-order-number-img').innerHTML; 

        element.closest("#cooking-order-blocks").remove();

        //EX) 조리순서 3번 삭제했다면 3번보다 큰 모든 번호는 -1감소
        parentBlock.querySelectorAll(".cook-order-number-img").forEach(function(change){
           if(parseInt(change.innerHTML) >parseInt(deleteNum)){
                change.innerHTML =parseInt(change.innerHTML)-1;
           }
        })
        
    }
}

//-------------------------------------상단 버튼-----------------

// 등록하기 버튼
function enrollRecipeBtn(){
    showSweetConfirm();
}
