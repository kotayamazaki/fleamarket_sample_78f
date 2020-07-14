class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category
  
  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_kana, :family_kana, :birthday])
    # パスワード系はdeviceのデフォルトで実装されているため上記メソッドでpermitに記述する必要なし。(阿部)
  end

end
