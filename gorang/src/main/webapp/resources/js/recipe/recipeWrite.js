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


function deleteSmaillBlock(element, num1,num2) {
    let bottom = element.closest(".recipe-ingredient-info-bottom");
    let ingreList = bottom.querySelectorAll(".recipe-smaill-block");
    let count = 0;
    let parentBlock = element.closest('.recipe-smaill-block');
    ingreList.forEach(function() {
        count++;
    });
    
    if (count > 1) {
        // num2 -= 1;
        // let getNum = parseInt(element.closest('.recipe-smaill-block').id.split('-')[1]);
        ingreList.forEach(function(block) {
            let blockId = parseInt(block.id.split('-')[1]);
            if (num2 < blockId) {    
                block.id = `ingredients-${blockId-1}`;
                let inputs = block.querySelectorAll('input');
                inputs.forEach(function(input) {
                    input.name = input.name.replace(/\.ingredientsInfoList\[\d+\]/g, function(match) {
                        let num = parseInt(match.match(/\d+/)[0]) - 1;
                        return `.ingredientsInfoList[${num}]`;
                    });
                });
                
                let deleteBtn = block.querySelector('.delete-btn img');
                deleteBtn.setAttribute('onclick', `deleteSmaillBlock(this, ${num1}, ${blockId - 1})`);
            }
        });
     
        bottom.querySelector('.add-igre-btn img').setAttribute('onclick', `deleteSmaillBlock(this, ${num1}, ${count-2})`);
        bottom.querySelector('.add-igre-btn button').setAttribute('onclick', `addBundle(this, ${num1}, ${count-2})`);
        
        parentBlock.remove();
    }

}


//분류 행삭제
function deleteIngreBlock(element,num1){
    let parentBlock = element.closest("#recipe-ingredient-info-area");

    let deletePart = element.closest('.recipe-ingredient-info-blocks');
    // 분류가 전체 1개만 있을시 삭제불가
    let count =parentBlock.querySelectorAll(".recipe-ingredient-info-blocks").length;
    console.log("grant count:"+count);
    if(count>1){
        let divList =parentBlock.querySelectorAll('.recipe-ingredient-info-blocks');
        console.log(divList);
        divList.forEach(function(block){ 
            let blockId = parseInt(block.id.split('-')[1]);
            if(num1 <blockId){
                
                block.querySelector('.delete-btn').setAttribute('onclick', `deleteIngreBlock(this, ${blockId - 1})`);
                block.id = `divisions-${blockId - 1}`;
                let inputs = block.querySelectorAll('input');
              
                inputs.forEach(function(input) {
                    input.name = input.name.replace(/rcpDivList\[\d+\]/g, function(match) {
                        let num = parseInt(match.match(/\d+/)[0]) - 1;
                        console.log(num);
                        return `rcpDivList[${num}]`;
                    });

                    
                });
                let leningre = block.querySelectorAll('.recipe-smaill-block').length;
                block.querySelector('.add-igre-btn img').setAttribute('onclick', `addBundle(this, ${blockId - 1}, ${leningre - 1})`);
                block.querySelector('.add-igre-btn button').setAttribute('onclick', `addBundle(this, ${blockId - 1}, ${leningre - 1})`);
            }
        })
        parentBlock.querySelector("#add-div-btn button").setAttribute('onclick',`addUnit(this,${count-2})`)
        deletePart.remove();
    }
}




// 기존 분류 추가



