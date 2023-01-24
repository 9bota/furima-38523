class ApplicationController < ActionController::Base
  #Basic認証
  before_action :basic_auth
  # deviseコントローラー時に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #Basic認証メソッド
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む
    end
  end
  # 登録時下記も許可するためのストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

end
