class MusicPreferencesController < ApplicationController

  def edit
    @music_preference = current_user.music_preferences.find(params[:id])
  end

  def update
  end

end
