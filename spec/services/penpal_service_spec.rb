require 'rails_helper'

describe 'Can receive suggestion from penpal api' do
  it 'can get a journal suggestion' do
      user = create(:user, survey?: true )
      user_info = {
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['journal'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: nil }.to_json

      json = File.read('./spec/fixtures/get_journal.json')
      stub_request(:get, 'https://api-penpal-boost.herokuapp.com/api/v1').with(query: { user_info: user_info} ).to_return(status: 200, body: json )

  end
  it 'can get a buddy suggestion' do
    user = create(:user, survey?: true )

    user_info = {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['buddy'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
      spotify_token: nil }.to_json

      json = File.read('./spec/fixtures/get_buddy.json')
      stub_request(:get, 'https://api-penpal-boost.herokuapp.com/api/v1').with(query: { user_info: user_info} ).to_return(status: 200, body: json )

  end
  it 'can get a activity suggestion' do
    user = create(:user, survey?: true )

    user_info = {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['activity'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
      spotify_token: nil }.to_json

      json = File.read('./spec/fixtures/get_activity.json')
      stub_request(:get, 'https://api-penpal-boost.herokuapp.com/api/v1').with(query: { user_info: user_info} ).to_return(status: 200, body: json )
  end
  it 'can get a media suggestion' do
    user = create(:user, survey?: true )

    user_info = {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['media'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
      spotify_token: nil }.to_json

      json = File.read('./spec/fixtures/get_media.json')
      stub_request(:get, 'https://api-penpal-boost.herokuapp.com/api/v1').with(query: { user_info: user_info} ).to_return(status: 200, body: json )
  end
  it 'can get a music suggestion' do
    user = create(:user, survey?: true )

    user_info = {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['music'],
      music_preferences: ['rock'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
      spotify_token: ENV['SPOTIFY_TEST_TOKEN'] }.to_json

      json = File.read('./spec/fixtures/get_music.json')
      stub_request(:get, 'https://api-penpal-boost.herokuapp.com/api/v1').with(query: { user_info: user_info} ).to_return(status: 200, body: json )

  end
end
