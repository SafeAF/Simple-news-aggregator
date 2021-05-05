## Naughty users go in this model, to be destroyed 
## model name: FlaggedUsers 

class FlaggedController < ApplicationController
	before_action :authenticate_user!, except: [ :index ]
  	before_action :is_moderator!, only: %[ new create ]


  def index

  end

  def new
    @flagged_user = FlaggedUser.new
  end

  # GET /comments/1/edit

  # POST /comments or /comments.json
  def create

  	@flagged_user = FlaggedUser.create(user_id: params[:user_id])
   
     respond_to do |format|
      if @flagged_user.save
        format.html { redirect_to root_path, notice: "User was successfully flagged." }
 		format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flagged_user.errors, status: :unprocessable_entity }
      end
    end


  end




end