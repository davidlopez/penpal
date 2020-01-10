require 'rails_helper'

describe MediaPreference do
  describe 'relationships' do
    it { should belong_to :user }
  end
end
