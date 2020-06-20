$(function() {
  function addUser(user) {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }
  function addDeleteUser(name, id) {
    let html = `
    <div class="chat-group-user clearfix" id="${id}">
      <p class="chat-group-user__name">${name}</p>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }
  $("#user-search-field").on("keyup", function() {
    let input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(users) {
        $("#user-search-result").empty();//userを探しているところ

        if (users.length !== 0) {//もしuserがゼロじゃない時
          users.forEach(function(user) {
            addUser(user);//2行目のaddUser使っている
          });
        } else if (input.length == 0) {//検索ヒットが0人の時に発火する
          return false;//検索ヒットが0人かつ文字がなにも入力されていない時
        } else {
          addNoUser();//検索ヒットが0人で文字が入力されている時に十二行目のユーザーが見つかりませんが使われる。
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });
  $(document).on("click", ".chat-group-user__btn--add", function() {//追加の追加をしている部分
    console.log
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    //検索されたuserの情報
    $(this).parent().remove();//追加ボタンの親要素の部分を取り除く
    addDeleteUser(userName, userId);//削除ボタン
    addMember(userId);//データベースに送るためのuserの番号を画面においている
  });
  $(document).on("click", ".chat-group-user__btn--remove", function() {//追加の追加の追加(削除ボタンを押した時のイベント)
    $(this).parent().remove();
   // 削除ボタンをなくす
  });
});