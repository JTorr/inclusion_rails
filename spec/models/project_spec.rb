require 'rails_helper'

RSpec.describe Project, :type => :model do
  it 'can parse a Gemfile' do
    project = Project.new
    results = project.parse %{
# Can bundle against edge rails
source :rubygems

gem 'rails'
gem 'jquery', '~> 3.0'

group :development do
  gem 'spring'
end
    }
    expect( results ).to eq %w( rails jquery spring )
  end

  it "won't double-parse" do
    gemfile = %{ gem 'rails' }
    project = Project.new
    project.parse gemfile
    results = project.parse gemfile
    expect( results ).to eq ['rails']
  end

  it 'can create and attach a new gem' do
    project = Project.new
    project.attach_gem 'pry'

    expect( project.ruby_gems.count ).to eq 1
    expect( project.ruby_gems.first.name ).to eq 'pry'
  end

  it 'can update and attach an existing gem' do
    old = RubyGem.create! name: 'pry', info: 'Old info'

    project = Project.new
    project.attach_gem 'pry'

    expect( RubyGem.count ).to eq 1
    pry = RubyGem.first

    expect( pry.name ).to eq 'pry'
    expect( pry.info ).not_to eq 'Old info'
  end

  it 'can find existing gems even if RubyGems is down' do
    # Can use rspec-mock or mocha to clean this up
    class MockGemFetcher
      def self.fetch gem
        BadResponse.new
      end
    end
    
    class BadResponse
      def ok?
        false
      end
      def code
        500
      end
    end

    old = RubyGem.create! name: 'pry', info: 'Old info'

    project = Project.new
    project.attach_gem 'pry', MockGemFetcher

    expect( RubyGem.count ).to eq 1

    pry = RubyGem.first
    expect( pry.name ).to eq 'pry'
    expect( pry.info ).to eq 'Old info'
  end
end
