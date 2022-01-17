class AddReferenceAndStatusToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships, :requester, foreign_key: { to_table: :users }
    add_reference :friendships, :requested, foreign_key: { to_table: :users }
    add_column :friendships, :status, :integer
  end
end
