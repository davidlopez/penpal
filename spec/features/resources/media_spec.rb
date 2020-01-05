require 'rails_helper'

describe "user can receive a media resource" do
  it "shows image" do
    user = create(:user, survey?: true)
    stub_user(user)

    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("media")

    media = Media.new({url: 'http://bit.ly/2FmmOoI'}, user)
    allow_any_instance_of(ResourceFacade).to receive(:resource).and_return(media)

    visit '/boost'

    expect(page).to have_content("Penpal selected the following image to lift your spirits:")
    expect(page).to have_css("img[src*='http://bit.ly/2FmmOoI']")
  end
end
