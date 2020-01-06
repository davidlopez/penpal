class FeelingPreferencesController < ApplicationController
  def new
    @feeling_preference = current_user.feeling_preferences.new
  end

  def create; end

  def edit
    @feeling_preference = current_user.feeling_preferences.find(params[:id])
  end

  def update
  end
end
