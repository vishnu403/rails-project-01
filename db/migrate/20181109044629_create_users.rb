class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.integer :phone_no

      t.timestamps null: false
    end
  end
end
