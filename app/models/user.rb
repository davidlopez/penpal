class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :google_token
  validates_uniqueness_of :email
  has_many :buddies, dependent: :destroy
  has_many :feeling_preferences, dependent: :destroy
  has_many :daily_feelings, dependent: :destroy
  has_many :activity_preferences, dependent: :destroy
  has_many :feeling_categories, dependent: :destroy
  has_many :music_preferences, dependent: :destroy
  has_many :journal_entries, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_one :resource_preference, dependent: :destroy
  has_one :media_preference, dependent: :destroy
  has_one :time_preference, dependent: :destroy
end
