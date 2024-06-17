function deleteRecipeBoard(element){

    const result = confirm('정말 레시피를 삭제하시겠습니까?');
    
    if(result) {
        const recipeContainer = element.closest('.myPage-board-list-block');
        const recipeNo = parseInt(recipeContainer.querySelector('.myPage-board-img').getAttribute('data-no'));
        
        $.ajax({
            url: 'remove-recipe.me',
            type: 'post',
            data: {
                recipeNo : recipeNo
            },
            success: function(res) {
                if(res === 'done') {
                    alert("레시피를 삭제하였습니다.");
                    recipeContainer.remove();
                } else {
                    alert("레시피 삭제를 실패하였습니다.");
                }

            },
            error: function() {
                console.log("나의 레시피 삭제 api 호출 실패");
            }
        })
        
    }
    
}

//레시피 수정하기
function updateRecipeBoard(element){
        const recipeContainer = element.closest('.myPage-board-list-block');
        const recipeNo = parseInt(recipeContainer.querySelector('.myPage-board-img').getAttribute('data-no'));
        window.location.href = `updateForm.re?recipeNo=${recipeNo}`;
    
}


function movePage(element) {
    const contentNo = element.closest('.myPage-board-list-block');
    const recipeNo = parseInt(contentNo.querySelector('.myPage-board-img').getAttribute('data-no'));
    window.location.href = `detailForm.re?recipeNo=${recipeNo}`;
}

function sortRecipe(element) {
    const sortingMethod = element.getAttribute('data-sort');
    window.location.href = "recipe.me?sort=" + sortingMethod;
}