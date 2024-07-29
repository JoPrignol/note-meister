class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @posts = @subject.posts
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
    @subjects = Subject.all
  end

  def create
    @subject = Subject.new(subject_params)
    @subjects = Subject.all
    if @subject.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @subject = Subject.find(params[:id])
    @subjects = Subject.all
    if @subject.update(subject_params)
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to root_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
