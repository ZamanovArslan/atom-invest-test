require "faraday"

class Github
  API_URL = ENV["GITHUB_API_URL"]

  def self.search_repositories(query)
    response = send_request("search/repositories", { q: query })

    response["items"]
  end

  def self.send_request(path, params = {})
    response = Faraday.get(API_URL + path) do |req|
      req.params = params
      req.headers['Accept'] = "application/vnd.github.v3+json"
    end

    JSON.parse response.body
  end
end