class Owners::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    # You need to implement the method below in your model (e.g. app/models/owner.rb)
    @owner = Owner.from_omniauth(request.env["omniauth.auth"])

    if @owner.persisted?
      sign_in_and_redirect @owner, :event => :authentication #this will throw if @owner is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_owner_registration_url
    end
  end

  def failure
    redirect_to root_path
  end


end
