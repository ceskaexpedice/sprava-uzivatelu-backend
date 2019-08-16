class AddPolicyToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_column :favourites, :policy, :string
  end
end
