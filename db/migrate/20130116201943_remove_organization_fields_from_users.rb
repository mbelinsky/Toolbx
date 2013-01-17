class RemoveOrganizationFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :type
    remove_column :users, :sector_cd
    rename_column :users, :name, :first_name
    rename_column :users, :surname, :last_name
  end
end
