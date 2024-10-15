class AddColumnInMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :average_rating, :integer
  end
end
