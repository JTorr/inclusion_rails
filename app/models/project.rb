class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_gems
  has_many :ruby_gems, through: :project_gems
  #check for uniqueness of a project_gem

  def parse(string)
    @gem_list = []
    lines = string.split("\n")
    lines.each do |line|
      if line =~ /^\s*gem/
        @gem_list.push line.scan(/[A-Za-z0-9_-]+/)[1]
      end
    end
    @gem_list
  end

  def ensure_gem_in_db name
    model = RubyGem.in_db name

    # unless the gem is already included in the project, add it
    unless self.ruby_gems.include? model
      self.ruby_gems << model
      self.save
    end

    model
  end

  def attach_gem(gem, fetcher=nil)
    fetcher ||= GemApi
    gem_data = fetcher.fetch gem

    if gem_data.ok? # ok means returned code 200
      gem_name = gem_data["name"]
      gem_info = gem_data["info"]

      if RubyGem.in_db? gem_name
        gem_model = ensure_gem_in_db gem_name
        gem_model.update(name: gem_name, info: gem_info)

      else
        gem_model = self.ruby_gems << RubyGem.create(name: gem_name, info: gem_info)
        self.save
      end

    else
      # gem_name = nil because it's from RubyGems
      if RubyGem.in_db? gem
        ensure_gem_in_db gem
      else
        raise "The ruby gems api raised the following code: #{gem_data.code}."
      end
    end
  end

  def attach_gems
    self.ruby_gems.delete_all
    self.save
    @gems_not_found = []
    @gem_list.each do |gem|
      begin
        attach_gem gem
      rescue
        @gems_not_found.push gem
      end
    end
  end

end
