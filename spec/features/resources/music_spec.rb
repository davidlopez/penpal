require 'rails_helper'

describe "user can receive a music resource" do
  it "displays song url" do
    user = create(:user, survey?: true)
    stub_user(user)

    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("music")

    music = Music.new({url: 'www.woo.co', song_name: 'Woop'}, user)
    allow_any_instance_of(ResourceFacade).to receive(:resource).and_return(music)

    visit '/boost'

    expect(page).to have_content("Penpal selected the following song to lift your spirits:")
    expect(page).to have_link("Woop")
  end
end
