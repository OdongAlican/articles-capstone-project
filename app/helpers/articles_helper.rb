module ArticlesHelper
    def article_error(article)
        if article.errors.any?
            render :partial => 'errors'
        end
    end
end
