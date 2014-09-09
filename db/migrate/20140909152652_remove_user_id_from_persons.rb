class RemoveUserIdFromPersons < ActiveRecord::Migration
  def change
    remove_column :people, :user_id
  end
end
