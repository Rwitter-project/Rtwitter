class RweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new destroy update]
  protect_from_forgery with: :null_session

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

  def destroy
    @rweet = Rweet.find(params[:id])
    @rweet.destroy
    redirect_to root_path, :notice => "Your rweet has been deleted"
  end

  private
  def rweet_params
    params.require(:rweet).permit(:body)
  end
end
