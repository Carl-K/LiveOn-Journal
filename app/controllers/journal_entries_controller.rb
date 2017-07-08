class JournalEntriesController < ApplicationController

  layout 'journal'

  before_action :in_session

  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new

    @journal_entry.entry = params[:journal_entry][:entry]
    @journal_entry.entry_created_at = params[:journal_entry][:entry_created_at]
    @journal_entry.user_identification_username = session[:username]

    if @journal_entry.save
      flash[:notice] = ["Entry created successfully"]
      redirect_to( journal_entries_path )
    else
      flash.now[:notice] = @journal_entry.errors.full_messages
      render('new')
    end
  end

  def index
    # @journal_entries = JournalEntry.all
    @journal_entries = JournalEntry.where(:user_identification_username => session[:username]).order('entry_created_at DESC')
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
  end

  def update

  end

  def delete
    @journal_entry = JournalEntry.find(params[:id])
  end

  def destroy
    @journal_entry = JournalEntry.find(params[:id])

    @user_identification = UserIdentification.find_by(username: session[:username])

    valid_password = @user_identification.authenticate(params[:journal_entry][:current_password])

    if valid_password
      # @user_identification = UserIdentification.find_by(username: params[:username])
      if @journal_entry.destroy
        flash[:notice] = ["Entry deleted successfully"]
        redirect_to( journal_entries_path )
      else
        flash[:notice] = @journal_entry.errors.full_messages
        render('delete')
      end
    else
      flash.now[:notice] = ["Invalid password"]
      render('delete')
    end
  end

  private

  def in_session
    if !session[:username]
      flash[:notice] = ["Log in to continue"]
      redirect_to( root_url )
    end
  end

end
