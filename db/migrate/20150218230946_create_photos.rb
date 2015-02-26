class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :url
      t.integer :attraction_id

      t.timestamps null: false
    end
  end
end
