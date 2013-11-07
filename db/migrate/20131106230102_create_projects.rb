class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_owner
      t.decimal(10,2); :project_goal

      t.timestamps
    end
  end
end
