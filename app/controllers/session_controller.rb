class SessionController < ApplicationController

  layout 'landing'

  before_action :can_sign_in, :only => [:sign_in, :attempt_sign_in]
  before_action :can_sign_out, :only => [:attempt_sign_out]

  def sign_in
  end

  def attempt_sign_in

    user = UserIdentification.find_by(username: params[:username])

    if user

      valid_user = user.authenticate( params[:password] )

      if valid_user
        session[:username] = valid_user[:username]
        flash[:notice] = ["#{valid_user[:username]} successfully signed in!"]
        redirect_to(root_url)
      else
        flash.now[:notice] = ["Invalid username/password"]
        render('sign_in')
      end

    else
      flash.now[:notice] = ["Invalid username/password"]
      render('sign_in')
    end
  end

  def attempt_sign_out
    signed_out_user = session[:username]
    session[:username] = nil
    flash[:notice] = ["#{signed_out_user} successfully signed out!"]
    redirect_to(root_url)
  end

  private

    def can_sign_in
      if session[:username]
        redirect_to(root_url)
      end
    end

    def can_sign_out
      if !session[:username]
        redirect_to(root_url)
      end
    end

end
