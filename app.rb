require "sinatra"
require "sinatra/reloader" if development?
require "dotenv/load"
require_relative "clients/github"

configure {set :server, :puma}

get '/' do
  erb :application
end

get "/repositories" do
  @repositories = Github.search_repositories(params["query"])

  erb :"repositories/index", layout: :application
end
