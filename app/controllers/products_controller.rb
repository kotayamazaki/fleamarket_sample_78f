class ProductsController < ApplicationController

  def new
    @product = Product.new
    # @product.users << current_user
  end

  def create
    @product = Product.new(product_params)
    # binding.pry
    @product.save
    # @product.errors.messages
    # if @group.save
    #   redirect_to root_path, notice: 'グループを作成しました'
    # else
    #   render :new
    # end
  end

  def product_params
    params.require(:product).permit(:name, :name, :text, :category, :condition, :postage, :days, :area, :price)
  end


end
