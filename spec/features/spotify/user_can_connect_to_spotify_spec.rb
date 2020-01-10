require 'rails_helper'

describe 'user can connect to spotify' do
  it 'by clicking to connect from profile page' do
    user = create(:user, survey?: true)
    stub_user(user)

    visit '/profile'

    #mock spotify connect



  end
end
