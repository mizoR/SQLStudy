class SelfAdoptedController < ApplicationController
  def index
    @sql = <<-SQL.strip_heredoc
      -- 重複順列を得る SQL
      SELECT P1.name AS name_1, P2.name AS name_2
          FROM products P1, products P2;
    SQL
    @result = Product.find_by_sql(@sql)

    @sql2 = <<-SQL.strip_heredoc
      -- 順列を得る SQL
      SELECT P1.name AS name_1, P2.name AS name_2
          FROM products P1, products P2
          WHERE P1.name <> P2.name;
    SQL
    @result2 = Product.find_by_sql(@sql2)

    @sql3 = <<-SQL.strip_heredoc
      -- 組み合わせを得るSQL: 3列への拡張版
      SELECT P1.name AS name_1, P2.name AS name_2, P3.name AS name_3
          FROM products P1, products P2, products P3
          WHERE P1.name > P2.name
            AND P2.name > P3.name;
    SQL
    @result3 = Product.find_by_sql(@sql3)

    @sql4 = <<-SQL.strip_heredoc
      -- 自己非等値結合: 値段の高い順ランキング。1位から始まる。同順位が続いた後は不連続
      SELECT
              P1.name AS name,
              P1.price AS price,
              (SELECT COUNT(P2.price) FROM products2 P2 WHERE P2.price > P1.price) + 1 AS rank
          FROM products2 P1
          ORDER BY rank;
    SQL
    @result4 = Product.find_by_sql(@sql4)

    @sql5 = <<-SQL.strip_heredoc
      -- 自己結合: 値段の高い順ランキング。1位から始まる。同順位が続いた後は不連続
      SELECT
              P1.name AS name,
              MAX(P1.price) AS price,
              COUNT(P2.name) + 1 AS rank
          FROM products2 P1
              LEFT OUTER JOIN products2 P2 ON P1.price < P2.price
          GROUP BY P1.name
          ORDER BY rank;
    SQL
    @result5 = Product.find_by_sql(@sql5)
  end
end
