class AddDoctypeToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_column :favourites, :doctype, :string
  end
end
