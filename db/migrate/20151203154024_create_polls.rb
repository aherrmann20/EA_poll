class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :topic

      t.timestamps null: false
    end
  end
end
