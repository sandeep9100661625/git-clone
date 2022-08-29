class SessionsController < ApplicationController
    def new
    end
    def create
        @users = User.find_by(params[:email])
        if @users && @users.authenticate(params[:session][:password])
            session[:user_id] = @users.id
            flash.now[:alert] = "hi #{@users.username}! you have successfully logged in"
            redirect_to users_path
        else
            flash.now[:alert] = "wrong credentials"
            render 'new'
        end
    end
    def destroy 
        session[:user_id] = nil
        flash.now[:alert] = "hey successfully logged out"
        render 'new'
    end
end
