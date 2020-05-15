# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
   # Debemos crear el método .from_omniauth en nuestro modelo User (app/models/user.rb)
     @user = User.from_omniauth(request.env["omniauth.auth"])

     if @user.profile.nil?
       Profile.create(:user_id => @user.id, :fullname => @user.name)
     end

     if @user.persisted?
      sign_in(@user)
      redirect_to my_profile_path, notice: 'Te has registrado exitosamente'
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
     else
      redirect_to root_path, notice: 'Error al iniciar sesión con Facebook.'
     end
  end

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
