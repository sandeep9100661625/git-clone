class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    def create 
        @post = Post.new(params.require(:post).permit(:heading,:description))
        @post.user = current_user
        if @post.save 
            flash[:notice] = "post successfully posted"
            redirect_to posts_path 
        else
            render 'new'
        end 
    end
    def show 
        @post = Post.find(params[:id])
    end
    def index
        @post = Post.all 
    end
    def edit 
        @post = Post.find(params[:id])
    end 
    def update
        @post = Post.find(params[:id])
        if @post.update(params.require(:post).permit(:heading,:description))
            flash[:notice] = "updated successfully"
            redirect_to posts_path
        else
            render 'edit'
        end
    end
    def destroy 
        @post = Post.find(params[:id])
        @post.destroy 
        flash[:notice] = "Deleted successfully"
        redirect_to posts_path
    end         
end
