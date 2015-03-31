class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :songtopic_id

      t.timestamps null: false
    end
  end
end
