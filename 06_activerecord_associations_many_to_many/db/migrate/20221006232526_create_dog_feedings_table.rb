class CreateDogFeedingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_feedings do |t|
      t.integer :dog_id
      t.integer :feeding_id
    end
  end
end
