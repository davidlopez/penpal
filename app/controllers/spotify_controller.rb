class SpotifyController < ApplicationController
  def create
    if current_user.spotify_token
      service = SpotifyService.get_auth(current_user.spotify_refresh_token)
      if service['refresh_token']
        current_user.update_attribute(:refresh_token, service['refresh_token'])
      end
      token = service['access_token']
      current_user.update({
        spotify_token: token
        })
      flash[:success] = 'Connected to Spotify!'
    else
      if request.env['omniauth.auth'].extra['raw_info']['product'] == 'open'
        flash[:error] = 'Sorry. Spotify Premium required to get songs'
        current_user.resource_preference.update(music: false)
      else
        token = request.env['omniauth.auth'].credentials['token']
        refresh_token = request.env['omniauth.auth'].credentials['refresh_token']
        current_user.update({
          spotify_token: token,
          spotify_refresh_token: refresh_token
          })
        flash[:success] = 'Connected to Spotify!'
      end
    end
    redirect_to '/landing'
  end
end
