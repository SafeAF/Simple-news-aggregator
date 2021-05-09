class PostsController < ApplicationController
  before_action :set_post, only: %i[ show  destroy like ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :is_moderator!, only: %i[ destroy edit update ]
  #before_action :set_post, only: [ :show ]

  # GET /posts or /posts.json

  def top
    @posts = Post.order(cached_votes_up: :desc).limit(100)
  end

  def newest
    @posts = Post.order(created_at: :desc).limit(100)
  end

 def like

    if current_user.voted_for? @post
      @post.unliked_by current_user
      @post.user.positive_karma -= 1
      @post.user.save!
    else
      @post.liked_by current_user
      @post.user.positive_karma += 1
      @post.user.save!
    end

    respond_to do |format|
 
    format.html {redirect_to @post}
    format.json { head :no_content }
    # format.js # add once it is fixed
    end
  end

  ## hack to enable users posts to be displayed
  def user
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user)
  end
  
  def index
    @posts = Post.all.limit(250)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:comments).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:url, :body, :headline)
    end
end
