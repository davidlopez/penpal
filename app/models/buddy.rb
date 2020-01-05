class Buddy < ApplicationRecord
  belongs_to :user
  validates_presence_of :first_name, :last_name, :email, :phone_number
  validates :phone_number, numericality: true, length: { minimum: 10, maximum: 10 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
