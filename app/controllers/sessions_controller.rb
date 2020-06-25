class SessionsController < ApplicationController
    def new; end
  
    def create
      user = User.find_by(username: params[:session][:username])
      if user
        session[:user_id] = user.id
        flash[:success] = 'Invalid username/password combination'
        redirect_to user_path(user)
      else
        flash.now[:danger] = 'Invalid username/password combination'
        render 'new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:success] = 'You have logged out'
      redirect_to root_path
    end
  end
  