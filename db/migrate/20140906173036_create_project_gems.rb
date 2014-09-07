class CreateProjectGems < ActiveRecord::Migration
  def change
    create_table :project_gems do |t|
      t.references :project, index: true
      t.references :ruby_gem, index: true

      t.timestamps
    end
  end
end
