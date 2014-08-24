class PotlucksController < ApplicationController
  before_action :find_potluck, only: [:show, :edit, :update, :destroy, :attend, :invite_to]
  before_action :authenticate_user!
  def index
    @potlucks = current_user.potlucks
    @recipe = Recipe.new
    @potluck = Potluck.new
    @recipes = Recipe.all
  end

  def show
    @organizer = @potluck.potluck_signups.first.user
    @cookbooks = Cookbook.all
    @potlucks = current_user.potlucks
    @recipes = @potluck.recipes
    @cookbook = Cookbook.new
    @newpotluck = Potluck.new
  end

  def new
    @potluck = Potluck.new
  end

  def create
    @potluck = Potluck.new(potluck_params)
    @signup = PotluckSignup.create(user:current_user, potluck: @potluck)
    @signup.save
    @potluck.organizer = current_user.name
    @potluck.invitees = []

  respond_to do |format|
   if @potluck.save
      format.html { redirect_to @potluck, notice: 'Recipe was successfully created.' }
    else
      format.html { render :new }
   end
  end
  end

  def destroy
    @potluck.destroy
    redirect_to root_url, notice: "Potluck was sucessfully removed"
  end

  def attend
     if @potluck.invitees.include? current_user.email
       @signup = PotluckSignup.create(user:current_user, potluck: @potluck)
       @signup.save
       @potluck.invitees_will_change!
       @potluck.invitees.delete(current_user.email)
       @potluck.save
       redirect_to @potluck, :notice => "You are now attending #{@potluck.name}!"
     else
       redirect_to @potluck, :notice => "Ooops! It looks like you haven't yet been
       invited to this potluck."
     end
  end

  def invite_to
    @email = params[:email].downcase
    unless @potluck.invitees.include? @email
    @potluck.invitees_will_change!
    @potluck.invitees << @email
    @potluck.save
    InviteMailer.invite(current_user, @potluck, @email).deliver
    redirect_to @potluck, :notice => "Ok! An invite has been sent to #{@email}!"
    else
      redirect_to @potluck, :notice => "Looks like you've already invited that person to your potluck!"
    end
  end

  private

  def find_potluck
    @potluck = Potluck.find(params[:id])
  end

  def potluck_params
    params.require(:potluck).permit(:name,{ :recipe_ids => []},{ :user_ids => []})
  end


end
