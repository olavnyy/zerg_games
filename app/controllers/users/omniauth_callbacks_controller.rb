class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
  	@user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, notice: "Signed in!" #:event => :authentication
    else
      flash[:notice] = "Authentication error"
      redirect_to root_path
    end
  end

  alias_method :facebook, :all
end
