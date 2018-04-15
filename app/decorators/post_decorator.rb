class PostDecorator < Draper::Decorator
  delegate_all

  def title
    "title: #{object.title}"
  end
end
