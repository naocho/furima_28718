//モデルとの繋ぎは:でモデルを使用するが、javascriptはidで指定してつなげる。
// console.logでどこまでデータが通ってるか検証のコンソールで逐一確認する
window.addEventListener('load', function(){
  // ページ全体に効果を反映させる
  var form = document.getElementById("item-price")
  // テキスト全体をformに代入する
  form.addEventListener('input', function(){
    // inputで入力された数値をformに追加する
  var price = document.getElementById("item-price").value;
  // formでテキストに入力されたデータは数値化されてます。
  // ここまででデータ化された数値をpriceに代入する
  function tax_price(tax1,tax2){
  // 引数としてtax_price(tax1,tax2)を持ってくる
    tax_price  = tax1 * tax2
    return tax_price
  // ここで代入した値を掛け算してreturnで戻す
    }
    const tax1 = price
    const tax2 = 0.1
  // ここで必要なデータを代入データを今後変えさせないconstと代入するtaxにいれる
  tax__price = tax_price(tax1,tax2)
  // 戻した数値をさらに代入
  document.getElementById("add-tax-price").innerHTML = tax__price
  // 戻した数値を指定のIDに入れてページ上に表記させる
  // 表記させるコードは.innerHTML

  function tax_price2(tax11,tax12){
    tax_price2 = tax11 * tax12
    return tax_price2
    }
    const tax11 = price
    const tax12 = 0.9
  tax___price = tax_price2(tax11,tax12)
  document.getElementById("profit").innerHTML = tax___price
  //ここの記述も上と同じ様にして表記させる。
})
})
