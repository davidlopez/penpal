class TimePreferencesController < ApplicationController

  def edit
    @time_preference = current_user.time_preferences.find(params[:id])
  end

  def update
  end
end
