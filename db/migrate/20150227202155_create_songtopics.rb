class CreateSongtopics < ActiveRecord::Migration
  def change
    create_table :songtopics do |t|
      t.string :name
      t.string :album

      t.timestamps null: false
    end
  end
end
