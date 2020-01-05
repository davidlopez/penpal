require 'rails_helper'

describe "user can receive a journal entry resource" do
  it "displays a form to enter text" do
    user = create(:user, survey?: true)
    stub_user(user)

    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("journal")

    visit '/boost'

    expect(page).to have_content("Journal about how you're feeling, then click save.")

    fill_in "Entry", with: "YOLO"

    click_on "Save Entry"

    user.reload

    entry = user.journal_entries.last
    expect(entry.entry).to have_content("YOLO")
    expect(current_path).to eq('/boost')

    expect(page).to_not have_content("Journal about how you're feeling, then click save.")
  end
end