function addUnit(element,num) {
    console.log("addUnit num :" + num );
    num += 1;
    let parentBlock = element.closest('#recipe-ingredient-info-area');
    console.log(parentBlock);
    let cloneblock =  document.createElement('div');
    cloneblock.className ='recipe-ingredient-info-blocks';
    cloneblock.id=`divisions-${num}`;
    cloneblock.innerHTML=`
    <div class="recipe-ingredient-info-top">
        <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
        <div class="ingre-div-block" > 
            <input name="rcpDivList[${num}].divName" type="text" placeholder="분류 예)식재료">
        </div> 
        <div class="delete-btn" onclick="deleteIngreBlock(this,${num})"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" ></div>
    </div>
    <div class="recipe-ingredient-info-bottom" >
        <div class="recipe-smaill-block"  id="ingredients-0">
            <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
            <div class="igre-name-block"><input name="rcpDivList[${num}].ingredientsInfoList[0].ingreName" type="text" placeholder="재료명 예)돼지고기"></div>
            <div class="igre-amount-block"><input name="rcpDivList[${num}].ingredientsInfoList[0].ingreAmount" type="text" placeholder="수량"></div>
            <div class="igre-unit-block"><input name="rcpDivList[${num}].ingredientsInfoList[0].ingreUnit" type="text" placeholder="단위"></div>
            <div class="delete-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteSmaillBlock(this,${num},0)"></div>
            <button type="button">태그 +</button>
        </div>
        <div class="add-igre-btn">                     
            <img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus.png" alt="" onclick="addBundle(this,${num},0)">
            <button type="button" onclick="addBundle(this,${num},0)">묶음 추가</button>
        </div>
    </div>        
    `
    parentBlock.querySelector('#add-div-btn').insertAdjacentElement('beforebegin',cloneblock);
    parentBlock.querySelector('#add-div-btn').innerHTML='';
    parentBlock.querySelector('#add-div-btn').innerHTML=`
     
            <button type="button" onclick="addUnit(this,${num})">+ 분류 추가</button>
      
    `;
  
    
}

function addBundle(element,num1,num2) {
    console.log("addBundle num1 :" + num1 +",  num2 : " + num2);
    num2 +=1
    console.log(num2);
    let parentBlock = element.closest('.recipe-ingredient-info-bottom');
    parentBlock.querySelector(".add-igre-btn").innerHTML='';
    parentBlock.querySelector(".add-igre-btn").innerHTML=`
    <img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus.png" alt="" onclick="addBundle(this,${num1},${num2})">
    <button type="button" onclick="addBundle(this,${num1},${num2})">묶음 추가</button>
    `;
    parentBlock.querySelector('.add-igre-btn').insertAdjacentElement('beforebegin', Inputs(num1,num2));
}

 function Inputs(num1,num2) {

    const newBlock = document.createElement('div');
    newBlock.className = 'recipe-smaill-block';
    newBlock.id =`ingredients-${num2}`;
    newBlock.innerHTML = `
        <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
        <div class="igre-name-block"><input name="rcpDivList[${num1}].ingredientsInfoList[${num2}].ingreName" type="text" placeholder="재료명 예)돼지고기"></div>
        <div class="igre-amount-block"><input name="rcpDivList[${num1}].ingredientsInfoList[${num2}].ingreAmount" type="text" placeholder="수량"></div>
        <div class="igre-unit-block"><input name="rcpDivList[${num1}].ingredientsInfoList[${num2}].ingreUnit" type="text" placeholder="단위"></div>
        <div class="delete-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteSmaillBlock(this,${num1},${num2})"></div>
        <button type="button">태그 +</button>
    </div>`;
    return newBlock;
 }


//--------------------------------조리순서-------------------------------
function tipInputs(num1,num2) {
    num2+=1;
    const newBlock = document.createElement('div');
    newBlock.className = 'cooking-order-block-bottom-tip';
    newBlock.id = `cookTip-${num2}`;
    newBlock.innerHTML = `
    <input  name ="cookOrderList[${num1}].cookTipList[${num2}].cookTipContent" type="text" placeholder="팁 예) 볶는 시간은 최소로 합니다">
    <button type="button" class="add-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus (2).png" alt="" onclick="addTip(this,${num1},${num2})"></button>
    <button type="button" class="delte-tip"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt=""  onclick="deleteTip(this,${num1},${num2})"></button>
    `;
    return newBlock;
}
function orderInputs(num){
    num +=1;
    const newBlock = document.createElement('div');
    newBlock.className = 'cooking-order-blocks';

    newBlock.id =`cookOrder-${num}`;
    newBlock.innerHTML = `
    <div class="cooking-order-block">
    <div class="cooking-order-block-top">
        <div class="cook-order-number-img">1</div>
        <div class="cook-order-write-content"><input name ="cookOrderList[${num}].cookOrdContent" type="text" placeholder="예) 소고기는 기름을 떼어내고 적당한 크기로 썰어주세요"></div>
        <div class="cook-order-hambugerbar"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/SVG.png" alt=""></div>
    </div>
    <div class="cooking-order-block-bottom" >
        <div class="cooking-order-block-bottom-img" onclick="cookIngOrderImg(this,${num})">
            <img class ="cookingImg" src="/gorang/resources/dummyImg/recipe/recipeWrite/camera.png" alt="">
            <img class="cookingImg-real" src="" alt="" >
            <input name ="cookOrderList[${num}].cookOrdPhoto" type="file"  id="fileInput"  onchange="changeCookIngOrderImg(this,${num})">
        </div>
        <div class="cooking-order-block-bottom-tips">
            <div class="cooking-order-block-bottom-tip" id="cookTip-0">
                <input  name ="cookOrderList[${num}].cookTipList[0].cookTipContent" type="text" placeholder="팁 예) 볶는 시간은 최소로 합니다">
                <button type="button" class="add-tip">
                    <img src="/gorang/resources/dummyImg/recipe/recipeWrite/plus (2).png" alt="" onclick="addTip(this,${num},0)"></button>
                <button type="button" class="delte-tip">
                    <img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt=""  onclick="deleteTip(this,${num},0)"></button>
            </div>
        </div>
    </div>
    <div id="recipe-order-delete-btn-area">
        <button type="button" id="order-delete-btn" onclick="deleteCookingOrder(this,${num})">삭제</button>
    </div>
</div>
    `;
    return newBlock;
}


