class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :ruby_gem
  validates_uniqueness_of :ruby_gem, scope: :user
end
