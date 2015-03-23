class CaseController < ApplicationController
  def index
    @sql = <<-SQL.strip_heredoc
      -- 県コードを地方コードに再分類する
      SELECT CASE pref_name
                WHEN '徳島' THEN '四国'
                WHEN '香川' THEN '四国'
                WHEN '愛媛' THEN '四国'
                WHEN '高知' THEN '四国'
                WHEN '福岡' THEN '九州'
                WHEN '佐賀' THEN '九州'
                WHEN '長崎' THEN '九州'
             ELSE 'その他' END AS district,
             SUM(population) AS population
          FROM pop_tbls
      GROUP BY district;
    SQL
    @result = PopTbl.find_by_sql(@sql)

    @sql2 = <<-SQL.strip_heredoc
      -- 人口階級ごとに都道府県を分類する
      SELECT CASE WHEN population <  100                      THEN '01'
                  WHEN population >= 100 AND population < 200 THEN '02'
                  WHEN population >= 200 AND population < 300 THEN '03'
                  WHEN population >= 300                      THEN '04'
             ELSE NULL END AS pop_class,
             COUNT(*) AS cnt
          FROM pop_tbls
      GROUP BY pop_class;
    SQL
    @result2 = PopTbl.find_by_sql(@sql2)

    @sql3 = <<-SQL.strip_heredoc
      -- 男女別・県の人数の合計を求める
      SELECT pref_name,
             -- 男性の人口
             SUM( CASE WHEN sex = 1 THEN population ELSE 0 END ) AS cnt_m,
             -- 女性の人口
             SUM( CASE WHEN sex = 2 THEN population ELSE 0 END ) AS cnt_f
          FROM pop_tbl2s
      GROUP BY pref_name;
    SQL
    @result3 = PopTbl.find_by_sql(@sql3)

    @sql4 = <<-SQL.strip_heredoc
      -- テーブルのマッチング : IN述語の利用
      SELECT course_name,
             CASE WHEN course_id IN
                    (SELECT course_id FROM open_courses WHERE month = 200706) THEN 'o'
                  ELSE 'x' END AS June,
             CASE WHEN course_id IN
                    (SELECT course_id FROM open_courses WHERE month = 200707) THEN 'o'
                  ELSE 'x' END AS July,
             CASE WHEN course_id IN
                    (SELECT course_id FROM open_courses WHERE month = 200708) THEN 'o'
                  ELSE 'x' END AS August
        FROM course_masters;
    SQL
    @result4 = CourseMaster.find_by_sql(@sql4)

    @sql4_2 = <<-SQL.strip_heredoc
      -- テーブルのマッチング : EXISTS述語の利用
      SELECT course_name,
             CASE WHEN EXISTS (SELECT course_id FROM open_courses AS OC
                                WHERE month = 200706
                                  AND OC.course_id = CM.course_id) THEN 'o'
                  ELSE 'x' END AS June,
             CASE WHEN EXISTS (SELECT course_id FROM open_courses AS OC
                                WHERE month = 200707
                                  AND OC.course_id = CM.course_id) THEN 'o'
                  ELSE 'x' END AS July,
             CASE WHEN EXISTS (SELECT course_id FROM open_courses AS OC
                                WHERE month = 200708
                                  AND OC.course_id = CM.course_id) THEN 'o'
                  ELSE 'x' END AS August
        FROM course_masters AS CM;
    SQL
    @result4_2 = CourseMaster.find_by_sql(@sql4_2)

    @sql5 = <<-SQL.strip_heredoc
      -- 条件1: 1つだけのクラブに所属している学生については、そのクラブIDを取得する
      -- 条件2: 複数のクラブを掛け持ち7エル学生については、主なクラブのIDを取得する
      SELECT std_id,
             CASE WHEN COUNT(*) = 1
                  THEN MAX(club_id)
                  ELSE MAX(CASE WHEN main_club_flg = 1 THEN club_id
                                ELSE NULL END)
                  END AS club_id
        FROM student_clubs GROUP BY std_id;
    SQL
    @result5 = StudentClub.find_by_sql(@sql5)
  end
end
