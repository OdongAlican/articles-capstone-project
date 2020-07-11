module ApplicationHelper
  def like_or_dislike_btn(article)
    if current_user
      vote = Vote.find_by(article: article, user: current_user)
      if vote
        link_to('Downvote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'btn btn-warning')
      else
        link_to('Vote!', article_votes_path(article_id: article.id), method: :article, class: 'btn btn-primary')
      end
    end
  end

  def update_article
    render partial: 'rights' unless current_user.nil?
  end

  def update_category
    render partial: 'authority' unless current_user.nil?
  end

  def category_status(category)
    if !category.articles.empty?
      render partial: 'catlength'
    else
      render partial: 'emtycat'
    end
  end

  def permit_update(article)
    render partial: 'form' if logged_in? && (current_user.id == article.author.id || current_user.admin?)
  end

  def delete_article(article)
    render partial: 'edit_delete' if logged_in? && (current_user.id == article.author.id || current_user.admin?)
  end

  def permit_category(category)
    render partial: 'form' if logged_in? && (current_user.id == category.user_id || current_user.admin?)
  end

  def delete_category(category)
    render partial: 'edit_delete' if logged_in? && (current_user.id == category.user_id || current_user.admin?)
  end

  def famous_article(articles)
    if articles
      render partial: 'famous'
    else
      render partial: 'infamous'
    end
  end

  def all_categories(categories)
    if !categories.empty?
      render partial: 'catlist'
    elsif logged_in? && categories.empty?
      link_to('New Category', new_category_path, class: 'btn btn-primary ml-3 mt-2')
    end
  end

  def order_categories(category)
    if !category.articles.empty?
      render partial: 'cat_articles', locals: { category: category }
    else
      render partial: 'no_articles', locals: { category: category }
    end
  end

  def new_category
    link_to('New Category', new_category_path, class: 'btn btn-success mt-2 mx-2') if logged_in?
  end

  def cat_in_articles(form)
    render partial: 'cat_list', locals: { form: form } if current_user && Category.any?
  end

  def user_logged
    current_user.name if logged_in?
  end

  def any_category(category)
    category.name unless @categories.empty?
  end
end
