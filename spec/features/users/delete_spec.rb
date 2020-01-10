require 'rails_helper'

describe 'As a registered user' do
  it 'can delete account' do
    user = create(:user, survey?: true)
    stub_user(user)

    ResourcePreference.create(user_id: user.id, journal: true )

    visit landing_path

    click_on 'Profile'

    expect(current_path).to eq(profile_path)

    click_on 'Delete Account'

    expect(page).to have_content('Account deleted.')
  end
end
