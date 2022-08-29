class UsersController < ApplicationController
    before_action :set_action, only: [:show,:edit,:update,:destroy]
    def show
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(params.require(:user).permit(:username,:email,:phone,:password))
        if @user.save
            session[:user_id] = @user.id 
            redirect_to users_path
        else
            render 'new'
        end
    end
    def index
        @user = User.all
    end

    def edit
    end
    def update
        if @user.update(params.require(:user).permit(:username,:email,:phone,:password))
            redirect_to user_path(@user.id)
        else 
            render 'edit'
        end
    end

    private
    def set_action
        
        @user = User.find(params[:id])
    end
end
