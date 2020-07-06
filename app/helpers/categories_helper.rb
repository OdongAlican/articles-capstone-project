module CategoriesHelper
  def category_error(category)
    render partial: 'errors' if category.errors.any?
  end
end
