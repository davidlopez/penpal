class SpotifyController < ApplicationController

  def create
    current_user.update({
      spotify_token: params['code']
      })
    flash[:success] = 'Connected to Spotify!'
    redirect_to '/profile'
  end
end
