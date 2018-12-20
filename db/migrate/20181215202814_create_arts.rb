class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.integer :year
      t.string :image_link
      t.string :image
      t.string :location_link
      t.string :address
      t.float  :latitude
      t.float  :longitude
      t.string :view_link

      t.timestamps
    end
  end
end
