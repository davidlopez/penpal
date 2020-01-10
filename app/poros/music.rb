class Music
  attr_reader :url, :song_name, :artist_name, :image

  def initialize(data, user)
    @url = data[:url]
    @song_name = data[:song_name]
    @artist_name = data[:artist_name]
    @image = data[:image]
  end
end
