class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    session.destroy
    # Delete cookie to log out even with remember me
    cookies.delete :remember_user_token
    redirect_to root_url, :notice => "Logged out!"
  end
end
