namespace :events do
  #Send email notifications for Event B
  desc "Send email notifications for Event B"
  task send_email_notifications_for_event_b: :environment do
    #get all users
    users = User.joins(:events).where(events: { name: 'Event B' }).distinct
    iterable_service ||= IterableService.new
    users.each do |user|
      iterable_service.send_email_notification(user.email)
    end
  end
end
