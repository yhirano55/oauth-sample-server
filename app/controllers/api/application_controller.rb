module Api
  class ApplicationController < ActionController::API
    before_action :doorkeeper_authorize!
  end
end
