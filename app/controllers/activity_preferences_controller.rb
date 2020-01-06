class ActivityPreferencesController < ApplicationController

  def edit
    @activity_preference = current_user.activity_preferences.find(params[:id])
  end

  def update
  end

end
