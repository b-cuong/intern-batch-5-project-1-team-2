module ApplicationHelper
  def full_title page_title = ""
    base_title = t(".railsapp")
    page_title.empty? ? base_title : "#{page_title} #{base_title}"
  end

  def list_categories
    Category.paginate page: params[:page]
  end
end
