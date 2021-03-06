class WelcomeController < ApplicationController
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
  end
end
