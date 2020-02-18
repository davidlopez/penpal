require 'rails_helper'

describe "user can receive a journal entry resource" do
  it "displays a form to enter text" do
    user = create(:user, survey?: true)
    stub_user(user)
    journal = Journal.new(nil,user)
    ResourcePreference.create(user_id: user.id, journal: true)
    allow_any_instance_of(ResourceFacade).to receive(:suggestion).and_return("journal")
    allow_any_instance_of(ResourceFacade).to receive(:get_resource).and_return(journal)
    allow_any_instance_of(ResourceFacade).to receive(:resource).and_return(journal)

    visit '/boost'

    expect(page).to have_content('Journal about whatever comes up for you, then click save.')

    fill_in with: 'YOLO'

    click_on 'Save'

    user.reload

    entry = user.journal_entries.last
    expect(entry.entry).to have_content('YOLO')
    expect(current_path).to eq('/boost')
    expect(page).to have_content('Great journal entry!')
    expect(page).to_not have_content('Journal about whatever comes up for you, then click save.')
  end
end
