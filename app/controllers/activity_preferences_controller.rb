class ActivityPreferencesController < ApplicationController

  def edit
    @activity_preference = ActivityPreference.find(params[:id])
  end

  def update
  end

end
