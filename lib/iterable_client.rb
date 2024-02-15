class IterableClient

    def initialize(api_key = nil)
      @api_key = api_key
    end

    def send_event(event_name, user_id, data = {})
      url = "#{ENV['ITERABLE_API_BASE_URL']}/events"
      payload = {
        apiKey: @api_key,
        eventName: event_name,
        userId: user_id,
        data: data
      }

      send_request(url, payload)
    end

    def send_email(recipient_email, subject, body)
      url = "#{ENV['ITERABLE_API_BASE_URL']}/email/send"
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
      # For testing, you can mock this method
      response = make_http_request(url, payload)
      JSON.parse(response.body)
    end

    private

    def make_http_request(url, payload)
      # For testing, you can mock this method
      # This method should return an object that responds to `.body`
      # with the response body
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/json'
      request.body = payload.to_json
      https.request(request)
    end
end
