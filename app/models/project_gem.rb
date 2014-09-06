class ProjectGem < ActiveRecord::Base
  belongs_to :ruby_gem
  belongs_to :project
end
