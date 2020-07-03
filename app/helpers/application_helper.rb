module ApplicationHelper
  def like_or_dislike_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Downvote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'btn btn-warning')
    else
      link_to('Vote!', article_votes_path(article_id: article.id), method: :article, class: 'btn btn-primary')
    end
  end

  def update_article
    if current_user != nil
        render :partial => 'rights'
    end
  end

  def update_category
    if current_user != nil
      render :partial => 'authority'
    end
  end

  def category_status(category)
    if category.articles.length > 0
      render :partial => 'catlength'
    else
      render :partial => 'emtycat'
    end
  end

  def permit_update(article)
    if logged_in? && current_user.id == article.author.id 
        render :partial => 'form'
    else
        render :partial => 'info'
    end
  end

  def permit_category(category)
    if logged_in? && current_user.id == @category.user_id 
        render :partial =>  'form'
    else
        render :partial =>  '/articles/info'
    end
  end

  def famous_article(articles)
    if articles
      render :partial =>'famous'
    else
      render :partial => 'infamous'
    end
  end

  def all_categories(categories)
    if categories.length > 0
      render :partial => 'catlist'
    elsif logged_in? && categories.length == 0
        link_to('New Category', new_category_path , class: "btn btn-primary ml-3 mt-2")
    end
  end

  def order_categories(category)
    if category.articles.length > 0 
      render :partial => 'cat_articles', :locals => {:category => category}
    else
      render :partial => 'no_articles', :locals => {:category => category}
    end
  end
end
