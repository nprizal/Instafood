class AddDetailToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :restaurant, :string
    add_column :posts, :location, :string
    add_column :posts, :menu, :string
    add_column :posts, :price, :string
  end
end
