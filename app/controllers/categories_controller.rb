class CategoriesController < ApplicationController
  before_action :set_category_list
  
  def index
  end

  def show
  end
  
  def set_category_list
    @category_parent_array = Category.where(ancestry: nil)
    # binding.pry
  end
end
