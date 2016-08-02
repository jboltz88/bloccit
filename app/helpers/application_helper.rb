module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  def user_has_posted(user)
    user.posts.length > 0 || user.comments.length > 1
  end
end
