class GemFetcher
  attr_accessor :response
  #def self.fetch(ruby_gem)
    ##@response = HTTParty.get("https://rubygems.org/api/v1/gems/#{ruby_gem}.json")
  #end

  def self.fetch(ruby_gem)
    @response = HTTParty.get("https://rubygems.org/api/v1/search.json?query=#{ruby_gem}")
  end

end
