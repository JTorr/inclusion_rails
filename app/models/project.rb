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
      self.project_gems.new GemApi.fetch gem
    end
  end
end
