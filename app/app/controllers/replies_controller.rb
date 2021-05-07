class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: %[ create new like ]
  before_action :set_comment, only: %[ create new like]
  before_action :is_moderator!, only: %[ edit update destroy ]


 def like

    if current_user.voted_for? @reply
      @reply.unliked_by current_user
    else
      @reply.liked_by current_user
    end

    respond_to do |format|
 
    format.html {redirect_to @post}
    format.json { head :no_content }
    # format.js # add once it is fixed
    end
  end



  def user
     @user = User.find(params[:id])
    @replies = Reply.where(user_id: @user)
  end
  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new()
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies or /replies.json
  def create
    #@reply = Reply.new(reply_params)
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
   # @reply = Reply.new(reply_params)
   @reply = @comment.replies.create(params[:reply].permit(:body))
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to post_path(@post), notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:body, :post_id, :comment_id)
    end
end
