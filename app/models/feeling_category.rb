class FeelingCategory < ApplicationRecord
  belongs_to :feeling_preference
  belongs_to :user
  validates_presence_of :category
end
