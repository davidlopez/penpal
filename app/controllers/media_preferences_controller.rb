class MediaPreferencesController < ApplicationController

  def edit
    @media_preference = current_user.media_preferences.find(params[:id])
  end

  def update
    @media_preference = current_user.media_preferences.find(params[:id])
    binding.pry

  end
end
