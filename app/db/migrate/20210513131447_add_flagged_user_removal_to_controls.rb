class AddFlaggedUserRemovalToControls < ActiveRecord::Migration[6.1]
  def change
    add_column :controls, :flagged_user_removal, :boolean, default: true
  end
end
