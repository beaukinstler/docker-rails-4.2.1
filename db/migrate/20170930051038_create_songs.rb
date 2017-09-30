class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :length
      t.string :published_by

      t.timestamps null: false
    end
  end
end