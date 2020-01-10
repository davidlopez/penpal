require 'rails_helper'

describe 'user can edit their profile' do
  it 'from profile edit link' do
    user = create(:user, survey?: true)
    stub_user(user)

    visit '/profile'

    click_on 'Edit Profile'

    fill_in 'First name', with: 'Lucille'
    fill_in 'Last name', with: 'Ball'
    click_on 'Update'

    user.reload

    expect(current_path).to eq('/profile')
    expect(page).to have_content('Profile Updated!')
    expect(user.first_name).to eq('Lucille')
    expect(user.last_name).to eq('Ball')
  end

  it 'cannot edit without adding all info' do
    user = create(:user, survey?: true)
    stub_user(user)

    visit '/profile'

    click_on 'Edit Profile'

    fill_in 'First name', with: 'Lucille'
    fill_in 'Last name', with: ''
    click_on 'Update'

    expect(page).to have_content("Last name can't be blank")
  end
end
