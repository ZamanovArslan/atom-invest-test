require_relative "../../clients/github"
require "json"

describe Github do
  let(:github) { described_class }

  before do
    stub_request(:any, "https://api.github.com/#{path}").to_return(body: response.to_json)
  end

  describe ".search_repositories" do
    let(:path) { "search/repositories?q=Tom" }
    let(:response) do
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
    let(:result) do
      [
        {
          url: "some_url",
          full_name: "Tom Sawyer"
        },
        {
          url: "another url",
          full_name: "Tom Hanks"
        }
      ]
    end

    subject(:search_repositories) { github.search_repositories("Tom") }

    it { expect(search_repositories.first).to have_attributes result.first  }
    it { expect(search_repositories[1]).to have_attributes result[1]  }
  end
end
