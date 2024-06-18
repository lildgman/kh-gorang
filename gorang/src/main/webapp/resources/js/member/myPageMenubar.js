document.addEventListener('DOMContentLoaded', function() {

  $.ajax({
    url: 'info.me',
    type: 'get',
    success: function(res) {
      drawMemberInfo(res);
    },
    error: function() {
      console.log('회원정보 불러오기 api 호출 실패');
    }
  })
})

function drawMemberInfo(memberInfo) {

  const userFollowerDiv = document.querySelector('#user-follower');
  const userFollowingDiv = document.querySelector('#user-following');
  const userScrapCountDiv = document.querySelector('#user-scrap-count');
  const userLikeCountDiv = document.querySelector('#user-like-count');

  const followerCount = memberInfo.followerCount;
  const followingCount = memberInfo.followingCount;
  const totalScrapCount = memberInfo.totalScrapCount;
  const totalLikeCount = memberInfo.totalLikeCount;

  userFollowerDiv.innerText = followerCount;
  userFollowingDiv.innerText = followingCount;
  userScrapCountDiv.innerText = totalScrapCount;
  userLikeCountDiv.innerText = totalLikeCount;
}

function movePage(element) {

  const type = element.getAttribute('data-type');

  if(type === 'scrap') {
    window.location.href = "scrapRecipe.me";
  } else if (type === 'like') {
    window.location.href = "likeRecipe.me";
  }
}