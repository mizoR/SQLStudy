module ApplicationHelper
  def dbconsole(sql, result)
    <<-"HTML".strip_heredoc.html_safe
<pre class="code"><code>#{h sql.chomp}

#{h Hirb::Helpers::AutoTable.render(result)}</code></pre>
    HTML
  end
end
