PopTbl.all.delete_all
PopTbl.create!([
  {pref_name: '徳島', population: 100},
  {pref_name: '香川', population: 200},
  {pref_name: '愛媛', population: 150},
  {pref_name: '高知', population: 200},
  {pref_name: '福岡', population: 300},
  {pref_name: '佐賀', population: 100},
  {pref_name: '長崎', population: 200},
  {pref_name: '東京', population: 400},
  {pref_name: '群馬', population: 50},
])

PopTbl2.all.delete_all
PopTbl2.create!([
  {pref_name: '徳島', sex: 1, population: 60},
  {pref_name: '徳島', sex: 2, population: 40},
  {pref_name: '香川', sex: 1, population: 100},
  {pref_name: '香川', sex: 2, population: 100},
  {pref_name: '愛媛', sex: 1, population: 100},
  {pref_name: '愛媛', sex: 2, population:  50},
  {pref_name: '高知', sex: 1, population: 100},
  {pref_name: '高知', sex: 2, population: 100},
  {pref_name: '福岡', sex: 1, population: 100},
  {pref_name: '福岡', sex: 2, population: 200},
  {pref_name: '佐賀', sex: 1, population:  20},
  {pref_name: '佐賀', sex: 2, population:  80},
  {pref_name: '長崎', sex: 1, population: 125},
  {pref_name: '長崎', sex: 2, population: 125},
  {pref_name: '東京', sex: 1, population: 250},
  {pref_name: '東京', sex: 2, population: 150},
])
