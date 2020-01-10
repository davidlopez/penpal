class JournalEntry < ApplicationRecord
  belongs_to :user
  validates_presence_of :entry
end
