class ListMailer < ActionMailer::Base
  default from: "groceries@reciperocity.com"

  def groceries(user, recipe, email)
    @user = user
    @email = email
    @recipe = recipe
    @url = "http://www.recipecity.herokuapp.com/recipes/#{@recipe.id}"
    mail to: @email, subject: "Your Reciperocity Grocery List"
  end
end