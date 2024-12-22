class RemoveColumnsFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_columns(:users, :reset_password_token,:encrypted_password,:reset_password_sent_at,:remember_created_at)
  end
end
