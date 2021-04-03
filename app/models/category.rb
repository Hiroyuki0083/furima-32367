class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '--' },
    { id: 2, category: '経済' },
    { id: 3, category: '政治' },
    { id: 4, category: '地域' },
    { id: 5, category: '国際' },
    { id: 6, category: 'IT' },
    { id: 7, category: 'エンタメ' },
    { id: 8, category: 'スポーツ' },
    { id: 9, category: 'グルメ' },
    { id: 10, category: 'その他' }
  ]

  end