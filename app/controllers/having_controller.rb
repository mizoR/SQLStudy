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
  end
end
