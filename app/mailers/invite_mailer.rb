class InviteMailer < ActionMailer::Base
  default from: "invites@reciperocity.com"

  def invite(user, potluck, email)
    @user = user
    @email = email
    @potluck = potluck
    @url = "http://www.recipecity.herokuapp.com/potlucks/#{@potluck.id}"
    mail to: @email, subject: "You've been invited to a Potluck!"
  end
end
