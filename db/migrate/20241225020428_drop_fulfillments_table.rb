class DropFulfillmentsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :fulfillments if table_exists?(:fulfillments)
  end
end
