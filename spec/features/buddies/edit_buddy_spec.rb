require 'rails_helper'

describe 'As a registered user' do
  it 'it can edit a support buddy' do
    user = create(:user, survey?: true)
    stub_user(user)
    ResourcePreference.create(user_id: user.id, buddy: true)

    buddy_1 = user.buddies.create(first_name: 'Greg', last_name: 'Mitchell', email: 'george_michael@mail.com', phone_number: '3035552424' )

    visit profile_path

    click_link 'Buddies'

    within "#buddy-#{buddy_1.id}" do
      click_link 'Edit Buddy'
    end

    expect(current_path).to eq("/buddies/#{buddy_1.id}/edit")

    fill_in :first_name, with: 'Gregory'
    fill_in :last_name, with: 'Moose'
    fill_in :email, with: 'gmoo@gmail.com'
    fill_in :phone_number, with: '3035553131'
    click_on 'Update Buddy'

    expect(current_path).to eq('/buddies')
    expect(page).to have_content('Buddy Updated!')

    buddy_1.reload

    visit '/buddies'

    within "#buddy-#{buddy_1.id}" do
      expect(page).to have_content('Gregory Moose')
      expect(page).to have_content('gmoo@gmail.com')
      expect(page).to have_content('3035553131')
    end
  end

  it 'cannot edit support buddy without filling out all fields' do
    user = create(:user, survey?: true)
    stub_user(user)
    ResourcePreference.create(user_id: user.id, buddy: true)

    buddy_1 = user.buddies.create(first_name: 'Greg', last_name: 'Mitchell', email: 'george_michael@mail.com', phone_number: '3035552424' )

    visit profile_path

    click_link 'Buddies'

    within "#buddy-#{buddy_1.id}" do
      click_link 'Edit Buddy'
    end

    expect(current_path).to eq("/buddies/#{buddy_1.id}/edit")

    fill_in :first_name, with: 'Gregory'
    fill_in :last_name, with: ''
    fill_in :email, with: ''
    fill_in :phone_number, with: '3035553131'
    click_on 'Update Buddy'
# save_and_open_page
    expect(page).to have_content("Last name can't be blank, Email can't be blank, and Email is invalid")
  end
end
