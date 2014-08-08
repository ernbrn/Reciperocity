class PotlucksController < ApplicationController
  before_action :find_potluck, only: [:show, :edit, :update, :destroy, :attend]
  def index
    @potlucks = Potluck.all
    @recipe = Recipe.new
    @potluck = Potluck.new
    @recipes = Recipe.all
    
  end

  def show

  end

  def new
    @potluck = Potluck.new
  end

  def create
    @potluck = Potluck.new(potluck_params)
    @potluck.users << current_user

  respond_to do |format|
   if @potluck.save
      format.html { redirect_to @potluck, notice: 'Recipe was successfully created.' }
    else
      format.html { render :new }
   end
  end
  end

  def destroy
    @potluck.destoy
    redirect_to potlucks_url, notice: "Potluck was sucessfully removed"
  end

  def attend
    current_user.potlucks << @potluck
    redirect_to @potluck, :notice => "You are now attending #{@potluck.name}!"
  end

  private

  def find_potluck
    @potluck = Potluck.find(params[:id])
  end

  def potluck_params
    params.require(:potluck).permit(:name,{ :recipe_ids => []},{ :user_ids => []})
  end


end
