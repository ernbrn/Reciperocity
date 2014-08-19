class CookbooksController < ApplicationController
  before_action :find_cookbook, only: [:show, :update, :destroy]

  def index
    @cookbooks = current_user.cookbooks
  end

  def show
    @recipes = @cookbook.recipes
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    @entry = CookbookEntry.create(cookbook:@cookbook)
    @entry.save
    @cookbook.user = current_user

    respond_to do |format|
      if @cookbook.save
        format.html {redirect_to @cookbook, notice: 'Cookbook was sucessfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @cookbook.destroy
  end

  private

  def find_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:cookbook_entry_ids, :name)
  end


end
