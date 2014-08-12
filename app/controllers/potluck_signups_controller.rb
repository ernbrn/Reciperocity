class PotluckSignupsController < ApplicationController
  before_action :find_signup, only: [:show, :destroy, :update]


  def index

  end

  def show

  end

  def new
    @potluck_signup = PotluckSignup.new
  end

  def create
    @potluck_signup = PotluckSignup.new(ps_params)
   respond_to do |format|
   if @potluck_signup.save
      format.html { redirect_to @potluck, notice: 'You have sucessfully joined this potluck!' }
    else
      format.html { render :new }
   end
  end
  end


  def destroy
    @potluck_signup.destroy
  end

  private

  def find_potluck
    @potluck = Potluck.find(params[:id])
  end

  def find_signup
    @potluck_signup = PotluckSignup.find(params[:id])
  end

  def ps_params
    params.require(:potluck).permit(:user_id, :recipe_id, :potluck_id)
  end
end
