class GemFetcher
  attr_accessor :response
  def self.fetch(ruby_gem)
    @response = HTTParty.get("https://rubygems.org/api/v1/gems/#{ruby_gem}.json")
  end

end
