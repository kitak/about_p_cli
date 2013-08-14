require 'json'
require 'net/http'
require 'open-uri'
require 'pit'
require 'uri'

module AboutP
  module API
    BASE_URI = "about-p-kitak.sqale.jp"

    def self.search(key, query)
      client = Net::HTTP.new(BASE_URI, 443)
      client.use_ssl = true
      client.verify_mode = OpenSSL::SSL::VERIFY_NONE
      client.start do |http|
        response = http.get("/users/search.json?query=#{URI.encode(query)}", {'X-AboutP-API-Key' => key})
        case response.code.to_i
        when 200
          return JSON.parse(response.body)
        when 403
          puts "403: Invalid API key"
          exit 1
        else
          puts "#{response.code}: Something to wrong"
          exit 1
        end
      end
    end
  end
end
