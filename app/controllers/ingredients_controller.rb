class IngredientsController < ApplicationController
  before_action :is_authenticated

  def index
    @ingredients = Ingredient.all
    render 'index'
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @courses = @ingredient.courses
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render "edit"
    end
  end

  def destroy
    ingredient.find(params[:id]).delete
    redirect_to ingredients_path
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
