class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

    def index
        @posts = Post.all   
    end

    def show
        @post = Post.find(params[:id])
    end
    
    def new 
        @post =  @post = Post.new()
    end
    
    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to @post
      else
        render 'new'
      end 
    end

    private def post_params
        params.require(:post).permit(:category, :title, :body)
    end
    
end
