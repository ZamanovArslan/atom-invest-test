require_relative "../../clients/github"
require_relative "../../mappers/github_repository_mapper"

feature "Search Repositories" do
  let(:search_input) { find("#search") }
  let(:result) do
   [
    GithubRepositoryMapper.new(
      "owner" => {
        "avatar_url" => "url"
      },
      "full_name" => "Grep Interactors",
      "description" => "Test",
      "html_url" => "url"
    )]
  end

  before do
    allow(Github).to receive(:search_repositories).with(any_args).and_return(result)
  end

  scenario "Search with query" do
    visit "/"

    search_input.fill_in with: "grep-interactors"

    click_button "Submit"

    expect(page).to have_content "Grep Interactors"
  end
end
