module ChangesHelper
  def format_diff(string)
    lines = string.split(/$/)
    page = Page.find(lines[1].scan(/pages\/(\d+)/).first.first)
    content_tag(:p, link_to(page.title, page)) + 
    content_tag(:pre) do 
      lines.reject{|line| ['---', '+++'].include?(line.strip[0,3]) || !['+', '-'].include?(line.strip[0,1]) }.join("\n")
    end
  end
end