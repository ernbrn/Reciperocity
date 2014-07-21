class API::V1::RecipesController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  respond_to :json

  def index
     @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
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


# TODO make api better/more catered/specific and adhere to best practices.
