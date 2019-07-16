class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :county
      t.string :country

      t.timestamps
    end
  end
end
