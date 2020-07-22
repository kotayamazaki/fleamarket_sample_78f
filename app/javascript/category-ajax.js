// $(document).on('turbolinks:load', function(){
$(function () {
  // turbolinks:load' = 初回読み込み、リロード、ページ切り替えで動く。
  // カテゴリーの選択肢が入ったdiv
  var categoryBox = $(".select-default");

  // 親カテゴリー
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリー
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = "";
    childSelectHtml = `<br><select class= 'select-default input-default' id="child-select" name = product[category_id] required>
                         <option value>---</option>
                            ${insertHTML}
                        </select></br>`;
    categoryBox.after(childSelectHtml);
  }

  // 孫カテゴリー
  function appendgrandChildrenBox(insertHTML) {
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<br><select class= 'select-default input-default' id="grandchild-select" name = product[category_id] >
                              <option value>---</option>
                              ${insertHTML}
                            </select></br>`;
    $("#child-select").after(grandchildSelectHtml);
  }

  // カテゴリーボックスで親カテゴリが変わった場合
  $(".product-datas").on("change", "#parent-form", function () {
    // ".product-datas"を親要素としてる"#parent-form"が"change"した時に、function()を実行。
    var parentCategory = $("#parent-form").val();
    if (parentCategory !== "") {
      $.ajax({
        url: "/products/get_category_children",
        type: "GET",
        data: {
          parent_id: parentCategory,
        },
        dataType: "json",
      })
        .done(function (children) {
          console.log(children);
          $("#child-select").remove();
          $("#grandchild-select").remove();
          var insertHTML = "";
          children.forEach(function (child) {
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function () {
          alert("カテゴリー取得に失敗しました");
        });
      // } else {
      //   //親カテゴリーが初期値（---)の場合、子カテゴリー以下は非表示にする
      //   //親カテゴリが未選択の場合、子、孫カテゴリの選択欄は非表示にしたいので、そのように変更
      //   $('#child-select').remove();
      //   $('#grandchild-select').remove();
      //   $('#size').remove();
    }
  });

  // カテゴリーボックスで親カテゴリが変わった場合
  $(".product-datas").on("change", "#child-select", function () {
    // ".product-datas"を親要素としてる"#child-select"が"change"した時に、function()を実行。
    // var childCategory = $("#child-select").val();
    var childCategory = $("#child-select").val();
    console.log(childCategory);
    if (childCategory !== "") {
      $.ajax({
        url: "/products/get_category_grandchildren",
        type: "GET",
        data: {
          child_id: childCategory,
        },
        dataType: "json",
      })
        .done(function (children) {
          $("#grandchild-select").remove();
          var insertHTML = "";
          children.forEach(function (child) {
            insertHTML += appendOption(child);
          });
          appendgrandChildrenBox(insertHTML);
        })
        .fail(function () {
          alert("カテゴリー取得に失敗しました");
        });
    } else {
      //親カテゴリーが初期値（---)の場合、子カテゴリー以下は非表示にする
      //親カテゴリが未選択の場合、子、孫カテゴリの選択欄は非表示にしたいので、そのように変更
      $("#child-select").remove();
      $("#grandchild-select").remove();
    }
  });
});
