class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :external_id
      t.string :external_id_type
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
