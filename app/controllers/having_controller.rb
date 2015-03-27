class HavingController < ApplicationController
  def index
    @sql = <<-SQL.strip_heredoc
        -- 結果が返れば歯抜けあり
        SELECT '歯抜けあり' AS gap
            FROM seq_tbls
        HAVING COUNT(*) <> MAX(seq);
    SQL
    @result = SeqTbl.find_by_sql(@sql)

    @sql2 = <<-SQL.strip_heredoc
        -- 歯抜けの最小を探す
        SELECT MIN(seq + 1) AS gap
                FROM seq_tbls
            WHERE (seq + 1) NOT IN (SELECT seq FROM seq_tbls);
    SQL
    @result2 = SeqTbl.find_by_sql(@sql2)

    @sql3 = <<-SQL.strip_heredoc
        -- 最頻値を求める
        SELECT income, COUNT(*) AS cnt
                FROM graduates
            GROUP BY income
                HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM graduates GROUP BY income);
    SQL
    @result3 = SeqTbl.find_by_sql(@sql3)

    @sql4 = <<-SQL.strip_heredoc
        -- メジアンを求める。自己非等値結合をHAVING句で使う
        SELECT AVG(DISTINCT income)
            FROM (
                SELECT T1.income FROM graduates T1, graduates T2
                    GROUP BY T1.income
                        -- 収入順の下位半分 + 1
                        HAVING SUM(CASE WHEN T2.income >= T1.income THEN 1 ELSE 0 END) >= COUNT(*) / 2
                        -- 収入順の上位半分 + 1
                           AND SUM(CASE WHEN T2.income <= T1.income THEN 1 ELSE 0 END) >= COUNT(*) / 2
            ) TMP;
    SQL
    @result4 = SeqTbl.find_by_sql(@sql4)
  end
end
