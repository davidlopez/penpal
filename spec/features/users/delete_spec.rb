require 'rails_helper'

describe 'As a registered user' do
  it 'can delete account' do
    user = create(:user, survey?: true)
    stub_user(user)

    visit landing_path

    click_button 'Profile'

    expect(current_path).to eq(profile_path)

    click_button 'Delete Account'

    expect(page).to have_content('Account deleted.')
  end
end
