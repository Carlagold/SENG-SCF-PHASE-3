class AddDefaultColumnClassName < ActiveRecord::Migration[6.1]
  def change
    add_column :dog_walks, :name, :string, default: "DOG_WALK"
  end
end
