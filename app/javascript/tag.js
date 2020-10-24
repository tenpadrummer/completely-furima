if (location.pathname.match("items/new")){ //items/newのURLに一致しているか
  window.addEventListener("load", (e) => { //jsを動かす記述
    const inputElement = document.getElementById("item_tag_name"); //tagを入力するtext_areaのidを取得
    inputElement.addEventListener("keyup", (e) => { // 上記が取得でき、キーボードのキーを離したときにイベントを発生させる
      const input = document.getElementById("item_tag_name").value; //入力されたタグの値を取得
      const xhr = new XMLHttpRequest(); //Ajax (非同期通信) に使われる組み込みオブジェクト
      xhr.open("GET", `tag_search/?input=${input}`, true); //HTTPリクエストはGET、searchアクションへのパスを設定
      xhr.responseType = "json"; //レスポンスはJSONで返す
      xhr.send();
      xhr.onload = () => { //ajax通信が正常に動作したら動かす関数
        const tagName = xhr.response.keyword; //コントローラからきたJSONデータを受け取り代入。
        const searchResult = document.getElementById('search-result') //ビューのid="search-result"を取得
        searchResult.innerHTML = ''　//2文字目以降に重複して表示されないように、searchResultの中へ空文字を代入。
        tagName.forEach(function(tag){  //tagの要素だけ繰り返し取り出す
          const parentsElement = document.createElement('div') //検索結果を画面上に表示できるようdiv要素を作成。
          const childElement = document.createElement('div') //作成したdiv要素の中に、インクリメンタルサーチの結果のdivを作成。

          parentsElement.setAttribute('id', 'parents') //さきほど作成した要素にIDとクラス名を付与。
          childElement.setAttribute('id', tag.id ) //childElementには、表示させるタグのIDを代入。
          childElement.setAttribute('class', 'child' ) //また、CSSを当てるためにクラスも付与させています。

          parentsElement.appendChild(childElement) //parentsElementの子要素としてchildElementを追加。
          childElement.innerHTML = tag.tag_name // 次にchildElementに表示させるタグのHTMLを生成。
          searchResult.appendChild(parentsElement) //searchResultの子要素にparentsElementを追加。

          const clickElement = document.getElementById(tag.id)
          clickElement.addEventListener("click", () => { //候補として表示させたタグがクリックされると
            document.getElementById("item_tag_name").value = clickElement.textContent; //選択されたタグのテキスト要素を入力フォームの値としてセット
            clickElement.remove(); //選択されたタグは表示の一覧から削除。
          })
        })
      }
    })
  })
};