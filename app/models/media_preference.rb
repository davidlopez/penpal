class MediaPreference < ApplicationRecord
  belongs_to :user

  def to_i
    if self != false
      1
    else
      0
    end
  end
  
end
