class CallbacksController < ActionController::Base
  def handle
    render json: auth.info
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
