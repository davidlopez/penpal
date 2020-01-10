class DailyFeeling < ApplicationRecord
  belongs_to :user
  validates_presence_of :feeling
end
