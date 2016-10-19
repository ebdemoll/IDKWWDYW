class HomeController < ApplicationController
  def show
      @token = params[:invite_token]
      session[:token] = @token
  end
end
