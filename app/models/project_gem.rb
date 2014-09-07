class ProjectGem < ActiveRecord::Base
  belongs_to :project
  belongs_to :ruby_gem
end
