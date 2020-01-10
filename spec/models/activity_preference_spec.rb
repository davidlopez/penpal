require 'rails_helper'

describe ActivityPreference do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :description }
  end
end
