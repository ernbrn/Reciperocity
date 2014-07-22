require 'rails_helper'

describe RecipesController do
    describe 'User can create a recipe' do
      it 'will be a new record' do
        get :new
        expect(assigns(:recipe)).to be_new_record
      end
    end
  end