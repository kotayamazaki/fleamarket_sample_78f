class ProductsController < ApplicationController

  def new
    @product = Product.new
    # @product.seller << current_user
    # @image = Image.new
  end

  def create
    @product = Product.new(product_params)
    # binding.pry
    if @product.save 
      # @image.save
      redirect_to root_path
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:name, 
                                    # :name, 
                                    :text, 
                                    :category_id, 
                                    :condition, 
                                    :postage, 
                                    :days, 
                                    :area, 
                                    :price,
                                    image_attributes: [:name, :product_id]
                                    ).merge(seller_id: current_user.id)
  end


end
