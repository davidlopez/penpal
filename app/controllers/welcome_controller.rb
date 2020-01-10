class WelcomeController < ApplicationController
  def index
    redirect_to landing_path if current_user
  end
end
