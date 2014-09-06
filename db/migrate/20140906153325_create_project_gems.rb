class CreateProjectGems < ActiveRecord::Migration
  def change
    create_table :project_gems do |t|
      t.references :ruby_gems, index: true
      t.references :projects, index:true

      t.timestamps
    end
  end
end
