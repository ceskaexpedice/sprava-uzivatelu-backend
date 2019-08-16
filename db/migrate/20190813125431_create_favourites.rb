class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.string :kramerius
      t.string :uuid
      t.string :title
      t.string :author
      t.string :date

      t.timestamps
    end
  end
end
