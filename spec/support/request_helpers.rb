module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body)
    end

    def clear_response_json!
      @json_response = nil
    end
  end
end