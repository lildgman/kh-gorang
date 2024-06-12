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
  const followerCount = memberInfo.followerCount;
  const followingCount = memberInfo.followingCount;
  const totalScrapCount = memberInfo.totalScrapCount;
  const totalLikeCount = memberInfo.totalLikeCount;

  const userFollowerDiv = document.querySelector('#user-follower');
  const userFollowingDiv = document.querySelector('#user-following');
  const userScrapCountDiv = document.querySelector('#user-scrap-count');
  const userLikeCountDiv = document.querySelector('#user-like-count');
  
  userFollowerDiv.innerText = followerCount;
  userFollowingDiv.innerText = followingCount;
  userScrapCountDiv.innerText = totalScrapCount;
  userLikeCountDiv.innerText = totalLikeCount;
}