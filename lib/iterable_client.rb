class IterableClient
    ITERABLE_API_BASE_URL = 'https://api.iterable.com/api'

    def initialize(api_key = nil)
      @api_key = api_key
    end

    def send_event(event_name, user_id, data = {})
      url = "#{ITERABLE_API_BASE_URL}/events"
      payload = {
        apiKey: @api_key,
        eventName: event_name,
        userId: user_id,
        data: data
      }

      send_request(url, payload)
    end

    def send_email(recipient_email, subject, body)
      url = "#{ITERABLE_API_BASE_URL}/email/send"
      payload = {
        apiKey: @api_key,
        recipients: [{ email: recipient_email }],
        content: {
          subject: subject,
          html: body
        }
      }

      send_request(url, payload)
    end

    def send_request(url, payload)
      # Your implementation for making HTTP requests goes here
      # In this example, it's just a placeholder method
      # You can replace it with your actual implementation
      # For testing, you can mock this method
      response = make_http_request(url, payload)
      JSON.parse(response.body)
    end

    private

    def make_http_request(url, payload)
      # Your implementation for making HTTP requests goes here
      # In this example, it's just a placeholder method
      # You can replace it with your actual implementation
      # For testing, you can mock this method
      # This method should return an object that responds to `.body`
      # with the response body
    end
end
