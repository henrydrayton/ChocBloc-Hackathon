class RemoveLoginIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column(:users, :login_id, :bigint)
  end
end
