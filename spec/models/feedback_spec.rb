require 'rails_helper'

describe Feedback do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :activity }
    it { should validate_presence_of :helpful }
    it { should validate_presence_of :again }
    it { should validate_presence_of :shift }
  end
end
