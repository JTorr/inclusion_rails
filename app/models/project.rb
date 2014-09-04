class Project < ActiveRecord::Base
  belongs_to :user
  has_many :ruby_gems
end
