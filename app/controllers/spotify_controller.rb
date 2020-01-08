class SpotifyController < ApplicationController

  def create
    if current_user.spotify_token
      service = SpotifyService.get_auth(current_user.spotify_refresh_token)
      binding.pry
      token = service['token']
      refresh = service['refresh_token']
      current_user.update({
        spotify_token: token,
        spotify_refresh_token: refresh_token

        })
      flash[:success] = 'Connected to Spotify!'
      redirect_to '/profile'
    else
      token = request.env['omniauth.auth'].credentials['token']
      refresh_token = request.env['omniauth.auth'].credentials['refresh_token']
      current_user.update({
        spotify_token: token,
        spotify_refresh_token: refresh_token
        })
      flash[:success] = 'Connected to Spotify!'
      redirect_to '/profile'
    end
  end
end
