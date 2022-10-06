class RemoveColumnFromFeedings < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedings, :another, :string
  end
end
