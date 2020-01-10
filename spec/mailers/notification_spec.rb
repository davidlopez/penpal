require "rails_helper"

RSpec.describe BuddyMailer, type: :mailer do
  before(:each) do
    @user = create(:user, email: 'testing@testing.com')
    @buddy = @user.buddies.create(
      first_name: 'Greg',
      last_name: 'Mitchell',
      email: 'george_michael@mail.com',
      phone_number: '3035552424'
    )
  end

  describe 'sends activation email' do
    let(:mail) {BuddyMailer.inform(@user, @buddy)}

    it 'renders the headers' do
      expect(mail.subject).to eq("#{@user.first_name.capitalize}" + ' ' + "#{@user.last_name.capitalize}" + " has added you as a buddy!")
      expect(mail.to).to eq(['george_michael@mail.com'])
      expect(mail.from).to eq(["from@example.com"])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("#{@user.first_name.capitalize}" + ' ' + "#{@user.last_name.capitalize}" + " has added you as a support buddy on PenPal!")
      expect(mail.body.encoded).to match("PenPal will use your contact information to suggest your buddy reach out")
      expect(mail.body.encoded).to match("to you in times of need.")
      expect(mail.body.encoded).to match("Friends are medicine for a wounded heart and vitamins for a hopeful soul.")
    end
  end
end
