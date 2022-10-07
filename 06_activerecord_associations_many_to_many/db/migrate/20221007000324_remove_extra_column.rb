class RemoveExtraColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :dog_walks, :name, :string
  end
end