// 팁 추가 최대 4개
function addTip(element,num1,num2){
    let parentBlock = element.closest(".cooking-order-block-bottom-tips");
    let insertBlock = element.closest(".cooking-order-block-bottom-tip");
    // let thisBlock =parseInt(element.closest(".cooking-order-block-bottom-tip").id.split('-')[1]); // 0
    let tipListLen =parentBlock.querySelectorAll(".cooking-order-block-bottom-tip"); //0 1
    let checkCount = tipListLen.length;
    if(checkCount<4){ 
        insertBlock.insertAdjacentElement('afterend', tipInputs(num1,num2));     
    }
    let tipList =parentBlock.querySelectorAll(".cooking-order-block-bottom-tip");
    console.log(tipList);
    for(let i = 0; i<tipList.length; i++){
        let num =parseInt(tipList[i].id.split('-')[1]);
        // console.log(num);
        if(i<tipList.length-1){
            let numNext=parseInt(tipList[i+1].id.split('-')[1]);
            console.log(numNext);
            if(num === numNext){
                tipList[i+1].id=`cookTip-${num+1}`;
                tipList[i+1].querySelector('input').name = tipList[i+1].querySelector('input').name.replace(/.cookTipList\[\d+\]/g, function(match) {
                    let num = parseInt(match.match(/\d+/)[0])+1;
                    return `.cookTipList[${num}]`;
                })

                let addTipButton = tipList[i+1].querySelector('.add-tip img');
                let deleteTipButton = tipList[i+1].querySelector('.delte-tip img');                        
                let tipIndex = parseInt(addTipButton.closest('.cooking-order-block-bottom-tip').querySelector('input').name.match(/cookTipList\[(\d+)\]/)[1]);
                if (addTipButton) {
                    addTipButton.setAttribute('onclick', `addTip(this, ${num1}, ${tipIndex})`);
                }
                if (deleteTipButton) {
                    deleteTipButton.setAttribute('onclick', `deleteTip(this, ${num1}, ${tipIndex})`);
                }                
            }
        }
        
    }
}

//요리순서 추가
function addCookingOrder(element,num){
    let parentBlock = element.closest("#cooking-order-area");
    parentBlock.querySelector('#add-order-btn').insertAdjacentElement('beforebegin', orderInputs(num));
   
    let lastNum =  parentBlock.querySelectorAll(".cook-order-number-img").length;
    parentBlock.querySelectorAll(".cook-order-number-img")[lastNum-1].innerHTML=lastNum;
    parentBlock.querySelector('#add-order-btn').innerHTML='';
    parentBlock.querySelector('#add-order-btn').innerHTML=`
        <button type="button" onclick="addCookingOrder(this,${num+1})">+ 순서 추가</button>
    `;
}

