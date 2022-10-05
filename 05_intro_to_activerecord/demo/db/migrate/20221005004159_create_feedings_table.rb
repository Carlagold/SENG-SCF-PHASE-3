class CreateFeedingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :feedings do |t|
      t.datetime :time
      t.belongs_to :dog
    end
  end
end
