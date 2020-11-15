class Brand < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'シャネル' },
    { id: 2, name: 'ルイヴィトン' },
    { id: 3, name: 'ナイキ' },
    { id: 4, name: 'アディダス' },
    { id: 5, name: 'シュプリーム' },
    { id: 13, name: 'その他' }
  ]
end