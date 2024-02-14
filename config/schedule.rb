every 1.day, at: '1:00 am' do
    rake 'events:send_email_notifications_for_event_b'
end
