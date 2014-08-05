class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
  end

  def new
    @ingredient = Ingredient.new
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to @ingredient, notice: 'Ingredient was sucessfully updated.'
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was sucessfully destroyed.'
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
  def ingredient_params
    params.require(:ingredient).permit(:name, :amount, :measure,:recipe_id)












  end
end
