require 'open-uri'
require 'uri'

module AboutP
  module API
    #BASE_URI = "https://about-p-kitak.sqale.jp"
    BASE_URI = "http://localhost:3000"

    def self.search(query)
      open("#{BASE_URI}/search.json?query=#{URI.encode(query)}")
    end
  end
end
