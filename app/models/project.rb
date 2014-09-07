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

  def attach_gems
    @gem_list.each do |gem|
      @gem_data =  GemApi.fetch gem
      @gem_model = self.ruby_gems.new name: @gem_data["name"], info: @gem_data["info"]
      @gem_model.save
    end
  end
end
