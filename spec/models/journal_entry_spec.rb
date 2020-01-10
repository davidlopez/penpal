require 'rails_helper'

describe JournalEntry do
  describe "relationships" do
    it {should belong_to :user}
  end

  describe "validations" do
    it {should validate_presence_of :entry}
  end
end