// 팁 삭제
function deleteTip(element,num1,num2){
    let parentBlock = element.closest(".cooking-order-block-bottom-tips");
    let deleteBlock = element.closest(".cooking-order-block-bottom-tip");
    // console.log(parentBlock);
    let tipLen = parentBlock.querySelectorAll(".cooking-order-block-bottom-tip").length;
    // console.log(tipLen);
    if(tipLen>1){
        let tipList = parentBlock.querySelectorAll(".cooking-order-block-bottom-tip");
        tipList.forEach(function(block){
            let blockId = parseInt(block.id.split('-')[1]);
            let deleteId = parseInt(deleteBlock.id.split('-')[1]);
            if(blockId > deleteId ){
                block.id = `cookTip-${blockId-1}`;
                block.querySelector('input').name = block.querySelector('input').name.replace(/.cookTipList\[\d+\]/g, function(match) {
                    let num = parseInt(match.match(/\d+/)[0])-1;
                    return `.cookTipList[${num}]`;
                })
                let addTipButton = block.querySelector('.add-tip img');
                let deleteTipButton = block.querySelector('.delte-tip img');                        
                let tipIndex = parseInt(addTipButton.closest('.cooking-order-block-bottom-tip').querySelector('input').name.match(/cookTipList\[(\d+)\]/)[1]);
                if (addTipButton) {
                    addTipButton.setAttribute('onclick', `addTip(this, ${num1}, ${tipIndex})`);
                }
                if (deleteTipButton) {
                    deleteTipButton.setAttribute('onclick', `deleteTip(this, ${num1}, ${tipIndex})`);
                }      
            }
        })
        deleteBlock.remove();
        
    }

}


//요리순서 삭제 (1개만 있을시 삭제x)
function deleteCookingOrder(element,num){
    let parentBlock = element.closest("#cooking-order-area");
    let deletePart=element.closest(".cooking-order-blocks");
    let count= parentBlock.querySelectorAll('.cooking-order-blocks').length
    if(count>1){
        // 클릭된 요리순서 번호 찾기
        let deleteNum=element.closest('.cooking-order-block').querySelector('.cook-order-number-img').innerHTML; 
        //EX) 조리순서 3번 삭제했다면 3번보다 큰 모든 번호는 -1감소
        parentBlock.querySelectorAll(".cook-order-number-img").forEach(function(change){
           if(parseInt(change.innerHTML) >parseInt(deleteNum)){
                change.innerHTML =parseInt(change.innerHTML)-1;
           }
        })

        let divList =parentBlock.querySelectorAll('.cooking-order-blocks');
        console.log(divList);
        divList.forEach(function(block){ 
            let blockId = parseInt(block.id.split('-')[1]);
            if(blockId>num){
                block.querySelector('.cooking-order-block-bottom-img').setAttribute('onclick', `cookIngOrderImg(this, ${blockId - 1})`);
                block.querySelector('.cooking-order-block-bottom-img input').setAttribute('onchange', `changeCookIngOrderImg(this, ${blockId - 1})`);
                block.querySelector('#recipe-order-delete-btn-area button').setAttribute('onclick', `deleteCookingOrder(this, ${blockId - 1})`);
                
                block.id = `cookOrder-${blockId - 1}`;
                let inputs = block.querySelectorAll('input, img');           
                inputs.forEach(function(inputImg) {
                    if (inputImg.tagName.toLowerCase() === 'input' && inputImg.name.includes('cookOrderList')) {
                        inputImg.name = inputImg.name.replace(/cookOrderList\[\d+\]/g, function(match) {
                            let num = parseInt(match.match(/\d+/)[0]) - 1;
                            return `cookOrderList[${num}]`;
                        });
                    } else if (inputImg.tagName.toLowerCase() === 'img' && inputImg.closest('.cooking-order-block-bottom-tip')) {
                        let addTipButton = inputImg.closest('.cooking-order-block-bottom-tip').querySelector('.add-tip');
                        let deleteTipButton = inputImg.closest('.cooking-order-block-bottom-tip').querySelector('.delte-tip');                        
                        if (addTipButton) {
                            let tipIndex = parseInt(addTipButton.closest('.cooking-order-block-bottom-tip').querySelector('input').name.match(/cookTipList\[(\d+)\]/)[1]);
                            addTipButton.setAttribute('onclick', `addTip(this, ${blockId - 1}, ${tipIndex})`);
                        }
                        if (deleteTipButton) {
                            let tipIndex = parseInt(deleteTipButton.closest('.cooking-order-block-bottom-tip').querySelector('input').name.match(/cookTipList\[(\d+)\]/)[1]);
                            deleteTipButton.setAttribute('onclick', `deleteTip(this, ${blockId - 1}, ${tipIndex})`);
                        }
                    }
                });
            }
        })
        parentBlock.querySelector('#add-order-btn button').setAttribute('onclick', `addCookingOrder(this, ${count-2})`);
        deletePart.remove();
    }
}

