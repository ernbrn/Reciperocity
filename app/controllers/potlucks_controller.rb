class PotlucksController < ApplicationController
  before_action :find_potluck, only: [:show, :edit, :update, :destroy, :attend, :invite_to]
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
    @potluck.destoy
    redirect_to potlucks_url, notice: "Potluck was sucessfully removed"
  end

  def attend
   if current_user.potlucks.include? @potluck
      redirect_to @potluck, :notice => "You are already a member of this Potluck"
   else
     if @potluck.invitees.include? current_user.email
    current_user.potlucks << @potluck
    redirect_to @potluck, :notice => "You are now attending #{@potluck.name}!"
     else
       redirect_to @potluck, :notice => "Ooops! It looks like you haven't yet been
       invited to this potluck."
     end
   end
  end

  def invite_to
    @email = params[:email]
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
