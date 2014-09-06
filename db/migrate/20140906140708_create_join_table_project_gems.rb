class CreateJoinTableProjectGems < ActiveRecord::Migration
  def change
    create_join_table :Projects, :RubyGems do |t|
      t.index [:project_id, :ruby_gem_id]
      t.index [:ruby_gem_id, :project_id]
    end
  end
end
