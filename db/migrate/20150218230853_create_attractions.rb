class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :location
      t.string :url
      t.integer :vacation_id

      t.timestamps null: false
    end
  end
end
