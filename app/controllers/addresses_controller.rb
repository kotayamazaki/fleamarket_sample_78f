class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :new, :create]
  def index #詳細のようなページ作成
  end

  def new #アドレスを保存するためのフォーム作成
    @address = Address.new
  end

  def create
    @address = Address.new
    if @address.save
      flash[:notice] = "登録が確認できました"
      # 通知機能は下のファイルにて実装
      # app/views/layouts/application.html.haml
      redirect_to root_path
    else    
      flash.now[:alert] = "登録できません"
      render :new
    end
  end

  def edit #アドレスを保存するためのフォーム作成
  end

  def update
  end

  def destroy
  end

private
  def set_address
    @address = Address.find(params[:id])
  end

end
