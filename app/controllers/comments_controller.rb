class CommentsController < ApplicationController
    #testing users id
    #before_action :authenticate_user!, except: [:index,:show]
    
    def new
       @comment = current_user.comments.build 
    end

    def create
          
       @post = Post.find(params[:post_id])
       @comment = @post.comments.create(comment_params)
       redirect_to post_path(@post) 
    end
    

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)   
    end

    

    private def comment_params
        params.require(:comment).permit(:username, :body)
    end
end
