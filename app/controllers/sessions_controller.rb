class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(session_params)
    if user
      session[:user_id] = user.id
      flash[:success] = 'Invalid name/password combination'
      redirect_to categories_path
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
