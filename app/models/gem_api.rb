class GemApi
  include HTTParty 
  base_uri 'rubygems.org/api/v1'

  def self.search ruby_gem
    # /search.json?query=<ruby_gem>
    @response = self.get "/search.json", query: { query: ruby_gem }
  end

  def self.fetch ruby_gem
    @response = self.get "/gems/#{ruby_gem}.json"
  end
      
end
