class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_gems
  has_many :ruby_gems, through: :project_gems


  def parse(string)
    @gem_list = []
    lines = string.split("\n")
    lines.each do |line|
      if line =~ /^\s*gem/
        @gem_list.push line.scan(/[A-Za-z0-9_-]+/)[1]
      end
    end
  end

  def attach_gem(gem)
    @gem_data =  GemApi.fetch gem

    if @gem_data.ok?
      @gem_name = @gem_data["name"]
      @gem_info = @gem_data["info"]

      if RubyGem.in_db?(@gem_name)
        @gem_model = RubyGem.in_db @gem_name
        self.ruby_gems << @gem_model.update(name: @gem_name, info: @gem_info)
      else
        @gem_model = self.ruby_gems << RubyGem.create(name: @gem_name, info: @gem_info)
      end

    else
      if RubyGem.in_db?(@gem_name)
        @gem_model = RubyGem.in_db @gem_name
        self.ruby_gems << @gem_model
      else
        raise ApiError, "The ruby gems api raised the following code #{@gem_data.code}."
      end
    end
  end

  def attach_gems
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

