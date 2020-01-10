class BuddyMailer < ApplicationMailer
  def inform(user, buddy)
    @user = user
    mail(
      to: buddy.email,
      subject: "#{@user.first_name.capitalize}" + ' ' + "#{@user.last_name.capitalize}" + ' has added you as a buddy!'
    )
  end
end
