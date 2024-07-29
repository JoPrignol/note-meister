class PostsController < ApplicationController
  def index
    @posts = Post.all
    @subjects = Subject.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.tags.build
    @subjects = Subject.all
  end

  def create
    @post = Post.new(post_params)
    @subjects = Subject.all
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @post = Post.find(params[:id])
    @subjects = Subject.all
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids: [])
  end

end
