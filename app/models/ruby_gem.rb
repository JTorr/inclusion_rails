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
  has_many :project_gems
  has_many :projects, through: :project_gems

  def self.in_db(gem)
    find_by_name(gem)
  end

  def self.in_db?(gem)
    find_by_name(gem).present?
  end
end
