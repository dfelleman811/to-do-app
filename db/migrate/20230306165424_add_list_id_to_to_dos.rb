class AddListIdToToDos < ActiveRecord::Migration[7.0]
  def change
    add_column :to_dos, :list_id, :integer
  end
end
