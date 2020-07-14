
// 子カテゴリーを追加するための処理
  function buildChildHTML(child){
    var html =`<a class="CildrenMenu__List" id="${child.id}" 
                href="/items/${child.id}/select_category_index">${child.name}</a>`;
    return html;
  }
  function buildGrandChildHTML(grandchild){
    var html =`<a class="CildrenMenu__List" id="${grandchild.id}" 
                href="/items/${grandchild.id}/select_category_index">${grandchild.name}</a>`;
    return html;
  }