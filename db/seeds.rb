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

CourseMaster.all.delete_all
CourseMaster.create!([
  {course_id: 1, course_name: '経理入門'},
  {course_id: 2, course_name: '財務知識'},
  {course_id: 3, course_name: '簿記検定'},
  {course_id: 4, course_name: '税理士'},
])

OpenCourse.all.delete_all
OpenCourse.create!([
  {month: 200706, course_id: 1},
  {month: 200706, course_id: 3},
  {month: 200706, course_id: 4},
  {month: 200707, course_id: 4},
  {month: 200708, course_id: 2},
  {month: 200708, course_id: 4},
])

StudentClub.all.delete_all
StudentClub.create!([
  {std_id: 100, club_id: 1, club_name: '野球',         main_club_flg: 'Y'},
  {std_id: 100, club_id: 2, club_name: '吹奏楽',       main_club_flg: 'N'},
  {std_id: 200, club_id: 2, club_name: '吹奏楽',       main_club_flg: 'N'},
  {std_id: 200, club_id: 3, club_name: 'バドミントン', main_club_flg: 'Y'},
  {std_id: 200, club_id: 4, club_name: 'サッカー',     main_club_flg: 'N'},
  {std_id: 300, club_id: 4, club_name: 'サッカー',     main_club_flg: 'N'},
  {std_id: 400, club_id: 5, club_name: '水泳',         main_club_flg: 'N'},
  {std_id: 500, club_id: 6, club_name: '囲碁',         main_club_flg: 'N'},
])

Product.all.delete_all
Product.create!([
  {name: 'りんご', price: 100},
  {name: 'みかん', price: 50},
  {name: 'バナナ', price: 80},
])
