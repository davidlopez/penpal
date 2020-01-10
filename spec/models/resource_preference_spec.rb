require 'rails_helper'

describe ResourcePreference do
  describe 'relationships' do
    it { should belong_to :user }
  end
end
