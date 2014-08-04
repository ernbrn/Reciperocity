require 'rails_helper'

describe Recipe do
  describe 'a recipe' do
    it "belongs to a user" do
      recipe = Recipe.new
      user = User.new
      user.recipes << recipe
      expect(recipe.user).to be user
    end
  end
end