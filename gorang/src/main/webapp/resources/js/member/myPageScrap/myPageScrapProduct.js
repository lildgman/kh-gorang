// 편집 => 삭제 변경
function editBtn(){
    document.getElementById("delete-edit").style.display="none";
    document.getElementById("delete-like").style.display="block";
    
    let checkboxes = document.querySelectorAll('.delete-check');
    checkboxes.forEach(function(checkbox) {
        checkbox.style.display ="block";
    });
    
}

//삭제하기
function deleteBtn(){
    let scraplist = document.querySelectorAll("#scrap-area-content .scrap-content");
    console.log(scraplist);
    scraplist.forEach(function(scrap){
        checkbox=scrap.querySelector("#delete-check");
        if(checkbox.checked){
            scrap.remove();
        }
    })

    document.getElementById("delete-edit").style.display="block";
    document.getElementById("delete-like").style.display="none";
    let checkboxes = document.querySelectorAll('.delete-check');
    checkboxes.forEach(function(checkbox) {
        checkbox.style.display ="none";
    });
}

