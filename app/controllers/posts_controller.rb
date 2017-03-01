class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')

  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to root_path
  end

  #def show
  #end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to root_path(anchor: "post_#{@post.id}")
  end

  def destroy
    @post.image = nil
    @post.save
    @post.destroy
    redirect_to root_path
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:caption, :image, :restaurant, :location, :menu, :price)
    end

    def owned_post
      unless current_user == @post.user
        redirect_to root_path
      end
    end

end
