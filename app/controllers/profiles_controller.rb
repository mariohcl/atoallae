class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :follow, :searching]
  load_and_authorize_resource
  skip_authorization_check

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user_profile = User.find(params[:id])
    @posts = Post.all
    @comments = Comment.all.limit(1)
    @profiles = Profile.all
    @events = Event.all.limit(2).order("RANDOM()")
    @products = Product.all.limit(2).order("RANDOM()")
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  def profile
    @profile = current_user.profile
    @posts = Post.all
    @post = Post.new
  end

  def follow
    @user = User.find(params[:id])
    @current_profile = User.find(params[:id2])

    if current_user.following?(@user)
      current_user.follow_user(@user, false)
      # current_user.stop_following(@user)
    else
      current_user.follow_user(@user, true)
      # current_user.follow(@user)
    end
      # redirect_to profile_path(@user.profile)

  end


  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:username, :fullname, :bio, :avatar, :instagram, :facebook, :twitter, :cover)
    end
end
