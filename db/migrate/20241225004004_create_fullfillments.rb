class CreateFullfillments < ActiveRecord::Migration[8.0]
  def change
    create_table :fulfillments do |t|
      t.integer :id_creator, null: false
      t.integer :id_performer, null: false
      t.integer :id_wish, null: false
      t.datetime :perform_at, null: false

      t.timestamps
    end
  end
end
