class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_potluck, :remove_from_potluck, :clone_save, :clone, :add_to_cookbook, :remove_from_cookbook]
  before_action :find_potluck, only: [:remove_from_potluck]

  # GET /recipes
  # GET /recipes.json
  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @ingredients = @recipe.ingredients
    @owner =  @recipe.owner
    @owner_user = User.find(@recipe.owner)
    @potluck = Potluck.new
  end


  def index
    @recipe = Recipe.new
    @cookbook = Cookbook.new
    @recipes = Recipe.text_search(params[:search])
    @potluck = Potluck.new
    @potlucks = Potluck.all
    @user = User.new
    @users = User.all
  end



  def ingredient_email
    if current_user
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @email = params[:email]
    if @email.empty?
     redirect_to @recipe, notice: "Please enter an email address"
    else
    ListMailer.groceries(@user, @recipe, @email).deliver
    redirect_to @recipe, notice: "Email sent"
    end
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @potlucks = current_user.potlucks
    @potluck = Potluck.new
    @cookbook = Cookbook.new
    @cookbooks = Cookbook.all
  end

  def clone
    @new_recipe = @recipe.dup
    @new_recipe.user = current_user
    @new_recipe.ingredients = @recipe.ingredients.map{|i| i.dup}
  end

  def clone_save
    @new_recipe = @recipe.dup
    @new_recipe.update(recipe_params)
    @new_recipe.owner = @recipe.owner
    @new_recipe.save
    redirect_to @new_recipe, :notice => "Recipe sucessfully variated!"
  end

  def tags
    @tag = params[:tag]
    @recipes = Recipe.tagged_with(@tag).includes(:tags)
    @potlucks = Potluck.all
    @cookbook = Cookbook.all
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

  def add_to_cookbook
   @cookbook = Cookbook.find(params[:cookbook_id])
   @entry = CookbookEntry.find_by(cookbook: @cookbook)
   if @cookbook.recipes.include? @recipe
     redirect_to @recipe, :notice => "It appears that this recipe is already a part of that cookbook."
   else
    @entry.recipe = @recipe
    @entry.save
    redirect_to @recipe, :notice => "Recipe Added to Cookbook"
   end
  end

 def remove_from_cookbook
    @cookbook = Cookbook.find(params[:cookbook_id])
    @entry = CookbookEntry.find_by(cookbook: @cookbook)
    if @entry.recipe == @recipe
      @recipe.cookbook_entries.delete(@entry.id)
      redirect_to @recipe, :notice => "This recipe was removed from your cookbook"
    else
      redirect_to @recipe, :notice => "This recipe was not attending that cookbook"
    end
 end


  def remove_from_potluck
    @potluck = Potluck.find(params[:potluck_id])
    @signup = PotluckSignup.find_by(user: current_user, potluck: @potluck)
    if @signup.recipe == @recipe
      @recipe.potluck_signups.delete(@signup.id)
      redirect_to @recipe, :notice => "This recipe was removed from your potluck"
    else
      redirect_to @recipe, :notice => "This recipe was not attending that potluck"
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

