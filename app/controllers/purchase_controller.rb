class PurchaseController < ApplicationController
  require 'payjp'
  
  def index
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def pay
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
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
                                    # productテーブルにデータを保存する際に、imageテーブルに一緒に保存する為に”images_attributes:”のように記述してどのカラムに入るか設定する。
                                    ).merge(buyer_id: current_user.id)
  end

  def done
  end

end
