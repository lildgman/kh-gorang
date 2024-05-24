
function choiceThumnailImg(){
    let check=document.querySelector("#recipe-write-imgupload-area input[type='file']").click();

}

//썸네일 이미지 넣기
function changeThumnailImg(inputFile){
    if(inputFile.files.length ===1){
        document.getElementById("thumnailImg").style.display="none";
        document.getElementById("recipe-write-img-middle-text").style.display="none";
        document.getElementById("recipe-write-img-bottom-text").style.display="none";
        
        document.getElementById("thumnailImg-real").style.display="block";
        const reader =new FileReader();
        reader.readAsDataURL(inputFile.files[0]);
        reader.onload =function(ev){
            document.getElementById("thumnailImg-real").src=ev.target.result;
        }
						
    }else{
        document.getElementById("thumnailImg").style.display="inline";
        document.getElementById("recipe-write-img-middle-text").style.display="block";
        document.getElementById("recipe-write-img-bottom-text").style.display="block";
        
        document.getElementById("thumnailImg-real").style.display="none";
    }
}

// 재료명 행삭제
function deleteSmaillBlock(element){
    let parentBlock = element.closest('.recipe-smaill-block');
    parentBlock.remove();
}



function Inputs() {
    const newBlock = document.createElement('div');
    newBlock.className = 'recipe-smaill-block';
    newBlock.innerHTML = `
    <div class="location-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
    <div class="igre-name-block"><input type="text" placeholder="재료명 예)돼지고기"></div>
    <div class="igre-amount-block"><input type="text" placeholder="수량"></div>
    <div class="igre-unit-block"><input type="text" placeholder="단위"></div>
    <div class="delete-btn"><img src="/gorang/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteSmaillBlock(this)"></div>
    <button type="button">태그 +</button>`;
    return newBlock;
}

// 기존 묶음 아래에 추가
function addBundle(ev,num){
    ev.insertAdjacentElement('beforebegin', Inputs());
}

let num = 1;
// 기존 분류 추가
function addUnit(){
    let newBlock = document.createElement('div');
    newBlock.setAttribute('id', 'recipe-ingredient-info-blocks');
    
    let newId = "recipe-ingredient-info-blocks"+num;
    newBlock.id = newId;

    newBlock.innerHTML=` 
    <div class="recipe-ingredient-info-top">
    <div class="location-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Link.png" alt=""></div>
    <div class="ingre-div-block" >
        <input type="text" placeholder="분류 예)식재료">
    </div>
    <div class="delete-btn"><img src="${contextPath}/resources/dummyImg/recipe/recipeWrite/Icon.png" alt="" onclick="deleteIngreBlock()"></div>
    </div><div class="recipe-ingredient-info-bottom">`+ Inputs()+`</div>`;


    document.querySelector('#add-div-btn').insertAdjacentElement('beforebegin', newBlock);
}


