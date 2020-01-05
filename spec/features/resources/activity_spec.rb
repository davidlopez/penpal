require 'rails_helper'

describe "user can receive an activity resource" do
  it "shows activity" do
    user = create(:user, survey?: true)
    activ = create(:activity_preference, user_id: user.id)
    stub_user(user)

    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("activity")

    activity = Activity.new(nil, user)
    allow_any_instance_of(ResourceFacade).to receive(:resource).and_return(activity)

    visit '/boost'

    expect(page).to have_content("Penpal recommends: #{activ.description}")
  end
end
