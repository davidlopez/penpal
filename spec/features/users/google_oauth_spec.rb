require 'rails_helper'

describe 'As a newly registered user' do
  it 'I can login with Google OAuth from the login page' do
    stub_omniauth

    visit '/'

    expect(page).to have_link('Sign in with Google')
    click_link('Sign in with Google')

    expect(current_path).to eq(survey_path)
    expect(page).to have_content('Login Successful')
    expect(page).to have_content('Penpal wants to get to know you a little more')
  end

  it 'A registered user can login' do
    user = create(:user, email: 'hfinn@mail.com', survey?: true)
    stub_omniauth

    visit '/'
    click_link('Sign in with Google')

    expect(current_path).to eq(landing_path)
    expect(page).to have_content('Login Successful')
    expect(page).to have_content("Welcome, #{user.first_name}!")
    expect(page).to have_content('How are you feeling?')
  end

  it 'An invalid user is unable to login' do
    stub_invalid_omniauth

    visit '/'

    click_link('Sign in with Google')

    expect(current_path).to eq('/')
    expect(page).to have_content('Failed to Login')
  end
end
