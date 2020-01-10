require 'rails_helper'

describe "user can receive a buddy resource" do
  it "shows buddy info" do
    user = create(:user, survey?: true)
    bddy = create(:buddy, user_id: user.id)
    stub_user(user)

    buddy = Buds.new(nil, user)
    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("buds")
    allow_any_instance_of(ResourceFacade).to receive(:get_resource).and_return(buddy)
    allow_any_instance_of(ResourceFacade).to receive(:resource).and_return(buddy)

    visit '/boost'

    expect(page).to have_content("Send a text to or call #{bddy.first_name + ' ' + bddy.last_name}")
    expect(page).to have_content("at 123-456-7890")
  end
end
