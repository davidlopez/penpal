class SessionsController < ApplicationController
  def destroy
    session.clear
    flash[:notice] = 'Logout Successful'
    redirect_to root_path
  end
end
