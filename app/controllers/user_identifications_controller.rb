class UserIdentificationsController < ApplicationController

  # layout 'access', :only => [:new, :create]
  # layout 'profile', :only => [:edit, :update]

  layout :choose_layout

  def new
    @user_identification = UserIdentification.new
  end

  def create
    @user_identification = UserIdentification.new(user_identification_params)

    if @user_identification.save
      session[:username] = @user_identification.username
      flash[:notice] = ["#{@user_identification.username} created successfully"]
      redirect_to(root_path)
    else
      flash.now[:notice] = @user_identification.errors.full_messages
      render('new')
    end
  end

  def index
    @user_identifications = UserIdentification.all
  end

  def show
    @user_identification = UserIdentification.find_by(username: params[:username])
  end

  def edit
    @user_identification = UserIdentification.find_by(username: params[:username])
  end

  def update
    @user_identification = UserIdentification.find_by(username: params[:username])

    valid_password = @user_identification.authenticate(params[:user_identification][:current_password])

    if valid_password

      password_password_confirmation_match = params[:user_identification][:password] == params[:user_identification][:password_confirmation]

      if password_password_confirmation_match

        if @user_identification.update_attributes(password: params[:user_identification][:password], password_confirmation: params[:user_identification][:password_confirmation])
          flash[:notice] = ["#{@user_identification.username} updated successfully"]
          redirect_to(root_url)
        else
          flash.now[:notice] = @user_identification.errors.full_messages
          render('edit')
        end

      else
        flash.now[:notice] = ["password/password confirmation mismatch"]
        render('edit')
      end

    else
      session[:username] = nil
      flash[:notice] = ["invalid current password - logged out for security"]
      redirect_to(root_url)
    end

  end

  def delete
    @user_identification = UserIdentification.find_by(username: params[:username])
  end

  def destroy
    @user_identification = UserIdentification.find_by(username: params[:username])

    valid_password = @user_identification.authenticate(params[:user_identification][:current_password])

    if valid_password
      # @user_identification = UserIdentification.find_by(username: params[:user_identification][:username])
      if @user_identification.destroy
        session[:username] = nil
        flash[:notice] = ["#{@user_identification.username} deleted successfully"]
        redirect_to(root_url)
      else
        flash[:notice] = @user_identification.errors.full_messages
        render('delete')
      end
    else
      session[:username] = nil
      flash[:notice] = ["invalid current password - logged out for security"]
      redirect_to(root_url)
    end
  end

  private

  def user_identification_params
    params.require(:user_identification).permit(:username, :password, :password_confirmation)
  end

  def choose_layout
    if action_name == 'new' || action_name == 'create'
      return 'landing'
    else
      return 'profile'
    end
  end

end
