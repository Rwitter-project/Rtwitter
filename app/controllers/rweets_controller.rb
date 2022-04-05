class RweetsController < ApplicationController
  def index
    @rweets = Rweet.all
  end

  def new
    @rweet = Rweet.new
  end

  def create
    @rweet = Rweet.new(rweet_params)
    @rweet.user_id = current_user.id
    if @rweet.save
      redirect_to '/rweets#index'
    else
      render 'new'
    end
  end

  private
  def rweet_params
    params.require(:rweet).permit(:body)
  end
end
