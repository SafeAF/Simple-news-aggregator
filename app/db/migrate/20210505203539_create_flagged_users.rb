class CreateFlaggedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :flagged_users do |t|
      t.integer :user_id
      t.text :reason
      t.timestamps
    end
  end
end
