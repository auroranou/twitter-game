class AddIsOwnerToGroupsUsers < ActiveRecord::Migration
  def change
  	add_column :groups_users, :is_owner?, :boolean
  end
end
