class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :description
      t.boolean :is_complete

      t.timestamps
    end
  end
end
