class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_potluck]

  # GET /recipes
  # GET /recipes.json
  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @ingredients = @recipe.ingredients
  end

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
    @potluck = Potluck.new
    @user = User.new
    @users = User.all
    @search = Recipe.search do
          fulltext params[:search]
    end
    @recipes = @search.results
  end



  def ingredient_email
    if current_user
    @user = current_user
    @recipe = Recipe.find(params[:id])
    ListMailer.groceries(@user, @recipe, @user.email).deliver
    redirect_to @user, notice: "Email sent"
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def tags
    @tag = params[:tag]
    @recipes = Recipe.tagged_with(@tag).includes(:tags)
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
     if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
     else
       format.html { render :new }
     end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_potluck
    @potluck = Potluck.find(params[:id])
    @recipe.potlucks << @potluck
    redirect_to @recipe, :notice => "Recipe Added to Potluck"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe). \
        permit(:dish_name, :instructions, :prep_time, :cook_time, :yield,
               :picture, :tag_list, :user_id,
               ingredients_attributes: [:id, :amount, :measure, :name, :_destroy],
               potluck_ids: [] )
    end
end

