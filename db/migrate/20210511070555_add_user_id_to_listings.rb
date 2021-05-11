class AddUserIdToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference(:listings, :user)
  end
end
