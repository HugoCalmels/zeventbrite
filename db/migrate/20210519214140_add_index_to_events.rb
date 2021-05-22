class AddIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :price, :integer
    add_column :events, :location, :string
  end
end
