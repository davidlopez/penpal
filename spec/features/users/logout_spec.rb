require 'rails_helper'

describe 'As a registered user' do
  it 'it can log out' do
    user = create(:user, survey?: true)
    stub_user(user)
    ResourcePreference.create(user_id: user.id, journal: true )


    visit landing_path

      click_on 'Logout'

    expect(page).to have_content('Logout Successful')
  end
end
