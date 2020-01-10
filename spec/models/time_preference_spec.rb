require 'rails_helper'

describe TimePreference do
  describe 'relationships' do
    it { should belong_to :user }
  end
end
