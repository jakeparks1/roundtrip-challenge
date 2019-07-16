class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :external_id
      t.string :external_id_type
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
