class SpotifyService

  def self.get_auth(refresh)
    self.get_json(refresh)
  end

  private

  def self.get_connection(refresh)
    Faraday.post('https://accounts.spotify.com/api/token') do |f|
      f.body = { grant_type: 'refresh_token', refresh_token: refresh }
      f.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      f.headers['Authorization'] = "#{ENV['SPOTIFY_REFRESH']}"
    end
  end

  def self.get_json(refresh)
    response = self.get_connection(refresh)
    JSON.parse(response.body)
  end

end
