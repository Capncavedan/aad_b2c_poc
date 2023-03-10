class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    render :new
  end

  def create
    user_info = request.env['omniauth.auth']
    p user_info
    render plain: user_info # Your own session management should be placed here.
  end
end
