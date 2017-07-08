class LandingController < ApplicationController

  layout 'landing'

  before_action :check_session

  def home
  end

  private

  def check_session
    unless !session[:username]
      redirect_to( home_path )
    end
  end
end
