require 'rails_helper'

describe 'user can edit their preferences' do
  it 'from preferences page links to edit preferences' do
    user = create(:user)
    stub_user(user)

    visit '/survey'

    check 'Sad'
    check 'Down'
    check 'Before bed'
    check 'Listen to my favorite music'
    check 'Perform an activity I enjoy'
    check 'View cute animal pictures'
    check 'Folk/Indie'
    check 'Dogs'
    check 'Celestial'
    fill_in 'activity[activity_1]', with: 'Swimming'
    fill_in 'activity[activity_2]', with: 'Coloring'
    click_on 'Submit'

    visit '/preferences'

    click_link 'Edit Preferences'

    check 'Alone'
    check 'Unmotivated'
    check 'Random times'
    check 'View cute animal pictures'
    check 'Talk to a friend or family member'
    check 'Journal'
    check 'Rock'
    check 'Cats'
    check 'Landscapes'
    fill_in 'activity[activity_1]', with: 'Rock Climbing'
    fill_in 'activity[activity_2]', with: 'Painting'
    click_on 'Update Preferences'

    expect(current_path).to eq('/preferences')
    expect(page).to have_content('Preferences updated')

    user.reload

    feelings = user.feeling_preferences.map do |pref|
      pref.feeling
    end

    expect(feelings).to include('alone')
    expect(feelings).to include('unmotivated')

    expect(user.media_preference[:dogs]).to eq(false)
    expect(user.media_preference[:celestial]).to eq(false)

    expect(user.media_preference[:cats]).to eq(true)
    expect(user.media_preference[:landscapes]).to eq(true)

    expect(user.time_preference[:before_bed]).to eq(false)
    expect(user.time_preference[:random]).to eq(true)

    music = user.music_preferences.map do |pref|
      pref.genre
    end

    expect(music).to include('rock')

    activities = user.activity_preferences.map do |pref|
      pref.description
    end

    expect(activities).to include('Rock Climbing')
    expect(activities).to include('Painting')
    expect(user.resource_preference[:journal]).to eq(true)
    expect(user.resource_preference[:buddy]).to eq(true)
  end
end
