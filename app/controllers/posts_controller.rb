class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :like]

  def index
    @posts = Post.all
  end


  def show
  end

  def new
    @post = Post.new
    set_select_values
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      set_select_values
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      set_select_values
      render :edit
    end
  end

  def like
    @post.add_one_like!
    redirect_to @post
  end


  private

  def find_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def set_select_values
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

end
