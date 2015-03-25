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
  end
end
