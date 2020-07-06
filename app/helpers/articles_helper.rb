module ArticlesHelper
  def article_error(article)
    render partial: 'errors' if article.errors.any?
  end

  def article_create
    link_to('New Article', new_article_path, class: 'btn btn-success mt-1') if current_user
  end

  def article_header
    content_tag(:h4, 'Articles Page') unless @articles.empty?
  end
end
