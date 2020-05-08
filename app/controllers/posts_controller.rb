class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  load_and_authorize_resource
  check_authorization

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @events = Event.all.limit(2).order("RANDOM()")
    @post = Post.new
    @profiles = Profile.all
    @products = Product.all.limit(2).order("RANDOM()")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def like

    @post = Post.find(params[:id])
      if current_user.liked? @post
        @old_like_user_id = @post.get_like_by_user(current_user.id)
        @post.unliked_by current_user
        respond_to do |format|
         format.js
        end
      else
        @post.liked_by current_user
        respond_to do |format|
         format.js
        end
      end


    # redirect_to posts_path
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:texto)
    end
end
