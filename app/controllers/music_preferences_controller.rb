class MusicPreferencesController < ApplicationController

  def edit
    @music_preference = MusicPreference.find(params[:id])
  end

  def update
  end

end
