class CallbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def handle
    user = User.find_by!(email: auth.info['email'])
    sign_in(user)
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
