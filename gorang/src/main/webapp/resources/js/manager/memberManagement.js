function searchMember() {
  const searchMemberValue = document.querySelector('#search-member-input').value;

  $.ajax({
    url: 'search-member.ma',
    type: 'get',
    data: {
      searchMember: searchMemberValue
    },
    success: function(res) {
      console.log(res);
    }, 
    error: function() {
      console.log("회원 검색 api 호출 실패");
    }

  })
}