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

function movePage(element) {
    const contentNo = element.getAttribute('data-no');
    window.location.href = "detail.re?recipeNo=" + contentNo;
}

function sortRecipe(element) {
    const sortMethod = 
}