require_relative "../../clients/github"
require "json"

describe Github do
  let(:github) { described_class }

  before do
    stub_request(:any, "https://api.github.com/#{path}").to_return(body: result.to_json)
  end

  describe ".search_repositories" do
    let(:path) { "search/repositories?q=Tom" }
    let(:result) do
      {
        "items" => [
          {
            "html_url" => "some_url",
            "full_name" => "Tom Sawyer"
          },
          {
            "html_url" => "another url",
            "full_name" => "Tom Hanks"
          }
        ]
      }
    end

    subject(:search_repositories) { github.search_repositories("Tom") }

    it { is_expected.to eq result["items"] }
  end
end
