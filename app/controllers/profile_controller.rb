class ProfileController < ApplicationController

  layout 'profile'

  before_action :in_session

  def home
    current_user = UserIdentification.find_by(:username => session[:username])
    @recents = JournalEntry.where("User_identification_username != ?", session[:username]).order("entry_created_at DESC").limit(10)
  end

  def settings
  end

  def other_user
    @other_user = UserIdentification.find_by(:username => params[:username])
    @their_entries = JournalEntry.all.where(:user_identification_username => params[:username]).order("entry_created_at DESC")
  end

  private

  def in_session
    if !session[:username]
      flash[:notice] = ["Log in to continue"]
      redirect_to( root_url )
    end
  end

end
