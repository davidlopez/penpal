class Buds
  attr_reader :phone_number, :first_name, :last_name

  def initialize(data, user)
    buddy = user.buddies.sample
    @phone_number = buddy.phone_number
    @first_name = buddy.first_name
    @last_name = buddy.last_name
  end
end
