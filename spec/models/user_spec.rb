require 'rails_helper'

describe User do
  describe 'attributes' do
    it 'has attributes' do
      user = User.create(first_name: 'Sarah', last_name: 'Lopp', email: 'slopp@gmail.com')

      expect(user.first_name).to eq('Sarah')
      expect(user.last_name).to eq('Lopp')
      expect(user.email).to eq('slopp@gmail.com')
    end
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :google_token }
  end

  describe 'relationships' do
    it { should have_many :buddies }
    it { should have_many :daily_feelings }
    it { should have_many :feeling_categories }
    it { should have_many :activity_preferences }
    it { should have_many :feeling_preferences }
    it { should have_many :music_preferences }
    it { should have_many :journal_entries }
    it { should have_many :feedbacks }
    it { should have_one :media_preference }
    it { should have_one :time_preference }
  end
end
