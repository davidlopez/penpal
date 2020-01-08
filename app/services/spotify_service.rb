class SpotifyService

  def self.get_auth(refresh)
    self.get_json(refresh)
  end

  private

  def self.get_connection(refresh)
    params = {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      client_secret: ENV['SPOTIFY_CLIENT_SECRET']
    }
    Faraday.post('https://accounts.spotify.com/api/token', params, { grant_type: 'authorization_code', code: refresh, redirect_uri: ENV['SPOTIFY_REDIRECT_URI'] } )
  end

  def self.get_json(refresh)
    response = self.get_connection(refresh)
  end

end
