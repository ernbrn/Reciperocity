class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_potluck, :clone]
  before_action :find_potluck, only: [:remove_from_potluck]

  # GET /recipes
  # GET /recipes.json
  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @ingredients = @recipe.ingredients
    @owner =  @recipe.owner
    @owner_user = User.find(@recipe.owner)
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

  def clone
    @recipe = Recipe.new(@recipe.attributes)
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
    @recipe.owner = current_user.id

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
   @potluck = Potluck.find(params[:potluck_id])
   @signup = PotluckSignup.find_by(user: current_user, potluck: @potluck)
 if @recipe.potlucks.include? @potluck
     redirect_to @recipe, :notice => "It appears that this recipe is already a part of that potluck."
   else
    @signup.recipe = @recipe
    @signup.save
    redirect_to @recipe, :notice => "Recipe Added to Potluck"
 end
  end

  def remove_from_potluck
    if (@recipe.potlucks.include? @potluck && @potluck.recipe_adder == current_user.id)
      @recipe.potlucks.delete(@potluck)
      redirect_to @recipe, :notice => "Ok! That recipe was removed from the potluck"
    elsif @potluck.recipe_adder != current_user.id
      redirect_to @recipe, :notice => "You do not have permission to do that"
    else
      redirect_to @recipe, :notice => "This recipe is not part of that potluck!"
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def find_potluck
      @potluck = Potluck.find(params[:potluck_id])
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

