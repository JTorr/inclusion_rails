# == Schema Information
#
# Table name: ruby_gems
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  info       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RubyGem < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :favorites
end
