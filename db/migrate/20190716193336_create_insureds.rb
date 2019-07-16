class CreateInsureds < ActiveRecord::Migration[6.0]
  def change
    create_table :insureds do |t|
      t.string :identifiers, array: true, default: nil
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.string :relationship
      t.date :date_of_birth
      t.string :sex
      t.references :insurance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
