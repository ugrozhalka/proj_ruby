class CreateFulfillmets < ActiveRecord::Migration[8.0]
  def change
    create_table :fulfillments do |t|
      t.integer :creator_id, null: false
      t.integer :performer_id, null: false
      t.integer :wish_id, null: false

      t.timestamps
    end
  end
end
