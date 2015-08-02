module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, _sub_comments|
      content_tag(:div, render(comment), class: 'alert alert-warning comment')
    end.join.html_safe
  end
end
