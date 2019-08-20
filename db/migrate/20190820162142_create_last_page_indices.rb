class CreateLastPageIndices < ActiveRecord::Migration[5.2]
  def change
    create_table :last_page_indices do |t|
      t.references :user, foreign_key: true
      t.string :kramerius
      t.string :uuid
      t.integer :index
      t.timestamps
    end
    add_index :last_page_indices, [:kramerius, :uuid],     unique: true
  end
end
