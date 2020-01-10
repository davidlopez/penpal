class FeelingPreference < ApplicationRecord
  belongs_to :user
  validates_presence_of :feeling
end
