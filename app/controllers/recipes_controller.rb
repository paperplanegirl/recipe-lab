class RecipesController < ApplicationController
  before_action :is_authenticated
  

  def index
    @recipes = Recipe.all
    render 'index'
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = @current_user.id

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def new
    @recipe = Recipe.new

  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @courses = @recipe.courses
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render "edit"
    end
  end

  def destroy
    Recipe.find(params[:id]).delete
    redirect_to recipes_path
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :servings)
    end

    def can_edit
      unless current_user.is_admin? || @recipe.belongs_to_user?(current_user)
        flash[:danger] = "You do not have permission to do that!"
        redirect_to recipes_path
      end
    end
end
