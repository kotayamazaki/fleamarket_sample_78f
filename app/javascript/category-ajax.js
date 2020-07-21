$(document).on('turbolinks:load', function(){
  // turbolinks:load' = 初回読み込み、リロード、ページ切り替えで動く。
  // カテゴリーの選択肢が入ったdiv
  var categoryBox = $('.select-default')
  
  // 親カテゴリー
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
    return html
  }

  // 子カテゴリー
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `<div class='form-select' id="child-category">
                        <select class= 'select-default' name="product[category_ids][]">
                            <option value>---</option>
                            ${insertHTML}
                          </select>                      
                      </div>`
    categoryBox.after(childSelectHtml);
  }
  
  // カテゴリーボックスで親カテゴリが変わった場合
  $(".product-datas").on("change", "#parent-form", function(){
    var parentCategory = $("#parent-form").val()
    if(parentCategory !== "") {
      $.ajax ({
        url: '/products/get_category_children',
        type: "GET",
        data: {
          parent_id: parentCategory
        },
        dataType: 'json'
      })
      .done(function(children){
        console.log(children)
        $('#child-category').remove();
        $('#grandchild-category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      //親カテゴリーが初期値（---)の場合、子カテゴリー以下は非表示にする
      //親カテゴリが未選択の場合、子、孫カテゴリの選択欄は非表示にしたいので、そのように変更
      $('#child-category').remove(); 
      $('#grandchild-category').remove();
      $('#size').remove();
    }
  })
})