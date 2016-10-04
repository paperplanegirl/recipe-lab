class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render 'index'
  end

  def create
    @recipe = Recipe.new(recipe_params)

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
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :servings)
    end
end
