class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
    # includesメソッドで記述する際には、親モデルに対して子モデルの命名は複数形で記述する。
    # orderメソッドはDESCで記述すると指定したカラムの新しい順で記述する事ができる。
  end

  def new
    @product = Product.new
    @product.images.new
    # @productの中に、newメソッドを追記したい場合は、改行して上記のように記述する。
    # newメソッドとbuildメソッドの違いは、昔はbuildメソッドを使用しないと上手くnewができなかったが、今ではnewメソッドでできるようになっているのでbuildメソッドは使わない。
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "出品が確認できました"
      # 通知機能は下のファイルにて実装
      # app/views/layouts/application.html.haml
      redirect_to root_path
    else    
      @product.images.new
      flash.now[:alert] = "出品できません、もう一度入力してください"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :index
      flash.now[:alert] = "削除できませんでした"
    end
  end

private
  def product_params
    params.require(:product).permit(:name, 
                                    :text, 
                                    :category_id, 
                                    :condition, 
                                    :postage, 
                                    :days, 
                                    :area, 
                                    :price,
                                    images_attributes:[:name, :_destroy, :id]
                                    ).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
