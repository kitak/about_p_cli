require 'spec_helper'

describe AboutP do
  describe "API" do
    it "与えたAPIキーがヘッダーとして呼び出される" do
      stub_request(:get, "https://about-p-kitak.sqale.jp/users/search.json?query=kitak").with(:headers => {"X-AboutP-API-Key" => '12345'}).to_return(:body => '[]')
      AboutP::API.search('12345', 'kitak')
    end
  end

  describe "Command" do

  end
end
