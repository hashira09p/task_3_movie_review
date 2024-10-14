class RenameOldTableNameToNewTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :genres
  end
end
