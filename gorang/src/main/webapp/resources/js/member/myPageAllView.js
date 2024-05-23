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