//-------------------------------------상단 버튼-----------------

// 등록하기 버튼
function enrollRecipeBtn(){
    let thumbnailImg = document.getElementById('thumnailImg-real');
    let recipeTitle = document.querySelector('#recipe-write-title-area input[name="recipeTitle"]').value.trim();
    let recipeContent = document.querySelector('#recipe-introduce-area textarea[name="recipeContent"]').value.trim();
    let recipeTag = document.querySelector('#recipe-tage-area input[name="recipeTag"]').value.trim();
    let cookKind = document.querySelector('#recipe-category-area select[name="cookKind"]').value;
    let cookLevel = document.querySelector('#recipe-category-area select[name="cookLevel"]').value;
    let cookTime = document.querySelector('#recipe-category-area select[name="cookTime"]').value;
    let cookAmount = document.querySelector('#recipe-category-area select[name="cookAmount"]').value;
    let cookingImgReal =document.querySelectorAll('.cookingImg-real');
    let ingredientArea = document.getElementById("recipe-ingredient-info-area");
    let inputFields = ingredientArea.querySelectorAll("input");
    let orderArea = document.getElementById("cooking-order-area");
    let inputFields2 = orderArea.querySelectorAll("input");
    let completeImgReals = document.querySelectorAll('.completeImg-real');
   
    let isEmptyIngre = false;
    let isEmptyIngre2 = false;
    let isEmptyCompleteImg = false;
   
    // 재료 미입력 확인
    inputFields.forEach(function(input) {
        if (input.value.trim() === "") {
            isEmptyIngre = true;
            return;
        }
    });
    console.log("재료"+isEmptyIngre);
    // 조리순서 미입력 확인
    inputFields2.forEach(function(input) {
        if (input.value.trim() === "") {
            isEmptyIngre2 = true;
            return;
        }
    });
    cookingImgReal.forEach(function(img){
        if(!img.src || img.src === '' ||img.style.display !== 'block'){
            isEmptyIngre2=true;
            return;
        }
    })
    console.log("순서:"+isEmptyIngre2);
    
    if (!thumbnailImg.src || thumbnailImg.src === '' || thumbnailImg.style.display !== 'block') {
        alert('대표 이미지를 입력해주세요.');
        thumbnailImg.focus;
        return false;
    }
    if(!recipeTitle){
        alert('레시피 제목을 입력해주세요.');
        recipeTitle.focus;
        return false;
    }

    if(!recipeContent){
        alert('요리를 소개를 입력해주세요.');
        recipeContent.focus;
        return false;
    }

    if(!recipeTag){
        alert('태그를 입력해주세요.');
        recipeTag.focus;
        return false;
    }

    if(!cookKind){
        alert('카테고리를 선택해주세요.');
        cookKind.focus;
        return false;
    }

    if(!cookLevel){
        alert('난이도를 선택해주세요.');
        cookLevel.focus;
        return false;
    }

    if(!cookTime){
        alert('시간을 선택해주세요.');
        cookTime.focus;
        return false;
    }

    if(!cookAmount){
        alert('인원을 선택해주세요.');
        cookAmount.focus;
        return false;
    }
    if (isEmptyIngre2) {
        alert("조리순서를 마저 입력해주세요");
        orderArea.focus;
        return false;
    }

    if (isEmptyIngre) {
        alert("재료정보를 마저 입력해주세요");
        ingredientArea.focus;
        return false;
    }   

    if (isEmptyCompleteImg) {
        alert('완성사진을 하나 이상 넣어주세요.');
        completeImgReals.focus;
        return false;
    }
    // showSweetConfirm();
}

//--------------------------------- 예외처리 ------------------------------------------
