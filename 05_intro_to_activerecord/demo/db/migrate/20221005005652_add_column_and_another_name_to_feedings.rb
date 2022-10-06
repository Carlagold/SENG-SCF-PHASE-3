class AddColumnAndAnotherNameToFeedings < ActiveRecord::Migration[6.1]
  def change
    add_column :feedings, :name, :string
  end
end
