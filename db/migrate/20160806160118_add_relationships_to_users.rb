class AddRelationshipsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :organization, foreign_key: true
    add_reference :users, :user_role, foreign_key: true
  end
end
