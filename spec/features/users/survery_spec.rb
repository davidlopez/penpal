require 'rails_helper'

describe 'User can fill out the survey' do
  it 'fills out information and submits' do
    user = create(:user)
    stub_user(user)

    visit '/survey'


    find(:css, "#user_feeling_preferences_sad").set(true)
    find(:css, "#user_feeling_preferences_down").set(true)

    find(:css, "#user_time_preference_before_bed").set(true)

    find(:css, "#user_activity_preferences_music").set(true)
    find(:css, "#user_activity_preferences_activity").set(true)

    find(:css, "#user_music_preferences_folkindie").set(true)

    find(:css, "#user_media_preference_dogs").set(true)
    find(:css, "#user_media_preference_celestial").set(true)

    fill_in 'activity_1', with: 'Swimming'
    fill_in 'activity_2', with: 'Coloring'

    click_on 'Submit'

    expect(current_path).to eq('/landing')
    expect(page).to have_content('Preferences saved')
    user.reload


    feelings = user.feeling_preferences.map do |pref|
      pref.feeling
    end

    expect(feelings).to include('sad')
    expect(feelings).to include('down')
    expect(user.media_preference[:dogs]).to eq(true)
    expect(user.media_preference[:celestial]).to eq(true)

    expect(user.time_preference[:before_bed]).to eq(true)

    music = user.music_preferences.map do |pref|
      pref.genre
    end

    expect(music).to include('folkindie')

    activities = user.activity_preferences.map do |pref|
      pref.description
    end

    expect(activities).to include('Swimming')
    expect(activities).to include('Coloring')
    expect(activities).to include('music')
    expect(activities).to include('activity')
  end
end
