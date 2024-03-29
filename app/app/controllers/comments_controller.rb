class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy  like dislike]
  before_action :set_post, only: %i[ create new show edit update like dislike]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :is_moderator!, only: %[ edit update destroy ]
  

   def like
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if current_user.voted_for? @comment
      @comment.unliked_by current_user
      @comment.user.positive_karma -= 1
      @comment.user.save!
    else
      @comment.liked_by current_user
      @comment.user.positive_karma += 1
      @comment.user.save!
    end

    respond_to do |format|
  
  # format.js # add once it is fixed
    format.html {redirect_to @post}
    format.json { head :no_content }
   # format.js 
    end
  end

   def dislike
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if current_user.voted_for? @comment
      @comment.undisliked_by current_user
      @comment.user.negative_karma -= 1
      @comment.user.save!
    else
      @comment.disliked_by current_user
      @comment.user.negative_karma += 1
      @comment.user.save!
    end

    respond_to do |format|
  
  # format.js # add once it is fixed
    format.html {redirect_to @post}
    format.json { head :no_content }
 
    end
  end



  # GET /comments or /comments.json
  def user
     @user = User.find(params[:id])
     
    @comments = Comment.where(user_id: @user)
  end

  def index
    @comments = Comment.order(created_at: :desc).limit(250)
  end

  # GET /comments/1 or /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
   
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    #@post = Post.find(params[:post_id])
    #@comment = @post.comments.find(params[:id])
    #@comment = Comment.find(comment_params)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit( :body, :content )
    end
end
