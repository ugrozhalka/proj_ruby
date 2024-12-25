class RemoveColumnFromFulfillments < ActiveRecord::Migration[8.0]
  def change
    remove_columns(:fulfillments, :perform_at)
  end
end
