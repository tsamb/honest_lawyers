class AddCurrentTaskIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_task_id, :integer
  end
end
