class UserController < ApplicationController
  load_and_authorize_resource
  check_authorization

  def show
    @user_profile = User.find(params[:id])
  end
  # Cambiar nombre del metodo a SHOW

  def seguir

    @profile = User.find(params[:id])
    if current_user.following?(@profile)
      current_user.stop_following(@profile)
    else
      current_user.follow(@profile)
    end
      redirect_to @profile
  end

  def searching
    @profiles = Profile.where('fullname ILIKE ?', "%#{params[:search]}%")
  end

end
