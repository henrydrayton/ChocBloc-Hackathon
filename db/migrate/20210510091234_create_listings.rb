class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.integer :age
      t.integer :rating
      t.string :description

      t.timestamps
    end
  end
end
