class CreateWalksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      t.datetime :time
      t.belongs_to :dog
      # t.integer :dog_id
    end
  end
end
