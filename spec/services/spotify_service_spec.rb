require 'rails_helper'

describe 'Spotify Service can make api call' do
  it 'can get a user token and refresh token' do
    user = create(:user, survey?: true, spotify_token: ENV['SPOTIFY_TEST_TOKEN'])
    stub_spotify_omniauth

    expect(user.spotify_token).to_not eq('')
    expect(user.spotify_refresh_token).to_not eq('')
  end
end
