class CreateInsurances < ActiveRecord::Migration[6.0]
  def change
    create_table :insurances do |t|
      t.string :member_number
      t.string :group_number
      t.string :group_name
      t.date :effective_date
      t.date :expiration_date
      t.string :policy_number
      t.string :agreement_type
      t.string :coverage_type

      t.timestamps
    end
  end
end
