class AddPolymorphicToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :addressable_id, :bigint
    add_column :addresses, :addressable_type, :string
  end
end
