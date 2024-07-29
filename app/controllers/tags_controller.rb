class TagsController < ApplicationController
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
    @post = Post.find(params[:post_id])
    @subjects = Subject.all
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.build(tag_params)
    @subjects = Subject.all
    if @tag.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    @subjects = Subject.all
    @post = Post.find(params[:post_id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to @post
    else
      @subjects = Subject.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
    @tag.destroy
    redirect_to posts_path, notice: 'Tag was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def tag_params
    params.require(:tag).permit(:post_id, :subject_id)
  end

end
