function recipeImg(){
   recipecss=document.getElementById("recipe-btn");
   boardcss=document.getElementById("board-btn");

   recipecss.style.backgroundColor="#1E90FF";
   recipecss.style.zIndex ="1";

   boardcss.style.backgroundColor="#e6e6e6";
   boardcss.style.zIndex ="0";
    // background-color: #1E90FF;
    document.getElementById("banner-imgs-recipe").style.display="flex";
    document.getElementById("banner-imgs").style.display="none";
 
    
}

function BoardImg(){
    recipecss=document.getElementById("recipe-btn");
    boardcss=document.getElementById("board-btn");
 
    recipecss.style.backgroundColor="#e6e6e6";
    recipecss.style.zIndex ="0";
 
    boardcss.style.backgroundColor="#1E90FF";
    boardcss.style.zIndex ="1";

    document.getElementById("banner-imgs-recipe").style.display="none";
    document.getElementById("banner-imgs").style.display="flex";
}

function movePage(element) {

    const contentType = element.getAttribute('data-type');
    const contentNo = element.getAttribute('data-no');

    if(contentType === 'board') {
        window.location.href = "detail.bo?boardNo=" + contentNo;
    } else if(contentType === 'recipe') {
        window.location.href = "detail.re?recipeNo=" + contentNo;
    } else if (contentType === 'product') {
        window.location.href = "detail.po?pno=" + contentNo;
    }

}