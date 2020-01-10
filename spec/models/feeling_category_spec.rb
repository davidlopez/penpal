require 'rails_helper'

describe FeelingCategory do
  describe 'validations' do
    it { should validate_presence_of :category }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :feeling_preference }
  end
end
