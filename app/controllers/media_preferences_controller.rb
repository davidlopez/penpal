class MediaPreferencesController < ApplicationController

  def edit
    @media_preference = MediaPreference.find(params[:id])
  end

  def update
  end
end
