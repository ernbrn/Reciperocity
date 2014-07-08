module ApplicationHelper
    def kramdown(text)
      return sanitize Kramdown::Document.new(text).to_html.html_safe
    end
end
