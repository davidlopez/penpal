class TimePreferencesController < ApplicationController

  def edit
    @time_preference = TimePreference.find(params[:id])
  end

  def update
  end
end
