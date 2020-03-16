class CallbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def handle
    # NOTE: 中継の場合は元のリクエストを再実行
    if ENV['IS_RELAY']
      session[:email] = auth.info['email']
      redirect_to session[:request_url]
    else
      user = User.find_by!(email: auth.info['email'])
      sign_in(user)
      redirect_to root_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
