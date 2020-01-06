require 'rails_helper'

describe 'user can edit their preferences' do
  it 'from preferences page links to edit preferences' do
    user = create(:user)
    stub_user(user)

    visit '/survey'

    user.feeling_preferences.create(feeling: 'sad')
    user.feeling_preferences.create(feeling: 'Down')
    TimePreference.create(user_id: user.id, before_bed: true)

    user.activity_preferences.create(description: 'music')
    user.activity_preferences.create(description: 'activity')
    user.activity_preferences.create(description: 'Swimming')
    user.activity_preferences.create(description: 'Coloring')

    user.music_preferences.create(genre: 'folkindie')

    MediaPreference.create(user_id: user.id, dogs: true, celestial: true)
    user.reload
    visit '/preferences'

    click_link 'Edit Preferences'

    find(:css, "#user_feeling_preferences_alone").set(true)
    find(:css, "#user_feeling_preferences_unmotivated").set(true)

    find(:css, "#user_time_preference_random").set(true)

    find(:css, "#user_activity_preferences_buddy").set(true)
    find(:css, "#user_activity_preferences_journal").set(true)

    find(:css, "#user_music_preferences_rock").set(true)

    find(:css, "#user_media_preference_cats").set(true)
    find(:css, "#user_media_preference_landscapes").set(true)

    fill_in 'activity_1', with: 'Rock Climbing'
    fill_in 'activity_2', with: 'Painting'

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
    expect(activities).to include('journal')
    expect(activities).to include('buddy')
  end
end
