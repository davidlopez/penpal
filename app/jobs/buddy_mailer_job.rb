class BuddyMailerJob < ApplicationJob
  queue_as :default

  def perform(user, buddy)
    BuddyMailer.inform(user, buddy).deliver_now
  end
end
