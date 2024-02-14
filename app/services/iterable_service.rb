require 'net/http'
require 'uri'
require 'json'

class IterableService
  # need to implement base logic
  # MOCK_API_KEY = 'mock_api_key'
  # def self.create_event_a(user_id)
  #   set_event(user_id, "A")
  #   response = send_request("/events", { userId: user_id, eventType: 'eventA' }, 'POST')
  #   handle_response(response)
  # end
  #
  # def self.create_event_b(user_id)
  #   set_event(user_id, "B")
  #   response = send_request("/events", { userId: user_id, eventType: 'eventB' }, 'POST')
  #   handle_response(response)
  # end
  #
  # def self.send_email_notification(user_id, event_type)
  #   if event_type == 'eventB'
  #     response = send_request("/email/send", { userId: user_id, campaignId: 'eventB_email_campaign' }, 'POST')
  #     handle_response(response)
  #   else
  #     puts "No email notification sent for event type #{event_type}"
  #   end
  # end
  #
  # private
  #
  # def self.set_event(user_id, name)
  #   @event = Event.find_or_initialize_by(user_id: , name: "Event #{name}").save
  # end
  #
  # def self.send_request(endpoint, data, method)
  #   uri = URI("#{ENV['ITERABLE_API_BASE_URL']}#{endpoint}")
  #   req = Net::HTTP.const_get(method.capitalize).new(uri, 'Content-Type' => 'application/json')
  #   # Use the mock API key if we're not using a real one
  #   req['Api-Key'] = (ENV['ITERABLE_API_BASE_URL'] == 'YOUR_ITERABLE_API_KEY') ? MOCK_API_KEY : ENV['ITERABLE_API_BASE_URL']
  #   req.body = data.to_json
  #   Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  #     http.request(req)
  #   end
  # end
  #
  # def self.handle_response(response)
  #   case response
  #   when Net::HTTPSuccess
  #     JSON.parse(response.body)
  #   else
  #     response.error!
  #   end
  # rescue => e
  #   puts "Error occurred: #{e.message}"
  #   nil
  # end

  #Dummy logic pass it in direct way

  def initialize
    @events = [] # Initialize an empty array to store events
  end

  def create_event(user_id, event_name)
    puts "Event #{event_name} created for user #{user_id} in iterable.com"
    true # return value indicating success
  end

  def send_email_notification(email)
    # rake task will send the email
    puts "Email notification sent to #{email} via iterable.com"
    return true
  end
end
