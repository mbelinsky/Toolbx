class AddNeedsPasswordSetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :needs_password_set, :boolean, default: false
  end
end
