class EmailsController < ApplicationController
  def create
    BuddyMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Email sent to notify your buddy!"
  end
end
