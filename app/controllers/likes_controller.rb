class LikesController < ApplicationController
  before_action :find_rweet
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @rweet.likes.create(user_id: current_user.id)
    end
    redirect_to rweet_path(@rweet)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to rweet_path(@rweet)
  end

  def find_like
    @like = @rweet.likes.find(params[:id])
  end

  private
  def find_rweet
    @rweet = Rweet.find(params[:rweet_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, rweet_id:
      params[:rweet_id]).exists?
  end
end
