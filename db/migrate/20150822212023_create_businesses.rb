class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :url
      t.string :address
      t.string :rating

      t.timestamps null: false
    end
  end
end
