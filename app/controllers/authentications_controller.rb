class AuthenticationsController < ApplicationController

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications if current_user
  end

  # POST /authentications
  # POST /authentications.json
  def create
    auth_hash = request.env['omniauth.auth']
    authentication = Authentication.find_by(:provider => auth_hash['provider'], :uid => auth_hash['uid'])
    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, authentication.user)
    elsif
      current_user.authentications.create!(:provider => auth_hash['provider'], :uid => auth_hash['uid'])
      flash[:notice] = "Authentication was successfull"
      redirect_to authentications_path
    else
      user = User.new
      user.apply_omniauth(auth_hash)
      if user.save
        flash[:notice] = "Signed in successfully"
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_path
      end
    end

    auth


  end




  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_path

  end

end
