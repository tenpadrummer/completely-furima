if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("DOMContentLoaded", () => { //ページが読み込まれたときに動作する関数
    const ImageList = document.getElementById('image-list'); //画像を表示するidを取得

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div'); //divタグを生成

      imageElement.setAttribute('class', "image-element") //生成したdiv要素にimage-elementというid名を付与する
      let imageElementNum = document.querySelectorAll('.image-element').length //idがimage-elementの要素がついたものがブラウザにいくつ存在するかの数字を、変数imageElementNumに代入。

      const blobImage = document.createElement('img'); //imgを生成
      blobImage.setAttribute('src', blob); //imgの属性にsrcをセット。その際に画像情報のURLを渡す

      const inputHTML = document.createElement('input') //file_fieldのinputを生成
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`) //生成するinputのid属性
      inputHTML.setAttribute('name', 'item[images][]') //生成するinputのname属性
      inputHTML.setAttribute('type', 'file')　//生成するinputのtype属性

      imageElement.appendChild(blobImage); //生成した要素をブラウザに表示
      imageElement.appendChild(inputHTML); //生成したinputをブラウザに表示
      ImageList.appendChild(imageElement); //#image-listの中に表示

      inputHTML.addEventListener('change', (e) => { //inputHTMLにあるfile_fieldで画像を選択し、要素が変わった際に動く関数
        file = e.target.files[0]; //inputの中にある画像を取得し、変数に代入
        blob = window.URL.createObjectURL(file); //取得した画像情報のURLを生成
        createImageHTML(blob)
      });
    };

    document.getElementById('item_image').addEventListener('change', function(e){ //file_fieldで画像を選択し、要素が変わった際に動く関数
      const file = e.target.files[0]; //inputの中にある画像を取得し、変数に代入
      const blob = window.URL.createObjectURL(file); //取得した画像情報のURLを生成
      createImageHTML(blob);
    });
  });
}