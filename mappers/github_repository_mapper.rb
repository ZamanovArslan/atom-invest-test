class GithubRepositoryMapper
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def full_name
    attributes["full_name"]
  end

  def url
    attributes["html_url"]
  end

  def image_url
    attributes["owner"]["avatar_url"]
  end

  def description
    attributes["description"]
  end
end
