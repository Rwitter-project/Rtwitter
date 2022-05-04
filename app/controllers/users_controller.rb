class UsersController < ApplicationController

  def show
    @user = User.where('lower(username) = ?', params[:username]).first || User.find_by_username(params[:username])
  end
end
