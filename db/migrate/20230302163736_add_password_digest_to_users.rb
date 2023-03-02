class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :to_dos, :password_digest, :string
  end
end
