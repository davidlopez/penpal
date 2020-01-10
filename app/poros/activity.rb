class Activity
  attr_reader :description

  def initialize(data, user)
    @description = user.activity_preferences.sample.description
  end
end
