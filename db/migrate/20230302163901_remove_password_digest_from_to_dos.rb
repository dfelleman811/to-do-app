class RemovePasswordDigestFromToDos < ActiveRecord::Migration[7.0]
  def change
    remove_column :to_dos, :password_digest, :string
  end
end
