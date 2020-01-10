class Media
  attr_reader :image_url

  def initialize(data, user)
    @image_url = data[:url]
  end
end
