
//레시피 직접 찾기 모달창
function viewModal(){
    document.getElementById("myModal").style.display = "block";
    // let h= document.querySelector(".header jsp");
    // console.log(h);
    document.getElementById("closeModalBtn").addEventListener("click", function() {
    document.getElementById("myModal").style.display = "none";
    });
}
// 엔터로 쳐도 검색가능
function handleKeyPress(ev){
    if (ev.key === 'Enter') {
        findSearch();
    }
}
// 모달 레시피 검색창
function findSearch(){
    let result =document.getElementById('input-igretext').value;
    let igreList = document.querySelectorAll(".row-igre-area");
    igreList.forEach(function (igre){
        let igreName = igre.querySelectorAll('span')[0];
        let partIgre=igreName.parentElement;
        if( igreName.innerHTML.includes(result)){
            // console.log(partIgre);
            partIgre.style.display='flex';
        }
        else{
            partIgre.style.display='none';
        }
    })
}

let f=0;
//레시피 모두 추가 
function findSelectAll(){
    let igreList = document.querySelectorAll(".row-igre-area");
    // console.log(1);
    if(f===0){
        igreList.forEach(function(igre){
            igre.querySelector("input[type='checkbox']").checked=true;
        })
        f=1;
    }else{
        igreList.forEach(function(igre){
            igre.querySelector("input[type='checkbox']").checked=false;
        })
        f=0;
    }
}


// 식재료 추가하기 모달창
function viewModal2(){
    document.getElementById("myModal-two").style.display = "block";
    // 식재료 추가 모달창 => 체크 박스 클릭시 소비기한표시
    document.getElementById("closeModalBtn2").addEventListener("click", function() {
        document.getElementById("myModal-two").style.display = "none";
    });
}
// 엔터로 쳐도 검색가능
function handleKeyPress2(ev){
    if (ev.key === 'Enter') {
        findSearch2();
    }
}
// 모달 식재료 추가 검색창
function findSearch2(){
    let result =document.getElementById('input-igretext2').value;
    let igreList = document.querySelectorAll(".overflow-tr");
    igreList.forEach(function (igre){
        let igreName = igre.querySelectorAll('td')[2];
        let partIgre=igreName.parentElement;
        if( igreName.innerHTML.includes(result)){
            // console.log(partIgre);
            igre.style.display='flex';
        }
        else{
            igre.style.display='none';
        }
    })
}

// 체크박스 체크시
function checkBoxStatus(el){
    const row = el.closest('tr');
    if(el.checked===true){
        row.querySelector('.direct-input-label').style.display='inline';
        row.querySelector('.direct-input').style.display='inline';
    }
    else{
        row.querySelector('.direct-input-label').style.display='none';
        row.querySelector('.direct-input').style.display='none';
    }
}


// 모달창 식재료 모두 추가 
let c = 0;
function addSelectAll(){
    let ingreArrays = document.querySelectorAll(".overflow-tr");
    if(c===0){
        ingreArrays.forEach(function(ingreArray){
            let checkbox= ingreArray.querySelector(".td-checkbox input[type='checkbox']");
            checkbox.checked=true;
            checkBoxStatus(checkbox);
            
        })
        c=1;
    }
    else{
        ingreArrays.forEach(function(ingreArray){
            let checkbox= ingreArray.querySelector(".td-checkbox input[type='checkbox']");
            checkbox.checked=false;
            checkBoxStatus(checkbox);
        })
        c=0;  
    }
}


// 식재료 삭제 
function delteIngre(el){
    document.querySelector("tr-block").remove();
}


