class UsersController < ApplicationController

  def show
    @user = User.All
  end
end
