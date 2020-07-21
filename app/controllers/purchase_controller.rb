class PurchaseController < ApplicationController
  require 'payjp'
  
  def pay
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end
  
  def done
    @product = Product.find(params[:id])
    @product.update(buyer_id: current_user.id)
  end

# private

#   def product_params
#     params.require(:product).permit(
#                                     :buyer_id
#                                     ).merge(buyer_id: current_user.id)
#   end
# 一つのカラムに対して、情報を編集する場合はupdateを使うことで更新することができる。

end
