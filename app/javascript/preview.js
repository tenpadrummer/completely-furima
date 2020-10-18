if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("DOMContentLoaded", () => { //ページが読み込まれたときに動作する関数
    const ImageList = document.getElementById('image-list'); //画像を表示するidを取得

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div'); //divタグを生成
      const blobImage = document.createElement('img'); //imgを生成
      blobImage.setAttribute('src', blob); //imgの属性にsrcをセット。その際に画像情報のURLを渡す
      imageElement.appendChild(blobImage); //生成した要素をブラウザに表示
      ImageList.appendChild(imageElement); //#image-listの中に表示
    };

    document.getElementById('item_image').addEventListener('change', function(e){ //file_fieldで画像を選択し、要素が変わった際に動く関数
      const imageContent = document.querySelector('img');　// 画像が表示されている場合、すでに存在している画像を削除する
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0]; //inputの中にある画像を取得し、変数に代入
      const blob = window.URL.createObjectURL(file); //取得した画像情報のURLを生成
      createImageHTML(blob);
    });

  });
}