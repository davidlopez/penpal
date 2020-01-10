class MusicPreference < ApplicationRecord
  belongs_to :user
  validates_presence_of :genre
end
