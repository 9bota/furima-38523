class ApplicationController < ActionController::Base
  #Basic認証
  before_action :basic_auth

  private

  #Basic認証メソッド
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む
    end
  end

end
