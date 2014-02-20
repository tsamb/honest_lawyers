class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :description
      t.boolean :open, default: true
      t.integer :number
      t.belongs_to :user
      t.belongs_to :client

      t.timestamps
    end
  end
end
