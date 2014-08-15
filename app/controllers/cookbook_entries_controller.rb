class CookbookEntriesController < ApplicationController
  before_action :find_entry, only: [:destroy, :update]

  def new
    @cookbook_entry = CookbookEntry.new
  end

  def create
    @cookbook_entry = CookbookEntry.new(entry_params)

    respond_to do |format|
     if @cookbook_entry.save
       format.html { redirect_to @cookbook, notice: "Entry added!" }
     else
       format.html { render :new }
     end
    end
  end


  def destroy
    @cookbook_entry.destroy
  end

  private

  def find_entry
    @cookbook_entry = CookbookEntry.find(params[:id])
  end


  def entry_params
    params.require(:cookbook_entry).permit(:recipe_id, :cookbook_id)
  end
end
