class CreateControls < ActiveRecord::Migration[6.1]
  def change
    create_table :controls do |t|
    	t.boolean :registrations_enabled
      t.timestamps
    end
  end
end
