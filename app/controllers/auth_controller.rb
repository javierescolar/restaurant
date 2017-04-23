class AuthController < ApplicationController
  skip_before_action :authorize
  def index
    unless (!session[:auth].nil?)
      render :new
    end
  end

  def new
    if (session[:auth] != nil)
      render :index
    end
  end

  def create

    if ( @user = User.find_by(mail: params[:email],password: Digest::MD5.hexdigest(params[:password])))
      session[:auth] = @user
      session[:auth_id] = @user.id
      flash[:notice] = nil
      redirect_to root_path
    else
      flash[:notice] = 'Credentials not found ...'
      render 'new'
    end
  end

  def destroy
    # Remove the user id from the session
    session[:auth] = nil
    session[:auth_id] = nil
    render 'new'
  end
end
