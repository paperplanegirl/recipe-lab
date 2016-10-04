class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render 'index'
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @recipes = @course.recipes
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to @course
    else
      render "edit"
    end
  end

  def destroy
    Course.find(params[:id]).delete
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:name, :recipe_ids => [])
    end

end
