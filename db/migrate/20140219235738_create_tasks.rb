class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :matter

      t.timestamps
    end
  end
end
