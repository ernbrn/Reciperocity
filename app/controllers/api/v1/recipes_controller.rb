class API::V1::RecipesController < ApplicationController

  respond_to :json

  def index
    respond_with Recipe.all
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def create
    respond_with Recipe.new(recipe_params)
  end

  def update
    respond_with do

      if @recipe.update(recipe_params)
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

end
