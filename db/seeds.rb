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
