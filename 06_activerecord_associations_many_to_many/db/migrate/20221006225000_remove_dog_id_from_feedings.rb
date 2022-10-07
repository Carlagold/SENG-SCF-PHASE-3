class RemoveDogIdFromFeedings < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedings, :dog_id, :integer
  end
end
